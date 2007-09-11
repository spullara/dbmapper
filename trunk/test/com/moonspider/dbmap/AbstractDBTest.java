/*
 * Copyright (c) 2005, Gauntlet Systems Corporation. All Rights Reserved.
 */

package com.moonspider.dbmap;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import junit.framework.TestCase;

public abstract class AbstractDBTest extends TestCase {

    protected Connection conn;
    protected String url = "jdbc:hsqldb:mem:dbmap-test";
    protected String driver = "org.hsqldb.jdbcDriver";
    protected String user = "sa";
    protected String passwd = "";
    
    AbstractDBTest() {
        super();
        tableMap.put("DUMMY", TABLE_0);
        tableMap.put("PARTS", TABLE_1);
    }
    
    protected void setUp() throws Exception {
        super.setUp();
        Class.forName(driver);
        conn = DriverManager.getConnection(url, user, passwd);
        createTables();
    }

    protected void tearDown() throws Exception {
        super.tearDown();
        dropTables();
        conn.close();
    }
    
    protected void execute(String sql) throws SQLException {
        Statement stmt = conn.createStatement();
        try {
            stmt.execute(sql);
        } finally {
            stmt.close();
        }
    }
    
    protected void dropTables() throws SQLException {
        Iterator<String> iter = tableMap.keySet().iterator();
        while (iter.hasNext()) {
            execute("DROP TABLE " + iter.next() + ";");
        }
    }
    
    protected void createTables() throws SQLException {
        Iterator<String> iter = tableMap.values().iterator();
        while (iter.hasNext()) {
            execute("CREATE TABLE " + iter.next() + ";");
        }
    }

    protected void log(String msg) {
       System.out.println("[" + shortCName() + "] " + msg); 
    }
    
    protected String shortCName() {
        String s = getClass().getName();
        int ind = s.lastIndexOf('.');
        if (ind > 0) { s = s.substring(ind + 1); }
        return s;
    }
    
    
    protected Map<String, String> tableMap = new HashMap<String, String>();
    
    static final String TABLE_0 = "DUMMY (NAME VARCHAR(20))";
    static final String TABLE_1 = 
        "PARTS ("
        + "pno character(6) NOT NULL PRIMARY KEY, "
        + "pname character(20), "
        + "color character(6), "
        + "weight numeric(3,0), "
        + "city character(15))";    
}
