/*
 * Copyright (c) 2007, Dave Brown and Sam Pullara
 */

package com.moonspider.dbmap;

import junit.framework.TestCase;
import java.sql.Types;

public class DBColumnTest extends TestCase {

    private DBColumn intPrimKey, varChar20;
    private static final String ID = "ID";
    private static final String FNAME = "FIRSTNAME";
    
    public DBColumnTest(String arg0) {
        super(arg0);
        intPrimKey = new DBColumn(ID, Types.INTEGER, false, 4, true);
        intPrimKey.setPrimKey(true);
        varChar20 = new DBColumn(FNAME, Types.VARCHAR, true, 20, false);
    }

    public void testGetName() {
        assertEquals("did not get expected name", intPrimKey.getName(), ID);
        assertEquals("did not get expected name", varChar20.getName(), FNAME);
    }

    public void testIsPrimKey() {
        assertTrue("expected prim. key field", intPrimKey.isPrimKey());
        assertFalse("expected non-prim. key field", varChar20.isPrimKey());
    }

    public void testIsNullable() {
        assertFalse(intPrimKey.isNullable());
        assertTrue(varChar20.isNullable());
    }

    public void testGetSize() {
        assertEquals(intPrimKey.getSize(), 4);
        assertEquals(varChar20.getSize(), 20);
    }

    public void testGetType() {
        assertEquals("INTEGER", intPrimKey.getType());
        assertEquals("VARCHAR", varChar20.getType());
    }

    public void testGetTypeCode() {
        assertEquals(intPrimKey.getTypeCode(), Types.INTEGER);
        assertEquals(varChar20.getTypeCode(), Types.VARCHAR);
    }

    public void testSetPrimKey() {
    }

}
