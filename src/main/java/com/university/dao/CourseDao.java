package com.university.dao;

import com.university.controllers.client.model.Course;
import com.university.controllers.client.model.CourseSaveForm;
import com.university.controllers.client.model.Lesson;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import java.util.List;
import java.util.Optional;

public class CourseDao {
    private JdbcTemplate jdbcTemplate;

    public CourseDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
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

        return selectOne(jdbcTemplate, sql, new CourseRowMapper(), id);
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

        return selectOne(jdbcTemplate, sql, new LessonRowMapper(), id);
    }

    public static <T> Optional<T> selectOne(JdbcTemplate jdbc, String sql, RowMapper<T> rowMapper, Object... params) {
        try {
            return Optional.of(jdbc.queryForObject(sql, params, rowMapper));
        } catch (EmptyResultDataAccessException e) {
            return Optional.empty();
        }
    }
}
