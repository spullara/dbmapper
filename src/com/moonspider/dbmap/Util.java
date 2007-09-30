/*
 * Copyright (c) 2007, Dave Brown and Sam Pullara
 */

package com.moonspider.dbmap;

public final class Util {

    private Util() { }
    
    public static String toPropName(String s) {
        s = upcase(s);
        return s.substring(0, 1).toLowerCase() + s.substring(1);
    }

    public static String upcase(String s) {
        s = s.toLowerCase();
        StringBuffer sb = new StringBuffer();
        char c = s.charAt(0);
        sb.append(Character.toUpperCase(c));
        int len = s.length();
        int i = 1;
        while (i < len) {
            c = s.charAt(i);
            if (c == '_' && ++i < len) {
                c = Character.toUpperCase(s.charAt(i));
            }
            sb.append(c);
            i++;
        }
        return sb.toString();
    }
    
    /* remove id-isms */
    public static String unId(String idStr) {
        String ret = idStr;
        int len = idStr.length();
        if (idStr.endsWith("_id")) {
            ret = idStr.substring(0, len - 3);
        } else if (idStr.endsWith("Id")) {
            ret = idStr.substring(0, len - 2);
        }
        return ret;
    }
}
