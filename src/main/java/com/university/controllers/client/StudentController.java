package com.university.controllers.client;

import com.university.controllers.client.model.Course;
import com.university.controllers.client.model.Lesson;
import com.university.controllers.client.model.Question;
import com.university.controllers.client.model.Test;
import com.university.dao.CourseDao;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping(value = "/student")
public class StudentController {

//    @RequestMapping(value = "/course/{id}")
//    public ModelAndView course(@PathVariable int courseId) {
//        final ModelAndView modelAndView = new ModelAndView("/student/course");
//
//        return modelAndView;
//    }

    @RequestMapping("/course")
    public ModelAndView course() {
        final ModelAndView modelAndView = new ModelAndView("/student/learnCourse");

        Course c = new Course();
        c.setName("Information technology");
        c.setDescription("ololo ololo sjdvh dskvj sdjvn sdjbgv sdjhv s");
        c.setImg("../img/download.png");
        c.setTeacher("Vasya Pupkin");
        modelAndView.addObject("course", c);

        return modelAndView;
    }

    @RequestMapping("/course/lessons")
    public ModelAndView lessons() {
        final ModelAndView modelAndView = new ModelAndView("/student/lessons");

        Course c = new Course();
        c.setName("Information technology");
        c.setImg("../img/download.png");

        modelAndView.addObject("course", c);

        List<Lesson> lessons = new ArrayList<Lesson>();
        Lesson l = new Lesson();
        l.setContent("lalala");
        lessons.add(l);

        l = new Lesson();
        l.setContent("atata");
        lessons.add(l);

        modelAndView.addObject("lessons", lessons);

        return modelAndView;
    }

    @RequestMapping("/test/")
    public ModelAndView passTest() {
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
