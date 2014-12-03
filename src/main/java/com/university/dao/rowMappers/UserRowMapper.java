package com.university.dao.rowMappers;

import com.university.controllers.client.model.User;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class UserRowMapper implements RowMapper<User> {
    @Override
    public User mapRow(ResultSet rs, int rowNum) throws SQLException {
        final User user = new User();

        user.setId(rs.getInt("userId"));
        user.setEmail(rs.getString("email"));
        user.setLogin(rs.getString("login"));
        user.setFirstName(rs.getString("firstName"));
        user.setLastName(rs.getString("lastName"));
        user.setPassword(rs.getString("password"));
        user.setPhoto(rs.getString("photo"));
        user.setInfo(rs.getString("info"));
        user.setType(rs.getString("type"));

        return user;
    }
}
