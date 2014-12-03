package com.university.dao;

import com.google.gson.Gson;
import com.university.controllers.client.model.*;
import com.university.dao.rowMappers.CourseRowMapper;
import com.university.dao.rowMappers.LessonRowMapper;
import com.university.dao.rowMappers.TagRowMapper;
import com.university.utils.CommonUtils;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.stream.Collectors;

public class CourseDao {
    private JdbcTemplate jdbcTemplate;
    private Gson gson = new Gson();

    public CourseDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public List<Tag> getTags() {
        final String sql =
                "SELECT * " +
                "FROM tag";

        return jdbcTemplate.query(sql, new TagRowMapper());
    }

    public List<Tag> getTagsByCourse(long courseId) {
        final String sql =
                "SELECT t.tagId, t.tagName " +
                "FROM tag t " +
                "JOIN course_tag ct ON ct.tagId = t.tagId " +
                "WHERE ct.courseId = ?;";

        return jdbcTemplate.query(sql, new TagRowMapper(), courseId);
    }

    public List<Course> getCoursesByTeacher(int teacherId) {
        final String sql =
                "SELECT * " +
                "FROM course c " +
                "WHERE c.teacherId = ?";

        return jdbcTemplate.query(sql, new CourseRowMapper(), teacherId);
    }

    public List<Course> getCourses() {
        final String sql =
                "SELECT * " +
                "FROM course";

        return jdbcTemplate.query(sql, new CourseRowMapper());
    }

    public Course getCourse(long courseId) {
        final String sql =
                "SELECT * " +
                "FROM course c " +
                "WHERE c.courseId = ?";

        return jdbcTemplate.query(sql, new CourseRowMapper(), courseId).get(0);
    }

    public List<CourseSession> getCourseSessions(long courseId) {
        final String sql =
                "SELECT * " +
                "FROM session s " +
                "WHERE s.courseId = ? " +
                "ORDER BY startDate ASC";

        return jdbcTemplate.query(sql, new CourseSessionRowMapper(), courseId);
    }

    public List<CourseSession> getOpenSessions() {
        final String sql =
                "SELECT * " +
                "FROM session s " +
                "JOIN course c ON s.course = c.courseId " +
                "WHERE s.status <> 2";

        return jdbcTemplate.query(sql, new CourseSessionRowMapper());
    }

    public Optional<CourseSession> getSession(long id) {
        final String sql =
                "SELECT * " +
                "FROM session s " +
                "JOIN course c ON s.course = c.courseId " +
                "WHERE s.sessionId = ?";

        return CommonUtils.selectOne(jdbcTemplate, sql, new CourseSessionRowMapper(), id);
    }

    public void saveCourse(long id, CourseSaveForm form) {
        final String sql =
                "INSERT INTO course(courseId, name, description) " +
                "VALUES (?, ?, ?) " +
                "ON DUPLICATE KEY UPDATE " +
                    "name = VALUES(name)," +
                    "description = VALUES(description);";

        jdbcTemplate.update(sql, id, form.getName(), form.getDescription());

        final List<String> tags = form.getTags();
        final Map<String, Integer> idByName = getTags().stream().collect(Collectors.toMap(Tag::getName, Tag::getId));
        final String preparedTagsValues = tags.stream().map(tagName -> "(" + id + "," + idByName.get(tagName) + ")").collect(Collectors.joining(","));

        final String sql2 =
                "DELETE course_tag ct WHERE ct.courseId = ?;" +
                "INSERT INTO course_tag(courseId, tagId) VALUES " + preparedTagsValues + ";";

        jdbcTemplate.update(sql2);
    }

    public List<Lesson> getLessons(long sessionId) {
        final String sql =
                "SELECT * " +
                "FROM lesson l " +
                "WHERE l.sessionId = ?";

        return jdbcTemplate.query(sql, new LessonRowMapper(), sessionId);
    }

    public Optional<Lesson> getLesson(long id) {
        final String sql =
                "SELECT * " +
                "FROM lesson l " +
                "WHERE l.lessonId = ?";

        return CommonUtils.selectOne(jdbcTemplate, sql, new LessonRowMapper(), id);
    }

    public void saveLessons(List<Lesson> lessons) {
        final List<Lesson> preparedLessons = lessons.stream()
                .map(lesson -> {
                    if (lesson.getId() == null) {
                        lesson.setId(CommonUtils.generateId());
                    }
                    return lesson;
                })
                .collect(Collectors.toList());

        final String sql =
                "INSERT INTO lesson(lessonId, sessionId, content) " +
                "VALUES " + preparedLessonsValues(preparedLessons) + " " +
                "ON DUPLICATE KEY UPDATE " +
                    "content = VALUES(content);";

        jdbcTemplate.update(sql);
    }

    public Optional<String> getTest(long lessonId) {
        final String sql =
                "SELECT t.content " +
                "FROM test t " +
                "WHERE t.lessonId = ?";

        try {
            return Optional.of(jdbcTemplate.queryForObject(sql, String.class, lessonId));
        } catch (DataAccessException e) {
            return Optional.empty();
        }
    }

    public void saveTest(Test test) {
        final String sql =
                "INSERT INTO test(testId, lessonId, content) " +
                "VALUES (?, ?, ?) " +
                "ON DUPLICATE KEY UPDATE " +
                    "content = VALUES(content)";

        jdbcTemplate.update(sql, test.getId(), test.getLessonId(), gson.toJson(test));
    }

    private String preparedLessonsValues(List<Lesson> lessons) {
        return lessons.stream()
                .map(lesson -> "(" + lesson.getId() + "," + lesson.getSessionId() + ",'" + lesson.getContent() + "')")
                .collect(Collectors.joining(","));
    }
}
