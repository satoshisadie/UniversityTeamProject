package com.university.dao;

import com.university.controllers.client.model.CourseTag;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class CourseTagRowMapper implements RowMapper<CourseTag> {
    @Override
    public CourseTag mapRow(ResultSet rs, int rowNum) throws SQLException {
        final CourseTag courseTag = new CourseTag();

        courseTag.setCourseId(rs.getLong("course"));
        courseTag.setTagId(rs.getLong("tagId"));
        courseTag.setTagName(rs.getString("tag"));

        return courseTag;
    }
}
