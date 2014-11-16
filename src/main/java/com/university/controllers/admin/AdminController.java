package com.university.controllers.admin;

import com.university.controllers.client.model.User;
import javafx.util.Pair;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.time.LocalDate;
import java.time.Month;
import java.util.ArrayList;
import java.util.Date;
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

        modelAndView.addObject("userName", "User name");
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

    @RequestMapping("/user")
    public ModelAndView user() {
        final ModelAndView modelAndView = new ModelAndView("UserProfile");

        LocalDate bornDate = LocalDate.of(1995, Month.FEBRUARY, 15);
        LocalDate nowDate =  LocalDate.now();
        User user = new User();
        user.setUserPhoto("../img/download.png");
        user.setUserName("User name");
        user.setUserGender("Male");
        user.setUserAge(nowDate.compareTo(bornDate));
        user.setUserLocation("Cherkasy, Ukraine");
        user.setUserInfo("Test Info: This course will provide you with an overview of the most important health challenges facing the world today. You will gain insight into how challenges have changed over time, we will discuss the likely determinants of such changes and examine future projections. Successful international strategies and programs promoting human health will be highlighted and global health governance structures will be mapped and the role of the key actors explored.");
        modelAndView.addObject("user", user);

        return modelAndView;
    }

    @RequestMapping("/user/profile")
    public ModelAndView userEdit() {
        final ModelAndView modelAndView = new ModelAndView("EditUserProfile");

        LocalDate bornDate = LocalDate.of(1995, Month.FEBRUARY, 15);
        LocalDate nowDate =  LocalDate.now();
        User user = new User();
        user.setUserBirthday(bornDate);
        user.setUserPhoto("../img/download.png");
        user.setUserName("User name");
        user.setUserGender("Male");
        user.setUserAge(nowDate.compareTo(bornDate));
        user.setUserLocation("Cherkasy, Ukraine");
        user.setUserInfo("Test Info: This course will provide you with an overview of the most important health challenges facing the world today. You will gain insight into how challenges have changed over time, we will discuss the likely determinants of such changes and examine future projections. Successful international strategies and programs promoting human health will be highlighted and global health governance structures will be mapped and the role of the key actors explored.");
        modelAndView.addObject("user", user);

        return modelAndView;
    }
}
