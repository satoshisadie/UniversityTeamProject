package com.university.controllers.common;

import com.university.controllers.client.model.*;
import com.university.dao.CourseDao;
import com.university.dao.UserDao;
import com.university.utils.CommonUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Optional;

@Controller
public class UserController {
    @Autowired private UserDao userDao;
    @Autowired private CourseDao courseDao;

    @RequestMapping("/sign-in")
    public String login() {
        return "/user/signIn";
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String signIn(@RequestParam(value = "login") String login,
                         @RequestParam(value = "password") String password,
                         HttpServletRequest httpServletRequest)
    {
        final Optional<User> userOptional = userDao.getUserByLogin(login);

        if (userOptional.isPresent()) {
            final User user = userOptional.get();

            if (user.getPassword().equals(password)) {
                final HttpSession session = httpServletRequest.getSession();
                session.setAttribute("user", user);

                final String urlBeforeSignIn = (String)session.getAttribute("URLBeforeSignIn");

                if(urlBeforeSignIn != null) {
                    return "redirect:" + urlBeforeSignIn;
                }

                return "redirect:";
            }
        }
        return "redirect:/login";
    }

    @RequestMapping("/sign-up")
    public String signUp() {
        return "/user/signUp";
    }

    @RequestMapping(value = "/new-student", method = RequestMethod.POST)
    public String newUser(User user) {
        long id = userDao.insertNewStudent(user);

        return "redirect:/sign-in";
    }

    @RequestMapping(value = "/log-out")
    public String newUser(HttpServletRequest httpServletRequest) {
        final HttpSession session = httpServletRequest.getSession();
        session.removeAttribute("user");

        return "redirect:/";
    }

    @RequestMapping(value = "/new-teacher", method = RequestMethod.POST)
//    @ResponseBody
    public String newTeacher(Teacher teacher) {
        long id = userDao.insertNewTeacher(teacher);

        return "redirect:/sign-in";
    }

    @RequestMapping("/")
    public ModelAndView mainPage(HttpServletRequest httpServletRequest)
    {
        final ModelAndView modelAndView = new ModelAndView("/mainPage");

        final List<Course> courses = courseDao.getOpenCourses();
        modelAndView.addObject("courses", courses);

        CommonUtils.addUserToModel(httpServletRequest, modelAndView);

        return modelAndView;
    }

    @RequestMapping("/course/{sessionId}")
    public ModelAndView course(@PathVariable Long sessionId,
                               HttpServletRequest httpServletRequest) throws Exception {
        final ModelAndView modelAndView = new ModelAndView("/course");

        final Optional<Session> session = courseDao.getSession(sessionId);

        if(session.isPresent()) {
            modelAndView.addObject("course", session.get());

            final Teacher teacher = userDao.getTeacherById(session.get().getTeacher());
            modelAndView.addObject("teacher", teacher);

            CommonUtils.addUserToModel(httpServletRequest, modelAndView);

            return modelAndView;
        }
        throw new Exception("Course not found");
    }

    @RequestMapping("/profile")
    public ModelAndView user(HttpServletRequest httpServletRequest)
    {
        final ModelAndView modelAndView = new ModelAndView("/user/profile");
        CommonUtils.addUserToModel(httpServletRequest, modelAndView);

        return modelAndView;
    }

    @RequestMapping("/profile/edit")
    public ModelAndView edit(HttpServletRequest httpServletRequest) {
        final ModelAndView modelAndView = new ModelAndView("/user/editProfile");

        CommonUtils.addUserToModel(httpServletRequest, modelAndView);

        return modelAndView;
    }

    @RequestMapping(value = "/profile/edit/save", method = RequestMethod.POST)
    public String saveCourse(ProfileSaveForm profileSaveForm, HttpServletRequest httpServletRequest) {

        User user = CommonUtils.getUserFromRequest(httpServletRequest);
        userDao.saveProfile(user.getId(), profileSaveForm, user.getType());

        return "redirect:../../profile/";
    }

    @RequestMapping("/teachers")
    public ModelAndView teachers(HttpServletRequest httpServletRequest) {
        final ModelAndView modelAndView = new ModelAndView("/user/teachers");

        CommonUtils.addUserToModel(httpServletRequest, modelAndView);

        List<Teacher> teachers = userDao.getAllTeachers();
        modelAndView.addObject("teachers", teachers);

        return modelAndView;
    }

    @RequestMapping("/about-us")
    public ModelAndView aboutUs(HttpServletRequest httpServletRequest) {
        final ModelAndView modelAndView = new ModelAndView("/user/aboutUs");

        CommonUtils.addUserToModel(httpServletRequest, modelAndView);

        return modelAndView;
    }

    @RequestMapping("/contacts")
    public ModelAndView contacts(HttpServletRequest httpServletRequest) {
        final ModelAndView modelAndView = new ModelAndView("/user/contacts");

        CommonUtils.addUserToModel(httpServletRequest, modelAndView);

        return modelAndView;
    }

    @RequestMapping("/help")
    public ModelAndView help(HttpServletRequest httpServletRequest) {
        final ModelAndView modelAndView = new ModelAndView("/user/help");

        CommonUtils.addUserToModel(httpServletRequest, modelAndView);

        return modelAndView;
    }
}
