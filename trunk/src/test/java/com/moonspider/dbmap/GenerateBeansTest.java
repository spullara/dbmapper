/*
 * Copyright (c) 2007, Dave Brown and Sam Pullara
 */

package com.moonspider.dbmap;

import com.sampullara.db.Migrate;
import junit.framework.TestCase;

import java.sql.Connection;
import java.sql.Driver;
import java.util.Properties;

/**
 * Created by IntelliJ IDEA.
 * User: sam
 * Date: Dec 13, 2005
 * Time: 12:26:10 PM
 * To change this template use File | Settings | File Templates.
 */
public class GenerateBeansTest extends TestCase {
    public void testSameFieldForeignTableName() throws Exception {
        Driver driver = new org.h2.Driver();
        Properties p = new Properties();
        p.put("user", "bt");
        p.put("password", "");
        Connection conn = driver.connect("jdbc:h2:mem:test_migration3;DB_CLOSE_DELAY=-1", p);
        Migrate.sqlScriptMigrator(conn, "test-data/test1.sql");
        Generator.main(new String[] {
                "-type", "gorm",
                "-d", "test-src",
                "-u", "bt",
                "-p", "",
                "-package", "test.example",
                "-ext", "groovy",
                "-url", "jdbc:h2:mem:test_migration3;DB_CLOSE_DELAY=-1",
        });
    }

    public void testGenerateJPA() throws Exception {
        Driver driver = new org.h2.Driver();
        Properties p = new Properties();
        p.put("user", "bt");
        p.put("password", "");
        Connection conn = driver.connect("jdbc:h2:mem:test_migration;DB_CLOSE_DELAY=-1", p);
        Migrate.sqlScriptMigrator(conn, "test-data/simplelock.sql");
        Generator.main(new String[] { "target/test-classes/generate.xml" });
    }

    public void testGenerateGORM() throws Exception {
        Driver driver = new org.h2.Driver();
        Properties p = new Properties();
        p.put("user", "bt");
        p.put("password", "");
        Connection conn = driver.connect("jdbc:h2:mem:test_migration2;DB_CLOSE_DELAY=-1", p);
        Migrate.sqlScriptMigrator(conn, "test-data/simplelock.sql");

        Generator.main(new String[] {
                "-type", "gorm",
                "-d", "test-src",
                "-u", "bt",
                "-p", "",
                "-package", "gsc.ci.gorm",
                "-ext", "groovy",
                "-url", "jdbc:h2:mem:test_migration2;DB_CLOSE_DELAY=-1",
        });
    }
}
