package com.university.dao;

import com.google.gson.Gson;
import com.university.controllers.client.model.*;
import com.university.dao.rowMappers.CourseRowMapper;
import com.university.dao.rowMappers.LessonRowMapper;
import com.university.dao.rowMappers.TagRowMapper;
import com.university.utils.CommonUtils;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.*;
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

    public List<Course> getCoursesByTeacher(int teacherId) {
        final String sql =
                "SELECT " +
                        "c.courseId," +
                        "c.teacherId," +
                        "c.name," +
                        "c.description," +
                        "c.img," +
                        "(SELECT GROUP_CONCAT(CONCAT(t.tagId, ',', t.tagName) SEPARATOR ',')" +
                         "FROM tag t " +
                         "JOIN course_tag ct ON ct.tagId = t.tagId " +
                         "WHERE ct.courseId = c.courseId) AS tags " +
                "FROM course c " +
                "WHERE c.teacherId = ?;";

        return jdbcTemplate.query(sql, new CourseRowMapper(), teacherId);
    }

    public List<Course> getCourses() {
        final String sql =
                "SELECT " +
                        "c.courseId," +
                        "c.teacherId," +
                        "c.name," +
                        "c.description," +
                        "c.img," +
                        "(SELECT GROUP_CONCAT(CONCAT(t.tagId, ',', t.tagName) SEPARATOR ',')" +
                         "FROM tag t " +
                         "JOIN course_tag ct ON ct.tagId = t.tagId " +
                         "WHERE ct.courseId = c.courseId) AS tags " +
                "FROM course c;";

        return jdbcTemplate.query(sql, new CourseRowMapper());
    }

    public List<Course> getCoursesByIds(List<Long> coursesIds) {
        if (coursesIds.isEmpty()) return Collections.emptyList();

        final String concatenatedCoursesIds = coursesIds.stream()
                .map(Object::toString)
                .collect(Collectors.joining(","));

        final String sql =
                "SELECT " +
                        "c.courseId," +
                        "c.teacherId," +
                        "c.name," +
                        "c.description," +
                        "c.img," +
                        "(SELECT GROUP_CONCAT(CONCAT(t.tagId, ',', t.tagName) SEPARATOR ',')" +
                         "FROM tag t " +
                         "JOIN course_tag ct ON ct.tagId = t.tagId " +
                         "WHERE ct.courseId = c.courseId) AS tags " +
                "FROM course c " +
                "WHERE c.courseId IN (" + concatenatedCoursesIds + ");";

        return jdbcTemplate.query(sql, new CourseRowMapper());
    }

    public Optional<Course> getCourse(long courseId) {
        final String sql =
                "SELECT " +
                        "c.courseId," +
                        "c.teacherId," +
                        "c.name," +
                        "c.description," +
                        "c.img," +
                        "(SELECT GROUP_CONCAT(CONCAT(t.tagId, ',', t.tagName) SEPARATOR ',')" +
                         "FROM tag t " +
                         "JOIN course_tag ct ON ct.tagId = t.tagId " +
                         "WHERE ct.courseId = c.courseId) AS tags " +
                "FROM course c " +
                "WHERE c.courseId = ?;";

        return CommonUtils.selectOne(jdbcTemplate, sql, new CourseRowMapper(), courseId);
    }

    public List<CourseSession> getCourseSessions(long courseId) {
        final String sql =
                "SELECT * " +
                "FROM session s " +
                "WHERE s.courseId = ? " +
                "ORDER BY startDate ASC";

        return jdbcTemplate.query(sql, new CourseSessionRowMapper(), courseId);
    }

    public Optional<CourseSession> getSession(long sessionId) {
        final String sql =
                "SELECT * " +
                "FROM session s " +
                "JOIN course c ON s.courseId = c.courseId " +
                "WHERE s.sessionId = ?";

        return CommonUtils.selectOne(jdbcTemplate, sql, new CourseSessionRowMapper(), sessionId);
    }

    public void saveCourse(long courseId, CourseSaveForm form) {
        final String sql =
                "INSERT INTO course(courseId, teacherId, name, description) " +
                "VALUES (?, ?, ?, ?) " +
                "ON DUPLICATE KEY UPDATE " +
                    "name = VALUES(name)," +
                    "description = VALUES(description);";

        jdbcTemplate.update(sql, courseId, form.getTeacherId(), form.getName(), form.getDescription());

        final String sql2 =
                "DELETE FROM course_tag WHERE courseId = ?;";

        jdbcTemplate.update(sql2, courseId);

        final List<String> tags = form.getTags();
        final Map<String, Integer> idByName = getTags().stream().collect(Collectors.toMap(Tag::getName, Tag::getId));
        final String preparedTagsValues = tags.stream().map(tagName -> "(" + courseId + "," + idByName.get(tagName) + ")").collect(Collectors.joining(","));
        final String sql3 =
                "INSERT INTO course_tag(courseId, tagId) VALUES " + preparedTagsValues + ";";

        jdbcTemplate.update(sql3);
    }

    public List<Lesson> getLessons(long sessionId) {
        final String sql =
                "SELECT * " +
                "FROM lesson l " +
                "WHERE l.sessionId = ?;";

        return jdbcTemplate.query(sql, new LessonRowMapper(), sessionId);
    }

    public Lesson getLessonById(long lessonId) {
        final String sql =
                "SELECT * " +
                "FROM lesson l " +
                "WHERE l.lessonId = ?;";

        return jdbcTemplate.query(sql, new LessonRowMapper(), lessonId).get(0);
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

    public Optional<String> getTestByLessonId(long lessonId) {
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

    public List<Long> getPassedLessons(long studentId, long sessionId) {
        final String sql =
                "SELECT l.lessonId " +
                "FROM session s " +
                "JOIN lesson l ON l.sessionId = s.sessionId " +
                "JOIN test t ON t.lessonId = l.lessonId " +
                "JOIN student_test st ON st.testId = t.testId " +
                "WHERE st.studentId = ? AND s.sessionId = ? AND st.isPassed = 1;";

        return jdbcTemplate.queryForList(sql, Long.class, studentId, sessionId);
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

    public void saveTestPassing(int studentId, long testId, int correctAnswersCount, boolean isPassed) {
        final String sql =
                "INSERT INTO student_test(studentId, testId, date, correctAnswersCount, isPassed) " +
                "VALUES (?, ?, CURRENT_TIMESTAMP(), ?, ?)";

        jdbcTemplate.update(sql, studentId, testId, correctAnswersCount, isPassed);
    }

    public void signStudentToSession(int studentId, long sessionId, int status) {
        final String sql =
                "INSERT INTO enrollment (sessionId, studentId, `status`) " +
                "VALUES (?, ?, ?)";

        jdbcTemplate.update(sql, sessionId, studentId, status);
    }

    public void addLessonToSession(long sessionId) {
        final String sql =
                "INSERT INTO lesson(lessonId, sessionId, content) " +
                "VALUES (?, ?, ?);";

        jdbcTemplate.update(sql, CommonUtils.generateId(), sessionId, "");
    }
}
