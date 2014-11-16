package com.university.controllers.admin;

import com.university.controllers.client.model.Course;
import com.university.controllers.client.model.Question;
import com.university.controllers.client.model.Test;
import javafx.util.Pair;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class AdminController {

    @RequestMapping("/admin/home")
    public ModelAndView home() {
        final ModelAndView modelAndView = new ModelAndView("test");

        modelAndView.addObject("data", 0);

        return modelAndView;
    }

    @RequestMapping("/login")
    public ModelAndView login() {
        final ModelAndView modelAndView = new ModelAndView("login");

        return modelAndView;
    }

    @RequestMapping("/dashboard")
    public ModelAndView dashboard() {
        final ModelAndView modelAndView = new ModelAndView("UserDashboard");

//        modelAndView.addObject("userName", "Ololosh Ololoyev");
        List<Course> cources = new ArrayList<Course>();
        Course c = new Course();
        c.setTitle("Information technology");
        c.setDescription("ololo ololo sjdvh dskvj sdjvn sdjbgv sdjhv s");
        c.setImg("../img/download.png");
        cources.add(c);

        c = new Course();
        c.setTitle("Math");
        c.setDescription("ololo adf eraosfg rgf rgflolo sjdvh dskvj sdjvn sdjbgv sdjhv s");
        c.setImg("../img/download.png");
        cources.add(c);

        c = new Course();
        c.setTitle("Technical english");
        c.setDescription("ololo ololo sjdvh dskvj sdjvn sdjbgv sdjhv ssdv e");
        c.setImg("../img/download.png");
        cources.add(c);

        c = new Course();
        c.setTitle("Speaking");
        c.setDescription("olo sdv sdvslo ololo sjdvh dskvj sdjvn sdjbgv sdjhv ssdv e");
        c.setImg("../img/download.png");
        cources.add(c);

        c = new Course();
        c.setTitle("Swimming");
        c.setDescription("olo dvslo ololo sjdvh dskvj sdjvn sdjbgv sdjhv ssdv e");
        c.setImg("../img/download.png");
        cources.add(c);

//        c = new Course();
//        c.setTitle("Modeling");
//        c.setDescription("o sv sv sdv sdfv sfv dfv fsdf df dfv df cx df lo dvslo ololo sjdvh dskvj sdjvn sdjbgv sdjhv ssdv e");
//        c.setImg("../img/download.png");
//        cources.add(c);

        modelAndView.addObject("cources", cources);

        return modelAndView;
    }

    @RequestMapping("/test")
    public ModelAndView test() {
        final ModelAndView modelAndView = new ModelAndView("passTest");

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
