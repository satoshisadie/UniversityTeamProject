package com.university.controllers.common;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.university.controllers.client.model.*;
import com.university.dao.CourseDao;
import com.university.dao.UserDao;
import com.university.utils.CommonUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Optional;

@Controller
public class UserController {
    @Autowired private UserDao userDao;
    @Autowired private CourseDao courseDao;
    @Autowired private Gson serializer;

    @RequestMapping("/sign-in")
    public String login() {
        return "/user/signIn";
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    @ResponseBody
    public String signIn(@RequestParam String signInJson,
                         HttpServletRequest httpServletRequest)
    {
        final SignInModel signInModel = serializer.fromJson(signInJson, SignInModel.class);
        final Optional<User> userOptional = userDao.getUserByCredentials(signInModel.getLogin(), signInModel.getPassword());

        final JsonObject response = new JsonObject();

        if (userOptional.isPresent()) {
            final HttpSession session = httpServletRequest.getSession();

            session.setAttribute("user", userOptional.get());
            response.addProperty("status", "success");
            response.addProperty("redirectUrl", Optional.ofNullable((String) session.getAttribute("redirectUrl")).orElse("/"));
        } else {
            response.addProperty("status", "error");
        }

        return response.toString();
    }

    @RequestMapping("/sign-up")
    public String signUp() {
        return "/user/signUp";
    }

    @RequestMapping(value = "/log-out")
    public String logout(HttpServletRequest httpServletRequest) {
        httpServletRequest.getSession().invalidate();

        return "redirect:/";
    }

    @RequestMapping(value = "/new-student", method = RequestMethod.POST)
    @ResponseBody
    public String newUser(@RequestParam String studentJson)
    {
        final User user = serializer.fromJson(studentJson, User.class);
        userDao.createStudent(user);

        return "success";
    }

    @RequestMapping(value = "/new-teacher", method = RequestMethod.POST)
    @ResponseBody
    public String newTeacher(@RequestParam String teacherJson)
    {
        final Teacher teacher = serializer.fromJson(teacherJson, Teacher.class);
        userDao.createTeacher(teacher);

        return "success";
    }

    @RequestMapping("/")
    public ModelAndView mainPage(HttpServletRequest httpServletRequest)
    {
        final ModelAndView modelAndView = new ModelAndView("/mainPage");

        final List<CourseSession> sessions = courseDao.getOpenSessions();
        modelAndView.addObject("sessions", sessions);

        CommonUtils.addUserToModel(httpServletRequest, modelAndView);

        return modelAndView;
    }

    @RequestMapping("/course/{sessionId}")
    public ModelAndView course(@PathVariable Long sessionId,
                               HttpServletRequest httpServletRequest) throws Exception {
        final ModelAndView modelAndView = new ModelAndView("/course");

        final Optional<CourseSession> session = courseDao.getSession(sessionId);

        if(session.isPresent()) {
            modelAndView.addObject("session", session.get());

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

    @RequestMapping("/tags")
    @ResponseBody
    public String tagsJson() {
        final List<Tag> tags = courseDao.getTags();
        return serializer.toJson(tags);
    }
}
