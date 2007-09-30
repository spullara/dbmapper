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
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

/**
 * @author David Brown
 *
 * TODO To change the template for this generated type comment go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
public class DB {
    private Map<String, DBTable> tables = new TreeMap<String, DBTable>();

    public DB(Connection conn) throws SQLException {
        DatabaseMetaData meta = conn.getMetaData();
        ResultSet rs = meta.getTables(null, null, "%", TABLE_TYPE);
        while (rs.next()) {
            String name = rs.getString("TABLE_NAME");
            DBTable table = new DBTable(name, meta);
            tables.put(name, table);
        }
        rs.close();
    }

    public Collection<DBTable> getTables() { return tables.values(); }
        
    public DBTable getTable(String name) {
        return tables.get(name);
    }
        
    private static final String[] TABLE_TYPE = { "TABLE" };
}