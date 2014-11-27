package com.university.dao;

import com.university.controllers.client.model.Course;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class CourseRowMapper implements RowMapper<Course> {
    @Override
    public Course mapRow(ResultSet rs, int rowNum) throws SQLException {
        final Course course = new Course();

        course.setId(rs.getLong("courseId"));
        course.setName(rs.getString("name"));
        course.setDescription(rs.getString("description"));
        course.setImg(rs.getString("img"));
        course.setTeacher(rs.getInt("teacher"));

        return course;
    }
}
