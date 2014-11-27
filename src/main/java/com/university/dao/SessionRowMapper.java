package com.university.dao;

import com.university.controllers.client.model.Session;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class SessionRowMapper implements RowMapper<Session> {
    @Override
    public Session mapRow(ResultSet rs, int rowNum) throws SQLException {
        final Session session = new Session();

        session.setSessionId(rs.getLong("sessionId"));
        session.setCourse(rs.getLong("course"));
        session.setStartDate(rs.getDate("startDate"));
        session.setEndDate(rs.getDate("endDate"));
        session.setStatus(rs.getInt("status"));
        session.setName(rs.getString("name"));
        session.setDescription(rs.getString("description"));
        session.setImg(rs.getString("img"));
        session.setTeacher(rs.getInt("teacher"));

        return session;
    }
}
