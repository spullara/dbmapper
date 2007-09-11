/*
 * Copyright (c) 2005, Gauntlet Systems Corporation. All Rights Reserved.
 */

package com.moonspider.dbmap;

import junit.framework.TestCase;

/**
 * Created by IntelliJ IDEA.
 * User: sam
 * Date: Dec 13, 2005
 * Time: 12:26:10 PM
 * To change this template use File | Settings | File Templates.
 */
public class GenerateBeansTest extends TestCase {
    public void testGenerate() throws Exception {
        Generator.main(new String [] {"test-src/generate.xml"});
    }
}
