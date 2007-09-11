package com.moonspider.dbmap;

import java.io.File;
import java.io.FileWriter;
import java.io.Writer;
import java.sql.Connection;
import java.sql.Driver;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import org.apache.velocity.Template;
import org.apache.velocity.VelocityContext;
import org.apache.velocity.app.Velocity;

public class Generator {

    private GenerateConfig conf;

    public void generate() throws Exception {
        DB db = getDB();
        conf.merge(db);
        //generateBean(conf.findTable("module"), new File("/tmp/Module.java"));
        for (TableConfig tc : conf.getTables()) {
            if (!tc.isJoinTable() && !tc.isSkip()) {
                generateBean(tc);
            }
        }
        generateWS();
    }

    private void generateBean(TableConfig tc) throws Exception {
        File dir = new File(conf.getDestinationDirectory());
        dir = new File(dir, conf.getPkg().replace('.', File.separatorChar));
        File f = new File(dir, tc.getClassName() + ".java");
        generateBean(tc, f);
    }
    
    private void generateWS() throws Exception {
        String path = conf.getWebserviceDirectory();
        String clazz = conf.getWebserviceClass();
        if (path == null || clazz == null) {
            return;
        }
        int ind = clazz.lastIndexOf('.');
        String pkg = clazz.substring(0, ind);
        String cname = clazz.substring(ind + 1);
        WS ws = new WS();
        ws.setPkg(pkg);
        ws.setClassName(cname);
        //File dir = new File(conf.getDestinationDirectory());
        File dir = new File(path);
        //dir = new File(dir, conf.getPkg().replace('.', File.separatorChar));
        dir = new File(dir, pkg.replace('.', File.separatorChar));
        File f = new File(dir, ws.getClassName() + ".java");
        Template tp = getTemplate("ws.template");
        VelocityContext ctx = new VelocityContext();
        Writer w = new FileWriter(f);
        try {
            ctx.put("conf", conf);
            ctx.put("ws", ws);
            tp.merge(ctx, w);
        } finally {
            w.close();
        }
    }

    private Template getTemplate(String name) throws Exception {
        Template tp = null;
        String tpath = name;
        /*
        if (name.charAt(0) != '/') {
            tpath = "com/moonspider/dbmap/" + name;
        }
        try {
            tp = Velocity.getTemplate(tpath);
        } catch (Exception e) {
        }
        */
        try {
            tp = Velocity.getTemplate(name);
        } catch (Exception ex) {
            tp = Velocity.getTemplate('/' + name);
        }
        return tp;
    }

    private void generateBean(TableConfig tc, File f) throws Exception {
        f.getParentFile().mkdirs();
        Template tp = getTemplate("ejb.template");
        VelocityContext ctx = new VelocityContext();
        Writer w = new FileWriter(f);
        try {
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
        if (args.length != 1) {
            usage();
        }
        //Velocity.init();
        initVelocity();
        Generator gen = new Generator();
        gen.setConfig(GenerateConfig.load(args[0]));
        gen.generate();
    }

    public class WS {
        private String className, pkg;
        public List<String> getTypes() {
            List<String> ret = new ArrayList<String>();
            for (TableConfig tc : conf.getTables()) {
                if (!tc.isSkip() && !tc.isJoinTable() && !"Work".equals(tc.getClassName())
                        && !"work".equals(tc.getName())) {
                    ret.add(tc.getClassName());
                }
            }
            System.err.println("WS has " + ret.size() + " classes");
            return ret;
        }
        public String getClassName() {
            return className;
        }
        public void setClassName(String className) {
            this.className = className;
        }
        public String getPkg() {
            return pkg;
        }
        public void setPkg(String pkg) {
            this.pkg = pkg;
        }
    }
    public GenerateConfig getConfig() { return conf; }

    public void setConfig(GenerateConfig conf) { this.conf = conf; }

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
        Velocity.init(props);
        props.put("resource.loader", "file, class");
        props.put("file.resource.loader.class",
                  "org.apache.velocity.runtime.resource.loader.ClasspathResourceLoader");
        props.put("file.resource.loader.path", ".");
        props.put("class.resource.loader.class",
                  "org.apache.velocity.runtime.resource.loader.ClasspathResourceLoader");
    }
}
