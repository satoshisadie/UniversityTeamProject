package com.university.dao;

import com.university.controllers.client.model.*;
import com.university.dao.rowMappers.TeacherRowMapper;
import com.university.dao.rowMappers.UserRowMapper;
import com.university.utils.CommonUtils;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;

import java.sql.PreparedStatement;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

public class UserDao {
    private JdbcTemplate jdbcTemplate;

    public UserDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public void createStudent(User user) {
        long id = createUser(user);

        final String sql =
                "INSERT INTO student (studentId) VALUES (?)";

        jdbcTemplate.update(sql, id);
    }

    public void createTeacher(Teacher teacher) {
        User user = new User();
        user.setPassword(teacher.getPassword());
        user.setLogin(teacher.getLogin());
        user.setEmail(teacher.getEmail());

        long id = createUser(user);

        final String sql =
                "INSERT INTO teacher (teacherId, educationalEstablishment, academicStatus) " +
                "VALUES (?, ?, ?)";

        jdbcTemplate.update(sql, id, teacher.getEducationalEstablishment(), teacher.getAcademicStatus());
    }

    private long createUser(User user) {
        final String sql =
                "INSERT INTO user (login, email, password) " +
                "VALUES (?, ?, ?)";

        final KeyHolder keyHolder = new GeneratedKeyHolder();

        jdbcTemplate.update(con -> {
                    PreparedStatement ps = con.prepareStatement(sql, new String[] { "userId" });
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
                "SELECT " +
                "FROM user " +
                "WHERE userId = ?";

        return CommonUtils.selectOne(jdbcTemplate, sql, new UserRowMapper(), id);
    }

    public List<CourseSession> getUserCoursesSessions(long userId) {
        final String sql =
                "SELECT * " +
                "FROM enrollment e " +
                "JOIN session s ON s.sessionId = e.sessionId " +
                "WHERE e.studentId = ?";

        return jdbcTemplate.query(sql, new CourseSessionRowMapper(), userId);
    }

    public Optional<User> getUserByCredentials(String login, String password) {
        final String sql =
                "SELECT " + getUserAttributesString() +
                "FROM user u " +
                "WHERE u.login = ? AND u.password = ?";

        return CommonUtils.selectOne(jdbcTemplate, sql, new UserRowMapper(), login, password);
    }

    public Optional<User> getUserByLogin(String login) {
        final String sql =
                "SELECT " + getUserAttributesString() +
                "FROM user u " +
                "WHERE u.login = ?;";

        return CommonUtils.selectOne(jdbcTemplate, sql, new UserRowMapper(), login);
    }


    public User getFullUserById(long id){
        final String sql =
                "SELECT " + getUserAttributesString() +
                "FROM user u " +
                "WHERE u.userId = ?";

        return jdbcTemplate.query(sql, new UserRowMapper(), id).get(0);
    }

    public String getUserAttributesString() {
        return
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
                "END AS type ";
    }

    public Teacher getTeacherById(int teacherId) {
        final String sql =
                "SELECT " +
                     getUserAttributesString() + "," +
                    "t.educationalEstablishment," +
                    "t.academicStatus " +
                "FROM user u " +
                "JOIN teacher t ON t.teacherId = u.userId " +
                "WHERE u.userId = ?;";

        return jdbcTemplate.query(sql, new TeacherRowMapper(), teacherId).get(0);
    }

    public List<Teacher> getTeachersByIds(List<Integer> teachersIds) {
        final String concatenatedTeacherIds = teachersIds.stream()
                .map(Object::toString)
                .collect(Collectors.joining(","));

        final String sql =
                "SELECT " +
                        getUserAttributesString() + "," +
                        "t.educationalEstablishment," +
                        "t.academicStatus " +
                "FROM user u " +
                "JOIN teacher t ON t.teacherId = u.userId " +
                "WHERE u.userId IN (" + concatenatedTeacherIds + ");";

        return jdbcTemplate.query(sql, new TeacherRowMapper());
    }

    public List<Teacher> getAllTeachers() {
        final String sql =
                "SELECT " +
                        getUserAttributesString() + "," +
                        "t.educationalEstablishment," +
                        "t.academicStatus " +
                "FROM user u " +
                "JOIN teacher t ON t.teacherId = u.userId;";

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
