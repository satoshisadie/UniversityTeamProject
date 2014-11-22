package com.university.utils;

import com.university.controllers.client.model.User;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Optional;
import java.util.UUID;

public class CommonUtils {

    public static long generateId() {
        return Math.abs(UUID.randomUUID().getMostSignificantBits());
    }

    public static <T> Optional<T> selectOne(JdbcTemplate jdbc, String sql, RowMapper<T> rowMapper, Object... params) {
        try {
            return Optional.of(jdbc.queryForObject(sql, params, rowMapper));
        } catch (EmptyResultDataAccessException e) {
            return Optional.empty();
        }
    }

    public static void addUserToModel(HttpServletRequest httpServletRequest, ModelAndView modelAndView) {
        final HttpSession session = httpServletRequest.getSession();
        final User user = (User) session.getAttribute("user");
        if (user != null) {
            modelAndView.addObject("user", user);
        }
    }

    public static User getUserFromRequest(HttpServletRequest httpServletRequest) {
        final HttpSession session = httpServletRequest.getSession();
        return (User) session.getAttribute("user");
    }
}
