package com.university.controllers.client;

import com.university.controllers.client.model.*;
import com.university.dao.CourseDao;
import com.university.dao.UserDao;
import com.university.utils.CommonUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping(value = "/student")
public class StudentController {
    @Autowired CourseDao courseDao;
    @Autowired UserDao userDao;

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

        final List<Course> userCourses = userDao.getUserCourses(user.getId());
        modelAndView.addObject("courses", userCourses);

        return modelAndView;
    }

    @RequestMapping("/test/{id}")
    public ModelAndView passTest(@PathVariable Long testId)
    {
        final ModelAndView modelAndView = new ModelAndView("/student/test");

        Test newTest = new Test();
        newTest.setTitle("Information technology test 1");

        List<String> ans = new ArrayList<>();
        ans.add("sdjb sdf sdfm");
        ans.add("sdkvh sduhf ");
        ans.add("lasc asdk a[sldk aosdjkn oasj");

        Question question = new Question();
        question.setTitle("WTF?");
        question.setPicture("/img/download.png");
        question.setAnswers(ans);

        List<Question> questions = new ArrayList<>();
        questions.add(question);

        ans = new ArrayList<>();
        ans.add("sdjvb kasjdf keajd");
        ans.add("5");
        ans.add("kwahsd  adhn awisdh");
        ans.add("aesdf sadc");

        question = new Question();
        question.setTitle("Select best number");
        question.setDescription("fghjkjhgfdfghjkljhgf cvjkjhgv jkljhgv njm,jhg.");
        question.setAnswers(ans);
        questions.add(question);

        newTest.setQuestions(questions);

        modelAndView.addObject("test", newTest);

        return modelAndView;
    }
}
