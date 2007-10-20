/*
 * Copyright (c) 2007, Dave Brown and Sam Pullara
 */

package com.moonspider.dbmap;

import java.util.Collection;

public class DBTest extends AbstractDBTest {

    private DB db;
    
    protected void setUp() throws Exception {
        super.setUp();
        db = new DB(conn, null);
    }

    public void testGetTables() {
        log("testGetTables()");
        Collection<DBTable> tables = db.getTables();
        
        assertEquals("expected " + tableMap.size() + " tables, got " + tables.size(),
                tableMap.size(), tables.size());
    }

    public void testGetTable() {
        log("testGetTable()");
        DBTable tab = db.getTable("PARTS");
        assertNotNull("cannot find table 'PARTS'", tab);
        assertEquals(tab.getName(), "PARTS");
    }

    public void testGetColumns() {
        DBTable tab = db.getTable("PARTS");
        assertNotNull("cannot find table 'PARTS'", tab);
        Collection<DBColumn> cols = tab.getColumns();
        assertEquals(5, cols.size());
    }
    
    /*
    public void testAlwaysFail() {
        fail("intentional failure");
    }
    */

}
