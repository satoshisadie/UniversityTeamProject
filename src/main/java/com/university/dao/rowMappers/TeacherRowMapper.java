package com.university.dao.rowMappers;

import com.university.controllers.client.model.Teacher;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class TeacherRowMapper implements RowMapper<Teacher> {

    @Override
    public Teacher mapRow(ResultSet rs, int rowNum) throws SQLException {
        final Teacher teacher = new Teacher();

        teacher.setId(rs.getInt("userId"));
        teacher.setEmail(rs.getString("email"));
        teacher.setLogin(rs.getString("login"));
        teacher.setFirstName(rs.getString("firstName"));
        teacher.setLastName(rs.getString("lastName"));
        teacher.setPassword(rs.getString("password"));
        teacher.setPhoto(rs.getString("photo"));
        teacher.setInfo(rs.getString("info"));
        teacher.setEducationalEstablishment(rs.getString("educationalEstablishment"));
        teacher.setAcademicStatus(rs.getString("academicStatus"));

        return teacher;
    }
}
