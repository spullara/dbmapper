/*
 * Copyright (c) 2007, Dave Brown and Sam Pullara
 */

/*
 * Created on Feb 21, 2005
 *
 * TODO To change the template for this generated file go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
package com.moonspider.dbmap;

import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

/**
 * @author David Brown
 *         <p/>
 *         TODO To change the template for this generated type comment go to
 *         Window - Preferences - Java - Code Style - Code Templates
 */
public class DB {
    private Map<String, DBTable> tables = new TreeMap<String, DBTable>();

    public DB(Connection conn, String schema) throws SQLException {
        DatabaseMetaData meta = conn.getMetaData();
        ResultSet rs = meta.getTables(null, schema, "%", TABLE_TYPE);
        try {
            while (rs.next()) {
                String name = rs.getString("TABLE_NAME");
                DBTable table = new DBTable(name, schema, meta);
                tables.put(name, table);
            }
        } finally {
            rs.close();
        }

        // Get all the indexed columns
        Set<String> indexes = new HashSet<String>();
        for (DBTable table : tables.values()) {
            ResultSet rs2 = meta.getIndexInfo(null, schema, table.getName(), false, true);
            while (rs2.next()) {
                String index = rs2.getString("TABLE_NAME") + "." + rs2.getString("COLUMN_NAME");
                indexes.add(index);
            }
        }

        // Verify all the keys are covered
        for (DBTable table : tables.values()) {
            for (DBKey key : table.getKeys()) {
                checkIndex(indexes, table.getName(), key.getColumn());
            }
            for (DBKey key : table.getFkeys()) {
                checkIndex(indexes, key.getFktable(), key.getFkcolumn());
            }
        }
    }

    private static Set<String> warned = new HashSet<String>();

    private void checkIndex(Set<String> indexes, String name, String column) {
        String index = name + "." + column;
        if (!indexes.contains(index)) {
            if (!warned.contains(index)) {
                System.err.println("WARNING: No index on " + index);
                warned.add(index);
            }
        }
    }

    public Collection<DBTable> getTables() {
        return tables.values();
    }

    public DBTable getTable(String name) {
        return tables.get(name);
    }

    private static final String[] TABLE_TYPE = {"TABLE"};
}