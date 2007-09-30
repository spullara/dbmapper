/*
 * Copyright (c) 2007, Dave Brown and Sam Pullara
 */

/*
 * Created on Feb 20, 2005
 *
 * TODO To change the template for this generated file go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
package com.moonspider.dbmap;

import java.sql.DatabaseMetaData;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

/**
 * @author David Brown
 *
 * TODO To change the template for this generated type comment go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
public class DBTable {

    private String name;
    private Map<String, DBColumn> cols = new TreeMap<String, DBColumn>();
    private List<DBKey> keys = new ArrayList<DBKey>();
    private List<DBKey> fkeys = new ArrayList<DBKey>();
    private boolean isJoinTable = false;

    public DBTable(String name, DatabaseMetaData meta) throws SQLException {
        this.name = name;
        ResultSet rs;
        List<String> uniqueColumns = getUniqueColumnNames(name, meta);
        rs = meta.getColumns(null, null, name, null);
        while (rs.next()) {
            String colName = rs.getString("COLUMN_NAME");
            boolean nullAllowed = rs.getString("IS_NULLABLE").equals("YES");
            int sqlType = rs.getInt("DATA_TYPE");
            int colSize = rs.getInt("COLUMN_SIZE");
            DBColumn dbcol =
                new DBColumn(colName, sqlType, nullAllowed,
                        colSize, uniqueColumns.contains(colName));
            cols.put(colName, dbcol);
        }
        /* find primary keys */
        rs = meta.getPrimaryKeys(null, null, name);
        while (rs.next()) {
            String colName = rs.getString("COLUMN_NAME");
            //System.err.println("primkey of table " + name + " is " + colName);
            cols.get(colName).setPrimKey(true);
        }
        rs = meta.getExportedKeys(null, null, name);
        while (rs.next()) {
            keys.add(new DBKey(rs));
        }
        rs = meta.getImportedKeys(null, null, name);
        while (rs.next()) {
            fkeys.add(new DBKey(rs));
        }
        if (cols.size() == fkeys.size()) {
            isJoinTable = true;
        }
        Collections.sort(keys, DBKey.COMP);
        Collections.sort(fkeys, DBKey.COMP);
    }

    public String getName() { return name; }
    public boolean isJoinTable() { return isJoinTable; }
    public List<DBKey> getKeys() { return keys; }
    public List<DBKey> getFkeys() { return fkeys; }
    public Collection<DBColumn> getColumns() { return cols.values(); }
    public DBColumn getColumn(String column) { return cols.get(column); }

    public String toString() { return getName(); }
    
    /** retrieve column names that are considered to be <i>singularly</i>
     * unique by the DB.  This excludes columns that have a <i>compound</i>
     * unique constraint.  For example, if the table has a constraint:
     * <pre>
     * ALTER TABLE project ADD CONSTRAINT repositoryId_and_name_unique UNIQUE(repository_id, name);
     * </pre>
     * Then neither repository_id nor name are considered unique (at least
     * just considering the above constraint).
     */
    private static List<String> getUniqueColumnNames(String table, DatabaseMetaData meta)
    throws SQLException {
        List<String> ret = new ArrayList<String>();
        Map<String, String> indicesToCol = new HashMap<String, String>();
        ResultSet rs = meta.getIndexInfo(null, null, table, true, false);
        while (rs.next()) {
            String col = rs.getString("COLUMN_NAME");
            ret.add(col);
            String ind = rs.getString("INDEX_NAME");
            if (ind != null) {
                String compoundOther = indicesToCol.get(ind);
                if (compoundOther != null) {
                    ret.remove(compoundOther);
                    ret.remove(col);
                }
                indicesToCol.put(ind, col);
            }
        }
        return ret;
    }    
}
