package com.university.dao;

import com.university.controllers.client.model.Tag;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by T on 20.11.2014.
 */

public class TagRowMapper implements RowMapper<Tag> {
    @Override
    public Tag mapRow(ResultSet rs, int rowNum) throws SQLException {
        final Tag tag = new Tag();

        tag.setId(rs.getInt("tagId"));
        tag.setName(rs.getString("tag"));

        return tag;
    }
}

