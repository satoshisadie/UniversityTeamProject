package com.university.dao;

import com.university.controllers.client.model.TestCourseTag;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by T on 21.11.2014.
 */
public class CourseTagRowMapper implements RowMapper<TestCourseTag> {
    @Override
    public TestCourseTag mapRow(ResultSet rs, int rowNum) throws SQLException {
        final TestCourseTag course_tag = new TestCourseTag();

        course_tag.setCourseId(rs.getLong("course"));
        course_tag.setTagId(rs.getLong("tag"));
        course_tag.setCTid(rs.getLong("courseTagId"));
        course_tag.setcName(rs.getString("name"));
        course_tag.setDescription(rs.getString("description"));
        course_tag.settName(rs.getString("tag"));

        return course_tag;
    }
}
