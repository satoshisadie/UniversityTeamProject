package com.university.dao;

import com.university.controllers.client.model.User;
import org.springframework.jdbc.core.JdbcTemplate;

import java.sql.Types;

public class UserDao {
    private JdbcTemplate jdbcTemplate;

    public UserDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }


    public int insertNewUser(User user) {
        final String sql =
                "INSERT INTO user (" +
                " login, " +
                " birthday, " +
                " gender, " +
                " location, " +
                " photo, " +
                " info, " +
                " email, " +
                " password) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

        int[] types = new int[] {Types.VARCHAR, Types.DATE, Types.VARCHAR, Types.VARCHAR,
                            Types.VARCHAR, Types.VARCHAR, Types.VARCHAR, Types.VARCHAR};

        int id = jdbcTemplate.update(sql, user, types);
        return id;
    }
}
