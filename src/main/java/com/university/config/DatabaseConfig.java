package com.university.config;

import com.university.dao.CourseDao;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

import javax.sql.DataSource;

@Configuration
public class DatabaseConfig {

    @Bean public DataSource dataSource() {
        final DriverManagerDataSource dataSource = new DriverManagerDataSource();

        dataSource.setDriverClassName("com.mysql.jdbc.Driver");
        dataSource.setUrl("jdbc:mysql://localhost:3306/educationalWebsite");
        dataSource.setUsername("root");
        dataSource.setPassword("06061988");

        return dataSource;
    }

    @Bean public JdbcTemplate jdbcTemplate(DataSource dataSource) {
        return new JdbcTemplate(dataSource);
    }

    @Bean public CourseDao courseDao(JdbcTemplate jdbcTemplate) {
        return new CourseDao(jdbcTemplate);
    }
}
