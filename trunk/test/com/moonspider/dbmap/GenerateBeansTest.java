/*
 * Copyright (c) 2005, Gauntlet Systems Corporation. All Rights Reserved.
 */

package com.moonspider.dbmap;

import com.sampullara.db.Migrate;
import junit.framework.TestCase;

import java.sql.Connection;
import java.sql.Driver;
import java.util.Properties;

import org.hsqldb.jdbcDriver;

/**
 * Created by IntelliJ IDEA.
 * User: sam
 * Date: Dec 13, 2005
 * Time: 12:26:10 PM
 * To change this template use File | Settings | File Templates.
 */
public class GenerateBeansTest extends TestCase {
    public void testGenerate() throws Exception {
        Driver driver = new org.h2.Driver();
        Properties p = new Properties();
        p.put("user", "bt");
        p.put("password", "");
        Connection conn = driver.connect("jdbc:h2:mem:test_migration;DB_CLOSE_DELAY=-1", p);
        Migrate.sqlScriptMigrator(conn, "test-data/simplelock.sql");
        Generator.main(new String [] {"test-src/generate.xml"});
    }
}
