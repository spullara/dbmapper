/*
 * Copyright (c) 2007, Dave Brown and Sam Pullara
 */

package com.moonspider.dbmap;

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

    private String destinationDirectory, url, pkg, user, password;
    private String webserviceDirectory, webserviceClass;
    private String globalExtends, globalImplements;
    private List<TableConfig> tables;
    private String driver;

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

    @XmlElement(name = "webservice-directory")
    public String getWebserviceDirectory() {
        return webserviceDirectory;
    }

    public void setWebserviceDirectory(String s) {
        webserviceDirectory = s;
    }

    @XmlElement(name = "webservice-class")
    public String getWebserviceClass() {
        return webserviceClass;
    }

    public void setWebserviceClass(String s) {
        webserviceClass = s;
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
}
