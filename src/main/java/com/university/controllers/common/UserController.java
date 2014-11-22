package com.university.controllers.common;

import com.university.controllers.client.model.Course;
import com.university.controllers.client.model.Teacher;
import com.university.controllers.client.model.User;
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

        final List<Course> courses = courseDao.getCourses();
        modelAndView.addObject("courses", courses);

        CommonUtils.addUserToModel(httpServletRequest, modelAndView);

        return modelAndView;
    }

    @RequestMapping("/course/{courseId}")
    public ModelAndView course(@PathVariable Long courseId,
                               HttpServletRequest httpServletRequest) throws Exception {
        final ModelAndView modelAndView = new ModelAndView("/course");

        final Optional<Course> course = courseDao.getCourse(courseId);

        if(course.isPresent()) {
            modelAndView.addObject("course", course.get());
        }else{
            throw new Exception("Course not found");
        }

        final Optional<Teacher> teacher = userDao.getTeacherById(course.get().getTeacher());

        if(teacher.isPresent()) {
            modelAndView.addObject("teacher", teacher.get());
        }else{
            throw new Exception("Teacher not found");
        }

        CommonUtils.addUserToModel(httpServletRequest, modelAndView);

        return modelAndView;
    }

    @RequestMapping("/profile")
    public ModelAndView user(HttpServletRequest httpServletRequest)
    {
        final ModelAndView modelAndView = new ModelAndView("/user/profile");
        CommonUtils.addUserToModel(httpServletRequest, modelAndView);

        return modelAndView;
    }

    @RequestMapping("/profile/edit")
    public ModelAndView edit() {
        final ModelAndView modelAndView = new ModelAndView("/user/editProfile");

        User user = new User();
//        user.setGender("Male");
        user.setInfo("lalalalalalalalalalalalalala");
//        user.setLocation("Cherkasy, Ukraine");
        user.setLogin("Anton Salenkov");
        user.setPhoto("../img/avatar.jpg");

        modelAndView.addObject("user", user);

        return modelAndView;
    }
}
