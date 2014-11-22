package com.university.dao;

import com.university.controllers.client.model.Course;
import com.university.controllers.client.model.CourseSaveForm;
import com.university.controllers.client.model.Lesson;
import com.university.controllers.client.model.Tag;
import com.university.utils.CommonUtils;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

public class CourseDao {
    private JdbcTemplate jdbcTemplate;

    public CourseDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public List<Tag> getTags() {
        final String sql =
                "SELECT * " +
                "FROM tag";

        return jdbcTemplate.query(sql, new TagRowMapper());
    }

    public List<Course> getCourses() {
        final String sql =
                "SELECT * " +
                "FROM course";

        return jdbcTemplate.query(sql, new CourseRowMapper());
    }

    public Optional<Course> getCourse(long id) {
        final String sql =
                "SELECT * " +
                "FROM course c " +
                "WHERE c.courseId = ?";

        return CommonUtils.selectOne(jdbcTemplate, sql, new CourseRowMapper(), id);
    }

    public void saveCourse(long id, CourseSaveForm form) {
        final String sql =
                "INSERT INTO course(courseId, name, description) " +
                "VALUES (?, ?, ?) " +
                "ON DUPLICATE KEY UPDATE " +
                    "name = ?," +
                    "description = ?;";

        jdbcTemplate.update(sql, id, form.getName(), form.getDescription(), form.getName(), form.getDescription());
    }

    public List<Lesson> getLessons(long courseId) {
        final String sql =
                "SELECT * " +
                "FROM lesson l " +
                "WHERE l.courseId = ?";

        return jdbcTemplate.query(sql, new LessonRowMapper(), courseId);
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
                "INSERT INTO lesson(lessonId, courseId, content) " +
                "VALUES " + preparedLessonsValues(preparedLessons) + " " +
                "ON DUPLICATE KEY UPDATE " +
                    "content = VALUES(content);";

        jdbcTemplate.update(sql);
    }

    private String preparedLessonsValues(List<Lesson> lessons) {
        return lessons.stream()
                .map(lesson -> "(" + lesson.getId() + "," + lesson.getCourseId() + ",'" + lesson.getContent() + "')")
                .collect(Collectors.joining(","));
    }
}
