/*
 * Copyright (c) 2007, Dave Brown and Sam Pullara
 */

package com.moonspider.dbmap;

import javax.xml.bind.annotation.XmlElement;
import java.util.*;

public class ColumnConfig {

    public static final Comparator COMP = new Comparator() {
        public int compare(Object x, Object y) {
            ColumnConfig a = (ColumnConfig) x;
            ColumnConfig b = (ColumnConfig) y;
            return a.name.compareTo(b.name);
        }
    };
    private String name, fieldName;
    private String javaType = null;
    private boolean nullable, primKey, unique;
    private TableConfig tableConfig;
    private boolean xmlTransient;
    private String xmlAttributeName, xmlElementName;
    private String getterAccess = "public";
    private String setterAccess = null;
    private boolean temporalType;

    /* column that we point to as a foreign key, if any */
    private ColumnConfig fkColumn;
    /* columns that point to us as a foreign key, if any */
    private List<ColumnConfig> importedKeys = new ArrayList<ColumnConfig>();

    ColumnConfig() {
    }

    public ColumnConfig(TableConfig t) {
        tableConfig = t;
    }

    /* construct column spec using default settings */
    public ColumnConfig(DBColumn col, TableConfig t) {
        this(t);
        merge(col);
    }

    /* accept any default settings only for things not already set */
    public void merge(DBColumn col) {
        if (name == null) {
            name = col.getName();
        }

        if (fieldName == null) {
            fieldName = Util.toPropName(name);
        }
        nullable = col.isNullable();
        if (javaType == null) {
            if (isNullable()) {
                javaType = TYPEMAP_NULLABLE.get(col.getType());
            } else {
                javaType = TYPEMAP.get(col.getType());
            }
            if (javaType == null) {
                throw new RuntimeException(
                        "Cannot map SQL type to java: SQL type=" + col.getType()
                                + " for table=" + getTableConfig().getName()
                                + " column=" + getName()
                );
            }
        }
        if (javaType.equals("java.util.Date")) {
            temporalType = true;
        }
        primKey = col.isPrimKey();
        unique = (col.isUnique() || primKey);
    }

    @XmlElement(name = "getter-access")
    public String getGetterAccess() {
        return getterAccess;
    }

    public void setGetterAccess(String ga) {
        getterAccess = ga;
    }

    @XmlElement(name = "setter-access")
    public String getSetterAccess() {
        if (setterAccess != null) {
            return setterAccess;
        }
        return (getFkey() != null || isPrimKey()) ? "private" : "public";
    }

    public void setSetterAccess(String sa) {
        setterAccess = sa;
    }


    @XmlElement(name = "field-name")
    public String getFieldName() {
        return fieldName;
    }

    public void setFieldName(String fieldName) {
        this.fieldName = fieldName;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @XmlElement(name = "xml-transient")
    public boolean isXmlTransient() {
        return xmlTransient;
    }

    public void setXmlTransient(boolean b) {
        xmlTransient = b;
    }

    @XmlElement(name = "xml-attribute-name")
    public String getXmlAttributeName() {
        return xmlAttributeName;
    }

    public void setXmlAttributeName(String s) {
        xmlAttributeName = s;
    }

    @XmlElement(name = "xml-element-name")
    public String getXmlElementName() {
        return xmlElementName;
    }

    public void setXmlElementName(String s) {
        xmlElementName = s;
    }

    @XmlElement(name = "java-type")
    public String getJavaType() {
        return javaType;
    }

    public void setJavaType(String jt) {
        javaType = jt;
    }

    public String getFieldUpcase() {
        if (fieldName.length() == 1) {
            return "" + Character.toUpperCase(fieldName.charAt(0));
        }
        return Character.toUpperCase(fieldName.charAt(0)) + fieldName.substring(1);
    }

    public String getXmlAnnotation() {
        String ret = null;
        if (this.isXmlTransient()) {
            ret = "@XmlTransient";
        } else if (getXmlAttributeName() != null) {
            ret = "@XmlAttribute(name = \"" + getXmlAttributeName() + "\")";
        } else if (getXmlElementName() != null) {
            ret = "@XmlElement(name = \"" + getXmlElementName() + "\")";
        } else if (isPrimKey()) {
            ret = "    @XmlAttribute";
        }
        return ret;
    }

    public List<ColumnConfig> getImportedKeys() {
        return importedKeys;
    }

    public ColumnConfig getFkey() {
        return fkColumn;
    }

    public void setFkey(ColumnConfig otherColumn) {
        fkColumn = otherColumn;
    }

    public TableConfig getTableConfig() {
        return tableConfig;
    }

    public boolean isPrimKey() {
        return primKey;
    }

    public boolean isNullable() {
        return nullable;
    }

    public boolean isUnique() {
        return unique;
    }

    public String getAnnotation() {
        String ret = null;
        if (isPrimKey()) {
            ret = "@Id\n"
                    + "    @GeneratedValue(strategy=GenerationType.IDENTITY)\n"
                    + "    @Column(name=\"" + getName() + "\")";
        } else if (getFkey() != null) {
            ret = "@Column(name=\"" + getName()
                    + "\", insertable=false, updatable=false)";
        } else {
            ret = "@Column(name=\"" + getName() + "\", nullable=" + isNullable() + ")";
        }
        if ("java.sql.Blob".equals(getJavaType())
                || "java.sql.Clob".equals(getJavaType())) {
            ret += "\n    @Lob @Basic(fetch = FetchType.LAZY)";
        }
        if (temporalType) {
            ret += "\n    @Temporal(TemporalType.TIMESTAMP)";
        }
        return ret;
    }

    private static final Map<String, String> TYPEMAP = new HashMap<String, String>();

    static {
        TYPEMAP.put("TIMESTAMP", "java.util.Date");
        TYPEMAP.put("DATE", "java.util.Date");
        TYPEMAP.put("INTEGER", "int");
        TYPEMAP.put("SMALLINT", "int");
        TYPEMAP.put("BIT", "boolean");
        TYPEMAP.put("VARCHAR", "String");
        TYPEMAP.put("BINARY", "java.io.Serializable");
        TYPEMAP.put("DOUBLE", "double");
        TYPEMAP.put("OTHER", "Object");
        TYPEMAP.put("BIGINT", "java.math.BigInteger");
        TYPEMAP.put("BOOLEAN", "boolean");
    }

    private static final Map<String, String> TYPEMAP_NULLABLE = new HashMap<String, String>();

    static {
        TYPEMAP_NULLABLE.put("TIMESTAMP", "java.util.Date");
        TYPEMAP_NULLABLE.put("DATE", "java.util.Date");
        TYPEMAP_NULLABLE.put("INTEGER", "Integer");
        TYPEMAP_NULLABLE.put("SMALLINT", "Integer");
        TYPEMAP_NULLABLE.put("BIGINT", "java.math.BigInteger");
        TYPEMAP_NULLABLE.put("BIT", "Boolean");
        TYPEMAP_NULLABLE.put("VARCHAR", "String");
        TYPEMAP_NULLABLE.put("BINARY", "java.io.Serializable");
        TYPEMAP_NULLABLE.put("ARRAY", "Object[]");
        TYPEMAP_NULLABLE.put("OTHER", "Object");
        TYPEMAP_NULLABLE.put("DOUBLE", "Double");
        TYPEMAP_NULLABLE.put("BOOLEAN", "Boolean");
    }

    public String toString() {
        String s = "[ColumnConfig: name=" + name + " unique=" + isUnique();
        ColumnConfig fk = getFkey();
        if (fk != null) {
            s += " fkey=" + fk.getTableConfig().getName() + '.' + fk.getName();
        }
        return s + "]";
    }
}
