package com.university.dao;

import com.university.controllers.client.model.CourseSession;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class SessionRowMapper implements RowMapper<CourseSession> {
    @Override
    public CourseSession mapRow(ResultSet rs, int rowNum) throws SQLException {
        final CourseSession courseSession = new CourseSession();

        courseSession.setSessionId(rs.getLong("sessionId"));
        courseSession.setCourse(rs.getLong("course"));
        courseSession.setStartDate(rs.getDate("startDate"));
        courseSession.setEndDate(rs.getDate("endDate"));
        courseSession.setStatus(rs.getInt("status"));
        courseSession.setName(rs.getString("name"));
        courseSession.setDescription(rs.getString("description"));
        courseSession.setImg(rs.getString("img"));
        courseSession.setTeacher(rs.getInt("teacher"));

        return courseSession;
    }
}
