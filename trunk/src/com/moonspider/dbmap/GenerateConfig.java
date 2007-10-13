/*
 * Copyright (c) 2007, Dave Brown and Sam Pullara
 */

package com.moonspider.dbmap;

import com.sampullara.cli.Argument;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.Unmarshaller;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import java.io.File;
import java.util.ArrayList;
import java.util.List;

@XmlRootElement(name = "generate-config")
@XmlAccessorType(value = XmlAccessType.PROPERTY)
public class GenerateConfig {


    @Argument(alias = "t", description = "The type to generate, either 'jpa' or 'gorm' (experimental)")
    private String type = "jpa";
    @Argument(alias = "d", description = "Destination directory")
    private String destinationDirectory;
    @Argument(description = "The url of the database")
    private String url;
    @Argument(alias = "package", description = "The target package")
    private String pkg = "";
    @Argument(alias = "u", description = "Database user")
    private String user = "sa";
    @Argument(alias = "p", description = "Database password")
    private String password = "";
    @Argument(alias = "extends", description = "Class for all Java classes to extend")
    private String globalExtends;
    @Argument(alias = "implements", description = "Class for all Java classes to implement")
    private String globalImplements;
    @Argument(description = "Database drive class")
    private String driver;
    @Argument(alias = "ext", description = "File extension for the generated code")
    private String extension = "java";
    @Argument(description = "Generate hibernate.cfg.xml to this directory")
    private String hibernate;
    @Argument(description = "Enable xml binding generation")
    private boolean jaxb = false;
    
    private List<TableConfig> tables;

    public GenerateConfig() {
        tables = new ArrayList<TableConfig>();
    }

    @XmlElement(name = "destination-directory")
    public String getDestinationDirectory() {
        return destinationDirectory;
    }

    public void setDestinationDirectory(String destinationDirectory) {
        this.destinationDirectory = destinationDirectory;
    }

    @XmlElement(name = "extends")
    public String getGlobalExtends() {
        return globalExtends;
    }

    public void setGlobalExtends(String s) {
        globalExtends = s;
    }

    @XmlElement(name = "implements")
    public String getGlobalImplements() {
        return globalImplements;
    }

    public void setGlobalImplements(String s) {
        globalImplements = s;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getDriver() {
        if (driver == null) {
            return "org.h2.Driver";
        }
        return driver;
    }

    public void setDriver(String driver) {
        this.driver = driver;
    }

    @XmlElement(name = "package")
    public String getPkg() {
        return pkg;
    }

    public void setPkg(String pkg) {
        this.pkg = pkg;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public TableConfig getTable(String name) {
        for (TableConfig tc : tables) {
            if (name.equals(tc.getName())) {
                return tc;
            }
        }
        return null;
    }

    @XmlElement(name = "table")
    public List<TableConfig> getTables() {
        return tables;
    }

    public void setTables(List<TableConfig> t) {
        tables = t;
    }

    public void merge(DB db) {
        for (DBTable dbtable : db.getTables()) {
            TableConfig tconf = findTable(dbtable.getName());
            if (tconf == null) {
                tconf = new TableConfig(dbtable);
                //System.err.println("[Config.merge()]: adding table '" + dbtable.getName() + "'");
                getTables().add(tconf);
            } else {
                tconf.merge(dbtable);
            }
        }
        for (DBTable dbtable : db.getTables()) {
            TableConfig tconf = findTable(dbtable.getName());
            tconf.mergeKeys(this, dbtable);
        }

    }

    public TableConfig findTable(String name) {
        TableConfig ret = null;
        for (TableConfig table : tables) {
            if (name.equalsIgnoreCase(table.getName())) {
                ret = table;
                break;
            }
        }
        return ret;
    }

    public String getImplementsClause(String tableName) {
        String impl = findTable(tableName).getTableImplements();
        if (impl != null) {
            impl = impl.trim();
            impl = "implements " + impl + " ";
        } else {
            impl = "";
        }
        return impl;
    }

    public String findClassName(String tableName) {
        return findTable(tableName).getClassName();
    }

    public String findColumnFieldName(String tableName, String columnName) {
        return findTable(tableName).findColumn(columnName).getFieldName();
    }

    public static GenerateConfig load(String xmlPath) throws Exception {
        File f = new File(xmlPath);
        JAXBContext jxbc = JAXBContext.newInstance(new Class[]{GenerateConfig.class});
        GenerateConfig cfg = null;
        Unmarshaller unmush = jxbc.createUnmarshaller();
        cfg = (GenerateConfig) unmush.unmarshal(f);
        return cfg;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getExtension() {
        return extension;
    }

    public void setExtension(String extension) {
        this.extension = extension;
    }

    public String getHibernate() {
        return hibernate;
    }

    public void setHibernate(String hibernate) {
        this.hibernate = hibernate;
    }

    public Boolean getJaxb() {
        return jaxb;
    }

    public void setJaxb(Boolean jaxb) {
        this.jaxb = jaxb;
    }
}
