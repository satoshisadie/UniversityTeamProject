package com.university.controllers.client;

import com.university.controllers.client.model.Question;
import com.university.controllers.client.model.Test;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping(value = "/student")
public class StudentController {

    @RequestMapping(value = "/course/")
    public ModelAndView course() {
        final ModelAndView modelAndView = new ModelAndView("/student/course");

        return modelAndView;
    }

    @RequestMapping("/test/")
    public ModelAndView passTest() {
        final ModelAndView modelAndView = new ModelAndView("/student/test");

        Test newTest = new Test();
        newTest.setTestTitle("Information technology test 1");

        List<String> ans = new ArrayList<>();
        ans.add("sdjb sdf sdfm");
        ans.add("sdkvh sduhf ");
        ans.add("lasc asdk a[sldk aosdjkn oasj");

        Question question = new Question();
        question.setTitle("WTF?");
        question.setPicture("../img/download.png");
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

        modelAndView.addObject("questions", newTest);

        return modelAndView;
    }
}
