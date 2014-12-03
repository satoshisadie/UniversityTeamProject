package com.university.dao.rowMappers;

import com.university.controllers.client.model.Tag;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class TagRowMapper implements RowMapper<Tag> {
    @Override
    public Tag mapRow(ResultSet rs, int rowNum) throws SQLException {
        final Tag tag = new Tag();

        tag.setId(rs.getInt("tagId"));
        tag.setName(rs.getString("tagName"));

        return tag;
    }
}

