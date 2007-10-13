/*
 * Copyright (c) 2007, Dave Brown and Sam Pullara
 */

package com.moonspider.dbmap;

import com.sampullara.cli.Args;
import org.apache.velocity.Template;
import org.apache.velocity.VelocityContext;
import org.apache.velocity.app.Velocity;

import java.io.File;
import java.io.FileWriter;
import java.io.Writer;
import java.sql.Connection;
import java.sql.Driver;
import java.util.List;
import java.util.Properties;

public class Generator {

    private GenerateConfig conf;

    public void generate() throws Exception {
        DB db = getDB();
        conf.merge(db);
        for (TableConfig tc : conf.getTables()) {
            if (!tc.isJoinTable() && !tc.isSkip() && !tc.getName().equalsIgnoreCase("db_version")) {
                generateBean(tc);
            }
        }
        String hibernate = conf.getHibernate();
        if (hibernate != null) {
            File f = new File(hibernate);
            generateHibernate(f);
        }
    }

    private void generateHibernate(File dir) throws Exception {
        dir.mkdirs();
        Template tp = Velocity.getTemplate("com/moonspider/dbmap/hibernate.template");
        VelocityContext ctx = new VelocityContext();
        Writer w = new FileWriter(new File(dir, "hibernate.cfg.xml"));
        try {
            ctx.put("conf", conf);
            tp.merge(ctx, w);
            w.flush();
        } finally {
            w.close();
        }
    }

    private void generateBean(TableConfig tc) throws Exception {
        File dir = new File(conf.getDestinationDirectory());
        dir = new File(dir, conf.getPkg().replace('.', File.separatorChar));
        File f = new File(dir, tc.getClassName() + "." + conf.getExtension());
        generateBean(tc, f);
    }

    private void generateBean(TableConfig tc, File f) throws Exception {
        f.getParentFile().mkdirs();
        Template tp = Velocity.getTemplate("com/moonspider/dbmap/" + conf.getType() + ".template");
        VelocityContext ctx = new VelocityContext();
        Writer w = new FileWriter(f);
        try {
            ctx.put("db", getDB());
            ctx.put("conf", conf);
            ctx.put("table", tc);
            tp.merge(ctx, w);
            w.flush();
        } finally {
            w.close();
        }
    }

    private DB getDB() throws Exception {
        Driver driver = (Driver) Class.forName(conf.getDriver()).newInstance();
        Properties props = new Properties();
        props.put("user", conf.getUser());
        props.put("password", conf.getPassword());
        Connection conn = driver.connect(conf.getUrl(), props);
        DB db = new DB(conn);
        conn.close();
        return db;
    }


    /**
     * @param args
     */
    public static void main(String[] args) throws Exception {
        initVelocity();
        Generator gen = new Generator();
        GenerateConfig gc = new GenerateConfig();
        try {
            List<String> configs = Args.parse(gc, args);
            if (configs.size() == 0) {
                gen.setConfig(gc);
                gen.generate();
            } else {
                for (String config : configs) {
                    gen.setConfig(GenerateConfig.load(config));
                    gen.generate();
                }
            }
        } catch (Exception e) {
            System.out.println("Error: " + e);
            if (new Boolean(System.getProperty("debug", "false"))) {
                e.printStackTrace();
            }
            Args.usage(gc);
            System.exit(1);
        }

    }

    public GenerateConfig getConfig() {
        return conf;
    }

    public void setConfig(GenerateConfig conf) {
        this.conf = conf;
    }

    private static void usage() {
        System.err.println("usage: Generator <config-file>");
        System.exit(1);
    }

    static void initVelocity() throws Exception {
        Properties props = new Properties();
        props.put(
                Velocity.RUNTIME_LOG_LOGSYSTEM_CLASS,
                "org.apache.velocity.runtime.log.NullLogSystem"
        );
        props.put("resource.loader", "class");
        props.put("class.resource.loader.class",
                "org.apache.velocity.runtime.resource.loader.ClasspathResourceLoader");
        Velocity.init(props);
    }
}
