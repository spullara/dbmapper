/*
 * Copyright (c) 2005, Gauntlet Systems Corporation. All Rights Reserved.
 */

/*
 * Created on Feb 20, 2005
 *
 * TODO To change the template for this generated file go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
package com.moonspider.dbmap;

import java.sql.Types;
import java.util.HashMap;
import java.util.Map;

/**
 * @author David Brown
 *         <p/>
 *         TODO To change the template for this generated type comment go to
 *         Window - Preferences - Java - Code Style - Code Templates
 */
public class DBColumn {

    private String name;
    private boolean primKey, isNullable;
    private int sqlType, size;
    private boolean unique;

    public DBColumn(String name, int sqlType, boolean isNullable, int size, boolean unique) {
        this.name = name;
        this.sqlType = sqlType;
        this.isNullable = isNullable;
        this.size = size;
        this.unique = unique;
    }

    public String getName() {
        return name;
    }

    public boolean isPrimKey() {
        return primKey;
    }

    public boolean isUnique() {
        return unique;
    }

    public boolean isNullable() {
        return isNullable;
    }

    public int getSize() {
        return size;
    }

    public String getType() {
        return type2String(getTypeCode());
    }

    public int getTypeCode() {
        return sqlType;
    }

    public String toString() {
        String ret = name + ' ' + getType() + '(' + getSize() + ')';
        if (!isNullable()) {
            ret += " NOT NULL";
        }
        if (isPrimKey()) {
            ret += " PRIMARY KEY";
        }
        if (isUnique()) {
            ret += " IS UNIQUE";
        }
        return ret;
    }

    /* package */ void setPrimKey(boolean b) {
        primKey = b;
    }

    private static Map<Integer, String> type2StringMap;

    static {
        type2StringMap = new HashMap<Integer, String>();
        type2StringMap.put(Types.BIT, "BIT");
        type2StringMap.put(Types.TINYINT, "TINYINT");
        type2StringMap.put(Types.SMALLINT, "SMALLINT");
        type2StringMap.put(Types.INTEGER, "INTEGER");
        type2StringMap.put(Types.BIGINT, "BIGINT");
        type2StringMap.put(Types.FLOAT, "FLOAT");
        type2StringMap.put(Types.REAL, "REAL");
        type2StringMap.put(Types.DOUBLE, "DOUBLE");
        type2StringMap.put(Types.NUMERIC, "NUMERIC");
        type2StringMap.put(Types.DECIMAL, "DECIMAL");
        type2StringMap.put(Types.CHAR, "CHAR");
        type2StringMap.put(Types.VARCHAR, "VARCHAR");
        type2StringMap.put(Types.LONGVARCHAR, "LONGVARCHAR");
        type2StringMap.put(Types.DATE, "DATE");
        type2StringMap.put(Types.TIME, "TIME");
        type2StringMap.put(Types.TIMESTAMP, "TIMESTAMP");
        type2StringMap.put(Types.BINARY, "BINARY");
        type2StringMap.put(Types.VARBINARY, "VARBINARY");
        type2StringMap.put(Types.LONGVARBINARY, "LONGVARBINARY");
        type2StringMap.put(Types.NULL, "NULL");
        type2StringMap.put(Types.OTHER, "OTHER");
        type2StringMap.put(Types.JAVA_OBJECT, "JAVA_OBJECT");
        type2StringMap.put(Types.DISTINCT, "DISTINCT");
        type2StringMap.put(Types.STRUCT, "STRUCT");
        type2StringMap.put(Types.ARRAY, "ARRAY");
        type2StringMap.put(Types.BLOB, "BLOB");
        type2StringMap.put(Types.CLOB, "CLOB");
        type2StringMap.put(Types.REF, "REF");
        type2StringMap.put(Types.DATALINK, "DATALINK");
        type2StringMap.put(Types.BOOLEAN, "BOOLEAN");
    }

    private static String type2String(int type) {
        String result = type2StringMap.get(type);
        if (result == null) {
            return "<UNKNOWN>";
        }
        return result;
    }
}
