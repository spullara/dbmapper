/*
 * Copyright (c) 2005, Gauntlet Systems Corporation. All Rights Reserved.
 */

package com.moonspider.dbmap;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.List;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

public class TableConfig {

    private String tableExtends, tableImplements, className, name;
    private List<ColumnConfig> columns;
    private List<Relation> relations;
    private String extraBody;
    private boolean skip = false;
    private boolean joinTable = false;
    public TableConfig() {
        columns = new ArrayList<ColumnConfig>();
        relations = new ArrayList<Relation>();
    }
    
    /* construct a table spec w/ default settings */
    public TableConfig(DBTable table) {
        this();
        merge(table);
    }

    public Collection<ColumnConfig> getFkeys() {
        ArrayList<ColumnConfig> ret = new ArrayList<ColumnConfig>();
        for (ColumnConfig col : columns) {
            if (col.getFkey() != null) {
                ret.add(col);
            }
        }
        return ret;
    }
    public void mergeKeys(GenerateConfig conf, DBTable table) {
        /* foreign keys */
        for (DBKey key : table.getFkeys()) {
            /* sanity check */
            if (!getName().equals(key.getFktable())) {
                throw new RuntimeException(
                        "table " + getName() + " doesn't grok fkey=" + key
                        );
            }
            //p("table=" + getName() + " has fkey=" + key);
            TableConfig otherTable = conf.findTable(key.getTable());
            ColumnConfig myColumn = findColumn(key.getFkcolumn());
            if (myColumn == null) {
                throw new RuntimeException("cannot find column '" + key.getColumn()
                        + "' on table=" + getName() + " key=" + key);
            }
            ColumnConfig otherColumn = otherTable.findColumn(key.getColumn());
            if (otherColumn == null) {
                throw new RuntimeException("cannot find fkey from '" + getName() + "':"
                        + key);
            }
            myColumn.setFkey(otherColumn);
        }
        /* imported keys */
        for (DBKey key : table.getKeys()) {
            //p("table " + getName() + " has imported key=" + key);
            ColumnConfig myColumn = findColumn(key.getColumn());
            TableConfig otherTable = conf.findTable(key.getFktable());
            ColumnConfig otherColumn = otherTable.findColumn(key.getFkcolumn());
            myColumn.getImportedKeys().add(otherColumn);
        }
    }
    /* merge existing data with any defaults from real DB schema */
    public void merge(DBTable table) {
        joinTable = table.isJoinTable();
        if (name == null) {
            name = table.getName();
        }
        if (className == null) {
            className = Util.upcase(table.getName());
        }
        for (DBColumn dbcol : table.getColumns()) {
            ColumnConfig cconf = findColumn(dbcol.getName());
            if (cconf == null) {
                cconf = new ColumnConfig(dbcol, this);
                getColumns().add(cconf);
            } else {
                cconf.merge(dbcol);
            }
        }
        Collections.sort(columns, ColumnConfig.COMP);
    }
    
    @XmlElement(name = "skip")
    public boolean isSkip() { return skip; }
    public void setSkip(boolean b) { skip = b; }
    
    @XmlElement(name = "name")
    public String getName() {
        return name;
    }

    public void setName(String n) {
        this.name = n;
    }

    @XmlElement(name = "class")
    public String getClassName() {
        return className;
    }

    public void setClassName(String className) {
        this.className = className;
    }
    
    @XmlElement(name = "extends")
    public String getTableExtends() {
        return tableExtends;
    }

    public void setTableExtends(String tableExtends) {
        this.tableExtends = tableExtends;
    }

    @XmlElement(name = "implements")
    public String getTableImplements() {
        return tableImplements;
    }

    public void setTableImplements(String tableImplements) {
        this.tableImplements = tableImplements;
    }
    
    @XmlElement(name = "column")
    public List<ColumnConfig> getColumns() { return columns; }
    public void setColumns(List<ColumnConfig> c) { columns = c; }

    @XmlElement(name = "extra-body")
    public String getExtraBody() {
        return extraBody;
    }

    public void setExtraBody(String extraBody) {
        this.extraBody = extraBody;
    }
    
    @XmlTransient
    public boolean isJoinTable() { return joinTable; }
    public ColumnConfig findColumn(String name) {
        ColumnConfig ret = null;
        for (ColumnConfig col : columns) {
            if (name.equals(col.getName())) {
                ret = col;
                break;
            }
        }
        return ret;
    }
    
    private TableConfig followJoinTable(TableConfig jt) {
        TableConfig ret = null;
        for (ColumnConfig fk : jt.getFkeys()) {
            if (fk.getFkey().getTableConfig() != this) {
                ret = fk.getFkey().getTableConfig();
                //break;
            }
        }
        if (ret == null) {
            throw new IllegalArgumentException("Cannot follow join table: " + jt);
        }
        //p("follow Join: " + jt.getName() + "->" + ret.getName());
        return ret;
    }
    
    private String makeJoinColumn(ColumnConfig name, ColumnConfig ref) {
        StringBuffer sb = new StringBuffer();
        sb.append("@JoinColumn(\n");
        sb.append("        name = \"" + name.getName() + "\",\n");
        sb.append("        referencedColumnName = \"" + ref.getName() + "\"\n");
        sb.append("    )");
        return sb.toString();
    }
    
    private String makeJoinTable(TableConfig tc, ColumnConfig join, ColumnConfig inverse) {
        StringBuffer sb = new StringBuffer();
        sb.append("\n    @JoinTable(\n");
        sb.append("      name=\"" + tc.getName() + "\",\n");
        sb.append("      joinColumns={@JoinColumn(name=\"" + join.getName() + "\")},\n");
        sb.append("      inverseJoinColumns={@JoinColumn(name=\"" + inverse.getName() + "\")}\n");
        sb.append("    )");
        return sb.toString();
    }
    
    private ColumnConfig findJoinPointerToMe(TableConfig jt) {
        ColumnConfig ret = null;
        for (ColumnConfig col : jt.getColumns()) {
            if (this == col.getFkey().getTableConfig()) {
                ret = col;
            }
        }
        //p("found join table pointer to me: " + jt.getName() + "." + ret.getName());
        return ret;
    }
    private ColumnConfig findJoinPointerToOther(TableConfig jt) {
        ColumnConfig ret = null;
        for (ColumnConfig col : jt.getColumns()) {
            if (this != col.getFkey().getTableConfig()) {
                ret = col;
            }
        }
        //p("found join table pointer to other: " + jt.getName() + "." + ret.getName());
        return ret;
    }
    
    public Relation findRelationByName(String name) {
        Relation ret = null;
        for (Relation rel : relations) {
            if (name.equals(rel.getName())) {
                ret = rel;
                break;
            }
        }
        return ret;
    }
    private Relation makeRelation(ColumnConfig left, ColumnConfig right) {
        String leftC, rightC;
        String method, fetch, cascade = null, type;
        String mappedBy = "// not mapped by";
        String join = "// no join column";
        TableConfig rightTable = right.getTableConfig();

        /* if our side is to our prim key, the prop name should derive
         * from the type of the other table
         */
        String propName;

        boolean isJoin = false;
        if (rightTable.isJoinTable()) {
            join = makeJoinTable(rightTable, findJoinPointerToMe(rightTable),
                    findJoinPointerToOther(rightTable));
            rightTable = followJoinTable(rightTable);
            leftC = "Many";
            rightC = "Many";
            propName = rightTable.getClassName();
            cascade = "{}";
            isJoin = true;
        } else {
            leftC = left.isUnique() ? "One" : "Many";
            rightC = right.isUnique() ? "One" : "Many";
            if (left.isPrimKey()) {
                propName = rightTable.getClassName();
            } else {
                propName = left.getName();
            }
            if (propName.endsWith("_id") && !propName.equals("_id")) {
                propName = propName.substring(0, propName.length() - 3);
            }
            if (propName.endsWith("_ref") && !propName.equals("_ref")) {
                propName = propName.substring(0, propName.length() - 4);
            }
            propName = Util.toPropName(propName);
        }

        String relName = left.getName() + "-" + rightTable.getName();
        
        Relation rel = findRelationByName(relName);
        if (rel == null) {
            rel = new Relation();
            rel.setName(relName);
        }
        if (!right.isPrimKey() && !isJoin 
                && !right.getName().startsWith(left.getTableConfig().getName())) {
            String rightName = right.getName().replace(left.getTableConfig().getName(), "");
            rightName = rightName.replace("_id", "");
            rightName = rightName.replace("_ref", "");
            String newname = Util.toPropName(rightName);
            propName = newname + Util.upcase(propName);
            
        }

        /*
        p("makeRelation() " + left.getTableConfig().getName() + '.'
                + left.getName() + "->" + right.getTableConfig().getName()
                + "." + right.getName() + " propName=" + propName);
*/
        if (right.isUnique()) {
            type = rightTable.getClassName();
            method = Util.upcase(propName);
        } else {
            type = "Collection<" + rightTable.getClassName() + ">";
            method = Util.upcase(propName) + "List";
        }
        if (cascade == null) {
            if (left.isUnique()) {
                cascade = "CascadeType.REMOVE";
            } else {
                cascade = "{}";
            }
        }
        fetch = "LAZY";
        if ("One".equals(leftC)) {
            if (!right.isPrimKey()) {
                mappedBy = "mappedBy = \"" + Util.unId(right.getFieldName()) + "\",";
            }
            if ("One".equals(rightC)) {
                fetch = "EAGER";
            }
        } else {
            if ("One".equals(rightC)) {
                fetch = "EAGER";
            }
        }
        if ("One".equals(rightC) && !left.isPrimKey()) {
            join = makeJoinColumn(left, right);
        }
        rel.setCardinality(leftC + "To" + rightC);
        rel.setCascade(cascade);
        rel.setFetchType(fetch);
        rel.setMethod(method);
        rel.setType(type);
        rel.setMappedBy(mappedBy);
        rel.setJoinColumn(join);
        return rel;
    }

    @XmlElement(name = "relation")
    public List<Relation> getRelations() {
        List<Relation> ret = new ArrayList<Relation>();
        for (ColumnConfig col : columns) {
            for (ColumnConfig imp : col.getImportedKeys()) {
                ret.add(makeRelation(col, imp));
            }
        }
        
        for (ColumnConfig col : columns) {
            ColumnConfig other = col.getFkey();
            if (other != null) {
                ret.add(makeRelation(col, other));
            }
        }
        return ret;
    }
    public void setRelations(List<Relation> rels) {
        this.relations = rels;
    }
    
    @XmlRootElement(name = "relation")
    public static class Relation {
        private String cardinality, cascade, fetchType, method, type;
        private String mappedBy = "// not mapped by";
        private String joinColumn = "// no join column";
        private String name;
        private boolean xmlTransient = true;
        
        public Relation() {
        }
        
        @XmlElement(name = "xml-transient")
        public boolean isXmlTransient() { return xmlTransient; }
        public void setXmlTransient(boolean b) { xmlTransient = b; }
        
        public String getName() { return name; }
        public void setName(String name) { this.name = name; }
        
        public String getJoinColumn() {
            return joinColumn;
        }

        public void setJoinColumn(String joinColumn) {
            this.joinColumn = joinColumn;
        }

        public String getCardinality() {
            return cardinality;
        }

        public void setCardinality(String cardinality) {
            this.cardinality = cardinality;
        }

        public String getCascade() {
            return cascade;
        }

        public void setCascade(String cascade) {
            this.cascade = cascade;
        }

        public String getFetchType() {
            return fetchType;
        }

        public void setFetchType(String fetchType) {
            this.fetchType = fetchType;
        }

        public String getMappedBy() {
            return mappedBy;
        }

        public void setMappedBy(String mappedBy) {
            this.mappedBy = mappedBy;
        }

        public String getMethod() {
            return method;
        }

        public void setMethod(String method) {
            this.method = method;
        }

        public String getType() {
            return type;
        }

        public void setType(String type) {
            this.type = type;
        }
        
        public String toString() {
            return "[Relation: name=" + name + "]";
        }
    }
    
    public String toString() {
        return "[TableConfig: name=" + name + "]";
    }
}
