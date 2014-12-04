package com.university.controllers.client;

import com.google.gson.*;
import com.university.controllers.client.model.*;
import com.university.dao.CourseDao;
import com.university.utils.CommonUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping(value = "/teacher")
public class TeacherController {
    @Autowired private CourseDao courseDao;
    @Autowired private Gson serializer;
    @Autowired private JsonParser jsonParser;

    @RequestMapping(value = "/courses/")
    public ModelAndView courses(HttpServletRequest httpServletRequest) {
        final ModelAndView modelAndView = new ModelAndView("/teacher/courses");

        final User user = CommonUtils.getUserFromRequest(httpServletRequest);
        final List<Course> courses = courseDao.getCoursesByTeacher(user.getId());
        modelAndView.addObject("courses", courses);

        return modelAndView;
    }

    @RequestMapping(value = "/courses/new", method = RequestMethod.GET)
    public String newCourse() {
        return "redirect:./" + CommonUtils.generateId();
    }

    @RequestMapping(value = "/courses/{courseId}")
    public ModelAndView editCourse(@PathVariable long courseId,
                                   HttpServletRequest httpServletRequest)
    {
        final ModelAndView modelAndView = new ModelAndView("/teacher/course");

        final Course course = courseDao.getCourse(courseId);
        modelAndView.addObject("course", course);

        final List<CourseSession> sessions = courseDao.getCourseSessions(courseId);
        modelAndView.addObject("sessions", sessions);

        CommonUtils.addUserToModel(httpServletRequest, modelAndView);

        return modelAndView;
    }

    @RequestMapping(value = "/courses/{id}/save", method = RequestMethod.POST)
    public String saveCourse(@PathVariable long id, CourseSaveForm courseSaveForm) {
        courseDao.saveCourse(id, courseSaveForm);

        return "redirect:../../courses/";
    }

    @RequestMapping(value = "/lessons/")
    public ModelAndView lessons(@RequestParam long sessionId) {
        final ModelAndView modelAndView = new ModelAndView("/teacher/lessons");

        final List<Lesson> courseLessons = courseDao.getLessons(sessionId);
        modelAndView.addObject("lessons", courseLessons);
        modelAndView.addObject("sessionId", sessionId);

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

            lesson.setSessionId(lessonObject.get("courseId").getAsLong());
            lesson.setContent(lessonObject.get("content").getAsString());

            lessons.add(lesson);
        });

        courseDao.saveLessons(lessons);

        return "success";
    }

    @RequestMapping(value = "/tests/")
    public ModelAndView test(@RequestParam long lessonId) {
        final ModelAndView modelAndView = new ModelAndView("/teacher/test");

        final Optional<String> testJson = courseDao.getTest(lessonId);
        if (testJson.isPresent()) {
            modelAndView.addObject("test", serializer.fromJson(testJson.get(), Test.class));
        }

        modelAndView.addObject("lessonId", lessonId);

        return modelAndView;
    }

    @RequestMapping(value = "/tests/save", method = RequestMethod.POST)
    @ResponseBody
    public String saveTest(@RequestParam String testJson) {
        final Test test = serializer.fromJson(testJson, Test.class);
        if (test.getId() == null) {
            test.setId(CommonUtils.generateId());
        }

        courseDao.saveTest(test);

        return "success";
    }

    private CourseSession getSession(long id) {
        final Optional<CourseSession> sessionOptional = courseDao.getSession(id);

        return sessionOptional.orElseGet(() -> {
            final CourseSession session = new CourseSession();
            session.setId(id);
            return session;
        });
    }
}