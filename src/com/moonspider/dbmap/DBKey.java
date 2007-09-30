/*
 * Copyright (c) 2007, Dave Brown and Sam Pullara
 */

package com.moonspider.dbmap;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Comparator;

/**
 * Created by IntelliJ IDEA.
 * User: sam
 * Date: Jul 11, 2005
 * Time: 11:52:27 AM
 * To change this template use File | Settings | File Templates.
 */
public class DBKey extends Object {
    
    public static final Comparator COMP = new Comparator() {
        public int compare(Object o1, Object o2) {
            DBKey a = (DBKey) o1;
            DBKey b = (DBKey) o2;
            if (!a.fktable.equals(b.fktable)) {
                return a.fktable.compareTo(b.fktable);
            }
            if (!a.fkcolumn.equals(b.fkcolumn)) {
                return a.fkcolumn.compareTo(b.fkcolumn);
            }
            return 0;
        }
    };
    public String getTable() {
        return table;
    }

    public void setTable(String table) {
        this.table = table;
    }

    public String getColumn() {
        return column;
    }

    public void setColumn(String column) {
        this.column = column;
    }

    public String getFkcolumn() {
        return fkcolumn;
    }

    public void setFkcolumn(String fkcolumn) {
        this.fkcolumn = fkcolumn;
    }

    public UpdateRule getUpdate() {
        return update;
    }

    public void setUpdate(UpdateRule update) {
        this.update = update;
    }

    public DeleteRule getDelete() {
        return delete;
    }

    public void setDelete(DeleteRule delete) {
        this.delete = delete;
    }

    public String toString() {
        return "DBKey{"
                + "table='" + table + "'"
                + ", column='" + column + "'"
                + ", fktable='" + fktable + "'"
                + ", fkcolumn='" + fkcolumn + "'"
                + ", update=" + update
                + ", delete=" + delete
                + "}";
    }

    public String getFktable() {
        return fktable;
    }

    public void setFktable(String fktable) {
        this.fktable = fktable;
    }

    enum UpdateRule {
        importedNoAction,
        importedKeyCascade,
        importedKeySetNull,
        importedKeySetDefault,
        importedKeyRestrict
    }

    enum DeleteRule {
        importedKeyNoAction,
        importedKeyCascade,
        importedKeySetNull,
        importedKeyRestrict,
        importedKeySetDefault
    }

    private String table;
    private String column;
    private String fktable;
    private String fkcolumn;
    private UpdateRule update;
    private DeleteRule delete;

    public DBKey(ResultSet rs) throws SQLException {
        setTable(rs.getString("PKTABLE_NAME"));
        setColumn(rs.getString("PKCOLUMN_NAME"));
        setFktable(rs.getString("FKTABLE_NAME"));
        setFkcolumn(rs.getString("FKCOLUMN_NAME"));
        setUpdate(UpdateRule.values()[rs.getInt("UPDATE_RULE")]);
        setDelete(DeleteRule.values()[rs.getInt("DELETE_RULE")]);
    }

    
}

