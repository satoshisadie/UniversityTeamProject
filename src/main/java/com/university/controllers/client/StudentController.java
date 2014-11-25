package com.university.controllers.client;

import com.google.gson.*;
import com.university.controllers.client.model.*;
import com.university.dao.CourseDao;
import com.university.dao.UserDao;
import com.university.utils.CommonUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.*;
import java.util.stream.Collectors;

@Controller
@RequestMapping(value = "/student")
public class StudentController {
    @Autowired CourseDao courseDao;
    @Autowired UserDao userDao;
    final Gson serializer = new Gson();
    final JsonParser jsonParser = new JsonParser();

    @RequestMapping("/lessons/")
    public ModelAndView course(@RequestParam(value = "courseId") Long courseId) throws Exception {
        final ModelAndView modelAndView = new ModelAndView("/student/lessons");

        final List<Lesson> lessons = courseDao.getLessons(courseId);
        modelAndView.addObject("lessons", lessons);

        return modelAndView;
    }

    @RequestMapping(value = "/courses")
    public ModelAndView courses(HttpServletRequest httpServletRequest)
    {
        final ModelAndView modelAndView = new ModelAndView("/student/courses");

        final User user = CommonUtils.getUserFromRequest(httpServletRequest);
        modelAndView.addObject("user", user);

        final List<StudentCourse> userCourses = userDao.getUserCourses(user.getId());
        modelAndView.addObject("courses", userCourses);

        return modelAndView;
    }

    @RequestMapping("/test/")
    public ModelAndView passTest(@RequestParam Long lessonId) throws Exception {
        final ModelAndView modelAndView = new ModelAndView("/student/test");

        final Optional<String> test = courseDao.getTest(lessonId);

        if (test.isPresent()) {
            modelAndView.addObject("test", serializer.fromJson(test.get(), Test.class));
            modelAndView.addObject("lessonId", lessonId);
            return modelAndView;
        }
        throw new Exception("Resource not found");
    }

    @RequestMapping("/test/check")
    @ResponseBody
    public String checkTest(@RequestParam Long lessonId,
                            @RequestParam String questionsJson)
    {
        final JsonArray questionsArray = jsonParser.parse(questionsJson).getAsJsonArray();

        final Test test = serializer.fromJson(courseDao.getTest(lessonId).get(), Test.class);

        final Iterator<JsonElement> iterator = questionsArray.iterator();

        int index = 0;
        int answeredQuestionsCount = 0;

        while (iterator.hasNext()) {
            final List<String> selectedAnswers = Arrays.asList(serializer.fromJson(iterator.next(), String[].class));
            final List<String> correctAnswers = test.getQuestions().get(index).getAnswers().stream()
                    .filter(Answer::getIsCorrect)
                    .map(Answer::getText)
                    .collect(Collectors.toList());

            if (selectedAnswers.size() == correctAnswers.size() && selectedAnswers.containsAll(correctAnswers)) {
                answeredQuestionsCount++;
            }
            index++;
        }

        return Integer.toString(answeredQuestionsCount);
    }
}
