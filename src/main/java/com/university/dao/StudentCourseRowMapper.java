package com.university.dao;

import com.university.controllers.client.model.Course;
import com.university.controllers.client.model.StudentCourse;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class StudentCourseRowMapper implements RowMapper<StudentCourse> {
    @Override
    public StudentCourse mapRow(ResultSet rs, int rowNum) throws SQLException {
        final StudentCourse course = new StudentCourse();

        course.setId(rs.getLong("courseId"));
        course.setName(rs.getString("name"));
        course.setDescription(rs.getString("description"));
        course.setImg(rs.getString("img"));
        course.setStartDate(rs.getDate("startDate"));
        course.setEndDate(rs.getDate("endDate"));
        course.setTeacher(rs.getInt("teacher"));
        course.setStatus(rs.getInt("status"));

        return course;
    }
}
