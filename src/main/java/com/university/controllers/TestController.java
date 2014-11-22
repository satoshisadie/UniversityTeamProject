package com.university.controllers;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.university.controllers.client.model.Tag;
import com.university.dao.CourseDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * Created by T on 20.11.2014.
 */


@Controller
public class TestController {

   @Autowired private CourseDao courseDao;

    @RequestMapping(value = "/save",method = RequestMethod.POST)
    public ModelAndView save(@RequestParam(value = "tags") List<String> testTags) {
        final ModelAndView modelAndView = new ModelAndView("test");

        return modelAndView;
    }

    @RequestMapping(value = "/tags")
    @ResponseBody
    public String getTags() {
        final List<Tag> tags = courseDao.getTags();

        final JsonArray jsonArray = new JsonArray();

        tags.forEach(tag -> {
            final JsonObject tagJson = new JsonObject();
            tagJson.addProperty("name", tag.getName());

            jsonArray.add(tagJson);
        });

        return jsonArray.toString();
    }

}
