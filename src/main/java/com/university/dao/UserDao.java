package com.university.dao;

import com.university.controllers.client.model.Course;
import com.university.controllers.client.model.Teacher;
import com.university.controllers.client.model.User;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Types;
import java.util.List;
import java.util.Optional;

public class UserDao {
    private JdbcTemplate jdbcTemplate;

    public UserDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }


    public long insertNewStudent(User user) {
        long id = insertNewUser(user);

        final String sql =
                "INSERT INTO student (studentId) VALUES (?)";
        jdbcTemplate.update(sql, id);

        return id;
    }

    public long insertNewTeacher(Teacher teacher) {
        User user = new User();
        user.setPassword(teacher.getPassword());
        user.setLogin(teacher.getLogin());
        user.setEmail(teacher.getEmail());

        long id = insertNewUser(user);

        final String sql =
                "INSERT INTO teacher " +
                "( teacherId, " +
                " educationalEstablishment, " +
                " academicStatus ) " +
                "VALUES (?, ?, ?)";
        jdbcTemplate.update(sql, id, teacher.getEducationalEstablishment(), teacher.getAcademicStatus());

        return id;
    }

    private long insertNewUser(User user) {
        final String sql =
                "INSERT INTO user (" +
                        " login, " +
                        " email, " +
                        " password ) " +
                        "VALUES (?, ?, ?)";

        KeyHolder keyHolder = new GeneratedKeyHolder();

        jdbcTemplate.update(con -> {
                    PreparedStatement ps = con.prepareStatement(sql, new String[] {"userId"});
                    ps.setString(1, user.getLogin());
                    ps.setString(2, user.getEmail());
                    ps.setString(3, user.getPassword());
                    return ps;
                },
                keyHolder);

        return (long) keyHolder.getKey();
    }

    public Optional<User> getUserById(long id) {
        final String sql = "SELECT * " +
                " FROM user " +
                " WHERE userId = ? ";
        return CourseDao.selectOne(jdbcTemplate, sql, new UserRowMapper(), id);
    }

    public List<Course> getCurrUserCourses(long userId) {
        final String sql =
                "SELECT * " +
                " FROM course c LEFT JOIN (student_course s) " +
                " ON(c.courseId = s.course) " +
                " WHERE s.student = ? and s.status = 2";

        return jdbcTemplate.query(sql, new CourseRowMapper(), userId);
    }

    public Optional<User> getUserByLogin(User inputUser) {
        final String sql = "SELECT * " +
                " FROM user " +
                " WHERE login = ? ";
        return CourseDao.selectOne(jdbcTemplate, sql, new UserRowMapper(), inputUser.getLogin());
    }

    public String getUserType(long id) {
        final String teacherSql =
                "SELECT count(*) " +
                "FROM teacher " +
                "WHERE teacherId = ?";

        final String studentSql =
                "SELECT count(*) " +
                "FROM student " +
                "WHERE studentId = ?";

        if(jdbcTemplate.queryForObject(teacherSql, Integer.class, id) > 0) {
            return "teacher";
        }
        if(jdbcTemplate.queryForObject(studentSql, Integer.class, id) > 0) {
            return "student";
        }

        return "admin";
    }
}
