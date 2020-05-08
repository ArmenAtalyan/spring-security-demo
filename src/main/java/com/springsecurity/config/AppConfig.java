package com.springsecurity.config;

import com.mchange.v2.c3p0.ComboPooledDataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import javax.sql.DataSource;
import java.util.Objects;

@Configuration
@EnableWebMvc
@ComponentScan(basePackages="com.springsecurity")
@PropertySource("classpath:mysql.properties")
public class AppConfig {

	@Autowired
	private Environment environment;

	@Bean
	public DataSource dataSource() {

		// create connection pool
		ComboPooledDataSource securityDataSource = new ComboPooledDataSource();

		// set jdbc driver
		try {
			securityDataSource.setDriverClass(environment.getProperty("jdbc.driver"));
		}
		catch (Exception e){
			e.printStackTrace();
		}

		// set database connection properties
		securityDataSource.setJdbcUrl(environment.getProperty("jdbc.url"));
		securityDataSource.setUser(environment.getProperty("jdbc.username"));
		securityDataSource.setPassword(environment.getProperty("jdbc.password"));

		// set connection pool properties
		securityDataSource.setInitialPoolSize(Integer.parseInt(Objects.requireNonNull(environment.getProperty("connection.pool.initialPoolSize"))));
		securityDataSource.setMinPoolSize(Integer.parseInt(Objects.requireNonNull(environment.getProperty("connection.pool.minPoolSize"))));
		securityDataSource.setMaxPoolSize(Integer.parseInt(Objects.requireNonNull(environment.getProperty("connection.pool.maxPoolSize"))));
		securityDataSource.setMaxIdleTime(Integer.parseInt(Objects.requireNonNull(environment.getProperty("connection.pool.maxIdleTime"))));

		return securityDataSource;
	}

	@Bean
	public ViewResolver viewResolver() {
		
		InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
		viewResolver.setPrefix("/WEB-INF/view/");
		viewResolver.setSuffix(".jsp");
		return viewResolver;
	}
}









