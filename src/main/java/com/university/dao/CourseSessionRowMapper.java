package com.university.dao;

import com.university.controllers.client.model.CourseSession;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class CourseSessionRowMapper implements RowMapper<CourseSession> {
    @Override
    public CourseSession mapRow(ResultSet rs, int rowNum) throws SQLException {
        final CourseSession courseSession = new CourseSession();

        courseSession.setId(rs.getLong("sessionId"));
        courseSession.setCourseId(rs.getLong("courseId"));
        courseSession.setStartDate(rs.getDate("startDate"));
        courseSession.setEndDate(rs.getDate("endDate"));
        courseSession.setStatus(rs.getInt("status"));

        return courseSession;
    }
}
