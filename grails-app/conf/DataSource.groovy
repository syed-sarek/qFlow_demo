defaultPackage drl2;
dataSource {
    pooled = true
    dialect = org.hibernate.dialect.Oracle10gDialect
    driverClassName = 'oracle.jdbc.OracleDriver'
}
hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = true
    cache.provider_class = 'net.sf.ehcache.hibernate.EhCacheProvider'
}
// environment specific settings
environments {
    development {
        dataSource {
           dbCreate = "update" // one of 'create', 'create-drop','update'
//            dbCreate = "create-drop" // one of 'create', 'create-drop','update'
            url = 'jdbc:oracle:thin:@192.168.10.7:1521:drl'
            username = "sys"
            password = "Drl1234#"
        }
    }
    test {
        dataSource {
            dbCreate = "update"
            url = 'jdbc:oracle:thin:@192.168.10.7:1521:drl'
            username = "sys"
            password = "Drl1234#"
        }
    }
    production {
        dataSource {
            dbCreate = "update"
            url = 'jdbc:oracle:thin:@192.168.10.7:1521:xe'
            username = "sys"
            password = "Drl1234#"
        }
    }
}