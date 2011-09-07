dataSource {
	pooled = true
	driverClassName = "org.postgresql.Driver"
	username = "sigesti"
	password = "123"
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
			url = "jdbc:postgresql://localhost/sigesti_development"
			//loggingSql = true
		}
	}
	test {
		dataSource {
			dbCreate = "update"
			// url = "jdbc:hsqldb:mem:sigestiDb"
			url = "jdbc:hsqldb:mem:sigestiDb"
		}
	}
	production {
		dataSource {
			dbCreate = "update"
			url = "jdbc:postgresql://localhost/sigesti"
		}
	}
}
