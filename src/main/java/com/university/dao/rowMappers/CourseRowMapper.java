package com.university.dao.rowMappers;

import com.university.controllers.client.model.Course;
import com.university.controllers.client.model.Tag;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CourseRowMapper implements RowMapper<Course> {
    @Override
    public Course mapRow(ResultSet rs, int rowNum) throws SQLException {
        final Course course = new Course();

        course.setId(rs.getLong("courseId"));
        course.setTeacherId(rs.getInt("teacherId"));
        course.setName(rs.getString("name"));
        course.setDescription(rs.getString("description"));
        course.setImg(rs.getString("img"));

        try {
            final String tagsCSV = rs.getString("tags");

            final String[] splittedTagsCSV = tagsCSV.split(",");
            final List<Tag> tags = new ArrayList<>();

            for (int i = 0; i < splittedTagsCSV.length; i += 2) {
                final Tag tag = new Tag();

                tag.setId(Integer.valueOf(splittedTagsCSV[i]));
                tag.setName(splittedTagsCSV[i + 1]);

                tags.add(tag);
            }

            course.setTags(tags);
        } catch (SQLException ignored) {}

        return course;
    }
}
