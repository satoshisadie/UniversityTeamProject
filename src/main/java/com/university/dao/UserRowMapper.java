package com.university.dao;

import com.university.controllers.client.model.User;

import java.sql.ResultSet;
import java.sql.SQLException;

public class UserRowMapper {
//    @Override
    public User mapMinRow(ResultSet rs, int rowNum) throws SQLException {
        final User user = new User();

        //TODO Sichkar write mapping

        return user;
    }
}
