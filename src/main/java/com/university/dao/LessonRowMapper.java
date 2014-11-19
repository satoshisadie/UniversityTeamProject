package com.university.dao;

import com.university.controllers.client.model.Lesson;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class LessonRowMapper implements RowMapper<Lesson> {
    @Override
    public Lesson mapRow(ResultSet rs, int rowNum) throws SQLException {
        final Lesson lesson = new Lesson();

        lesson.setId(rs.getLong("lessonId"));
        lesson.setCourseId(rs.getLong("courseId"));
        lesson.setContent(rs.getString("content"));

        return lesson;
    }
}
