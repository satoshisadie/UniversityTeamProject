package com.university.controllers.client;

import com.google.gson.*;
import com.university.controllers.client.model.*;
import com.university.dao.CourseDao;
import com.university.utils.CommonUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping(value = "/teacher")
public class TeacherController {
    @Autowired private CourseDao courseDao;
    final Gson serializer = new Gson();
    final JsonParser jsonParser = new JsonParser();

    @RequestMapping(value = "/courses/")
    public ModelAndView courses() {
        final ModelAndView modelAndView = new ModelAndView("/teacher/courses");

        List<Course> courses = courseDao.getCourses();
        modelAndView.addObject("courses", courses);

        return modelAndView;
    }

    @RequestMapping(value = "/courses/new", method = RequestMethod.GET)
    public String newCourse() {
        return "redirect:./" + CommonUtils.generateId();
    }

    @RequestMapping(value = "/courses/{id}")
    public ModelAndView editCourse(@PathVariable long id) {
        final ModelAndView modelAndView = new ModelAndView("/teacher/course");

        final Course course = getCourse(id);
        modelAndView.addObject("course", course);

        final List<Tag> tags = courseDao.getTags();
        modelAndView.addObject("tags", tags);

        final List<CourseTag> courseTags = courseDao.getTagsByCourse(id);
        modelAndView.addObject("courseTags", courseTags);

        return modelAndView;
    }

    @RequestMapping(value = "/courses/{id}/save", method = RequestMethod.POST)
    public String saveCourse(@PathVariable long id, CourseSaveForm courseSaveForm) {
        courseDao.saveCourse(id, courseSaveForm);

        return "redirect:../../courses/";
    }

    @RequestMapping(value = "/lessons/")
    public ModelAndView lessons(@RequestParam long courseId) {
        final ModelAndView modelAndView = new ModelAndView("/teacher/lessons");

        final List<Lesson> courseLessons = courseDao.getLessons(courseId);
        modelAndView.addObject("lessons", courseLessons);
        modelAndView.addObject("courseId", courseId);

        return modelAndView;
    }

    @RequestMapping(value = "/lessons/save", method = RequestMethod.POST)
    @ResponseBody
    public String saveLessons(@RequestParam(value = "lessons") String lessonsJson) {
        final JsonArray lessonsArray = jsonParser.parse(lessonsJson).getAsJsonArray();

        final List<Lesson> lessons = new ArrayList<>();

        lessonsArray.forEach(lessonJsonElement -> {
            final JsonObject lessonObject = lessonJsonElement.getAsJsonObject();

            final Lesson lesson = new Lesson();

            final JsonElement id = lessonObject.get("id");
            if (id != null) {
                lesson.setId(id.getAsLong());
            }

            lesson.setCourseId(lessonObject.get("courseId").getAsLong());
            lesson.setContent(lessonObject.get("content").getAsString());

            lessons.add(lesson);
        });

        courseDao.saveLessons(lessons);

        return "success";
    }

    private Course getCourse(long id) {
        final Optional<Course> courseOptional = courseDao.getCourse(id);

        return courseOptional.orElseGet(() -> {
            final Course course = new Course();
            course.setId(id);
            return course;
        });
    }
}