import java.lang.reflect.Method

/*
* Copyright 2004-2005 the original author or authors.
*
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*      http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

/**
 * Gant script that handles the creation of domain classes from an existing database
 *
 * @author Sam Pullara
 *
 * @since 1.0
 */

grailsAppName = ""

Ant.property(environment: "env")
grailsHome = Ant.antProject.properties."env.GRAILS_HOME"

includeTargets << new File("${grailsHome}/scripts/Compile.groovy")

pluginHome = new File("./plugins").listFiles().find {
    it.name.startsWith('dbmapper-')}

task('default': "Generates code for all the domain classes in the database") {
    depends(generateDomainClasses)
}

task('generateDomainClasses': "Generate for all all the domain classes in the database") {
    profile("compiling config") {
        compile()
    }

    profile("creating config object") {
        ClassLoader contextLoader = Thread.currentThread().getContextClassLoader()
        classLoader = new URLClassLoader([classesDir.toURL()] as URL[], contextLoader)
        def configSlurper = new ConfigSlurper(grailsEnv)
        def configFile = new File("${basedir}/grails-app/conf/Config.groovy")
        if (configFile.exists()) {
            try {

                config = configSlurper.parse(classLoader.loadClass("Config"))
                config.setConfigFile(configFile.toURL())
            }
            catch (Exception e) {
                e.printStackTrace()

                event("StatusFinal", ["Failed to compile configuration file ${configFile}: ${e.message}"])
                exit(1)
            }

        }
        def dataSourceFile = new File("${basedir}/grails-app/conf/DataSource.groovy")
        if (dataSourceFile.exists()) {
            try {
                def dataSourceConfig = configSlurper.parse(classLoader.loadClass("DataSource"))
                config.merge(dataSourceConfig)
            }
            catch (Exception e) {
                e.printStackTrace()

                event("StatusFinal", ["Failed to compile data source file $dataSourceFile: ${e.message}"])
                exit(1)
            }
        }
        classLoader = contextLoader;
    }

    profile("generate the classes") {
        Properties p = config.dataSource.toProperties();
        println(p)
        String username = p.username
        assert username != null
        String password = p.getProperty("password", "")
        assert password != null
        String driver = p.driverClassName
        assert driver != null
        String url = p.url
        assert url != null
        try {
            Class generatorClass = classLoader.loadClass("com.moonspider.dbmap.Generator")
            Method generator = generatorClass.getMethod("main", String[].class);
            String[] generatorArgs = [
                    "-type", "gorm",
                    "-d", "grails-app/domain",
                    "-u", username,
                    "-p", password,
                    "-package", "",
                    "-ext", "groovy",
                    "-driver", driver,
                    "-url", url]
            Object[] callArgs = [generatorArgs]
            generator.invoke(null, callArgs)
        } catch (Exception e) {
            e.printStackTrace()

            event("StatusFinal", ["Failed to generate domain classes: ${e.message}"])
            exit(1)
        }
    }

}

