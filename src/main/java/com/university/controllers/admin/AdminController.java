package com.university.controllers.admin;

import javafx.util.Pair;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;

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
        final ModelAndView modelAndView = new ModelAndView("test2");

        modelAndView.addObject("data", "some data");

        return modelAndView;
    }

    @RequestMapping("/dashboard")
    public ModelAndView dashboard() {
        final ModelAndView modelAndView = new ModelAndView("UserDashboard");

//        modelAndView.addObject("userName", "User name");
        List<Pair<String, String>> cources = new ArrayList<Pair<String, String>>();
        cources.add(new Pair<String, String>("Information technology", "ololo ololo sjdvh dskvj sdjvn sdjbgv sdjhv s"));
        cources.add(new Pair<String, String>("Math", "ololo adf eraosfg rgf rgflolo sjdvh dskvj sdjvn sdjbgv sdjhv s"));
        cources.add(new Pair<String, String>("Technical english", "ololo ololo sjdvh dskvj sdjvn sdjbgv sdjhv ssdv e"));
        cources.add(new Pair<String, String>("Speaking", "olo sdv sdvslo ololo sjdvh dskvj sdjvn sdjbgv sdjhv ssdv e"));
        cources.add(new Pair<String, String>("Swimming", "olo dvslo ololo sjdvh dskvj sdjvn sdjbgv sdjhv ssdv e"));
//        cources.add(new Pair<String, String>("Modeling", "o sv sv sdv sdfv sfv dfv fsdf df dfv df cx df lo dvslo ololo sjdvh dskvj sdjvn sdjbgv sdjhv ssdv e"));

        modelAndView.addObject("cources", cources);

        return modelAndView;
    }
}
