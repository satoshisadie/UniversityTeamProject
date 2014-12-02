package com.university.dao;

import com.university.controllers.client.model.*;
import com.university.utils.CommonUtils;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;

import java.sql.PreparedStatement;
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
                "INSERT INTO teacher (teacherId, educationalEstablishment, academicStatus) " +
                "VALUES (?, ?, ?)";

        jdbcTemplate.update(sql, id, teacher.getEducationalEstablishment(), teacher.getAcademicStatus());

        return id;
    }

    private long insertNewUser(User user) {
        final String sql =
                "INSERT INTO user (login, email, password) " +
                "VALUES (?, ?, ?)";

        KeyHolder keyHolder = new GeneratedKeyHolder();

        jdbcTemplate.update(con -> {
                    PreparedStatement ps = con.prepareStatement(sql, new String[] {"userId"});
                    ps.setString(1, user.getLogin());
                    ps.setString(2, user.getEmail());
                    ps.setString(3, user.getPassword());
                    return ps;
                },
                keyHolder
        );

        return (long) keyHolder.getKey();
    }

    public Optional<User> getUserById(long id) {
        final String sql =
                "SELECT * " +
                "FROM user " +
                "WHERE userId = ?";

        return CommonUtils.selectOne(jdbcTemplate, sql, new UserRowMapper(), id);
    }

    public List<Session> getUserSessions(long userId) {
        final String sql =
                "SELECT * " +
                "FROM enrolment e " +
                "JOIN session s ON e.sessionId = s.sessionId " +
                "JOIN course c ON c.courseId = s.course " +
                "WHERE e.studentId = ?";

        return jdbcTemplate.query(sql, new SessionRowMapper(), userId);
    }

    public Optional<User> getUserByLogin(String login) {
        final String sql =
                "SELECT " +
                    "u.userId," +
                    "u.email," +
                    "u.login," +
                    "u.firstName," +
                    "u.lastName," +
                    "u.password," +
                    "u.photo," +
                    "u.info," +
                    "CASE " +
                        "WHEN (SELECT COUNT(1) FROM admin a WHERE a.adminId = u.userId) > 0 THEN 'admin' " +
                        "WHEN (SELECT COUNT(1) FROM teacher t WHERE t.teacherId = u.userId) > 0 THEN 'teacher' " +
                        "WHEN (SELECT COUNT(1) FROM student s WHERE s.studentId = u.userId) > 0 THEN 'student' " +
                    "END AS type " +
                "FROM user u " +
                "WHERE u.login = ?;";

        return CommonUtils.selectOne(jdbcTemplate, sql, new UserRowMapper(), login);
    }

    public Teacher getTeacherById(int teacherId) {
        final String sql =
                "SELECT " +
                    "u.userId," +
                    "u.email," +
                    "u.login," +
                    "u.firstName," +
                    "u.lastName," +
                    "u.password," +
                    "u.photo," +
                    "u.info," +
                    "t.educationalEstablishment," +
                    "t.academicStatus," +
                    "CASE " +
                        "WHEN (SELECT COUNT(1) FROM admin a WHERE a.adminId = u.userId) > 0 THEN 'admin' " +
                        "WHEN (SELECT COUNT(1) FROM teacher t WHERE t.teacherId = u.userId) > 0 THEN 'teacher' " +
                        "WHEN (SELECT COUNT(1) FROM student s WHERE s.studentId = u.userId) > 0 THEN 'student' " +
                    "END AS type " +
                "FROM user u " +
                "JOIN teacher t ON t.teacherId = u.userId " +
                "WHERE u.userId = ?;";

        return jdbcTemplate.query(sql, new TeacherRowMapper(), teacherId).get(0);
    }

    public List<Teacher> getAllTeachers() {
        final String sql =
                "SELECT * " +
                "FROM teacher t " +
                "JOIN user u ON t.teacherId = u.userId ";

        return jdbcTemplate.query(sql, new TeacherRowMapper());
    }

    public void saveProfile(long id, ProfileSaveForm profileSaveForm, String userType) {
        final String sql =
                "UPDATE user u " +
                        "SET u.firstName = ?, u.lastName = ?, u.info = ? " +
                        "WHERE u.userId = ? ";

        jdbcTemplate.update(sql, profileSaveForm.getFirstName(), profileSaveForm.getLastName(), profileSaveForm.getInfo(), id);

        if (userType.equals("teacher")) {
            final String sql2 =
                    "UPDATE teacher t " +
                            "SET t.academicStatus = ?, t.educationalEstablishment = ? " +
                            "WHERE t.teacherId = ?; ";

            jdbcTemplate.update(sql2, profileSaveForm.getAcademicStatus(), profileSaveForm.getEducationalEstablishment(), id);
        }
    }
}
