package com.university.dao;

import com.university.controllers.client.model.Course;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.List;

public class CourseDao {
    private JdbcTemplate jdbcTemplate;

    public CourseDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public List<Course> getCourses() {
        final String sql =
                "SELECT * " +
                "FROM course";

        return jdbcTemplate.query(sql, new CourseRowMapper());
    }

    public Course getCourse(int id) {
        final String sql =
                "SELECT * " +
                "FROM course c " +
                "WHERE c.courseId = ?";

        return jdbcTemplate.query(sql, new CourseRowMapper(), id).get(0);
    }
}
