package com.university.controllers.client;

import com.university.controllers.client.model.Course;
import com.university.controllers.client.model.CourseSaveForm;
import com.university.controllers.client.model.Lesson;
import com.university.dao.CourseDao;
import com.university.utils.CommonUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping(value = "/teacher")
public class TeacherController {
    @Autowired private CourseDao courseDao;

    @RequestMapping(value = "/courses/")
    public ModelAndView courses() {
        final ModelAndView modelAndView = new ModelAndView("/teacher/courses");

        List<Course> courses = courseDao.getCourses();
        modelAndView.addObject("courses", courses);

        return modelAndView;
    }

    @RequestMapping(value = "/courses/new", method = RequestMethod.GET)
    public String newCourse() {
        return "redirect:./" + CommonUtils.generateId();
    }

    @RequestMapping(value = "/courses/{id}")
    public ModelAndView editCourse(@PathVariable long id) {
        final ModelAndView modelAndView = new ModelAndView("/teacher/course");

        final Course course = getCourse(id);
        modelAndView.addObject("course", course);

        return modelAndView;
    }

    @RequestMapping(value = "/courses/{id}/save", method = RequestMethod.POST)
    public String saveCourse(@PathVariable long id, CourseSaveForm courseSaveForm) {
        courseDao.saveCourse(id, courseSaveForm);

        return "redirect:../../courses/";
    }

    @RequestMapping(value = "/lessons/")
    public ModelAndView lessons(@RequestParam long courseId) {
        final ModelAndView modelAndView = new ModelAndView("/teacher/lessons");

        final List<Lesson> courseLessons = courseDao.getLessons(courseId);
        modelAndView.addObject("lessons", courseLessons);
        modelAndView.addObject("courseId", courseId);

        return modelAndView;
    }

    @RequestMapping(value = "/courses/{courseId}/lessons/{lessonId}")
    public ModelAndView lesson(@PathVariable long courseId,
                               @PathVariable long lessonId)
    {
        final ModelAndView modelAndView = new ModelAndView("/teacher/lesson");

        final Lesson lesson = getLesson(lessonId);
        if (lesson.getCourseId() == null) {
            lesson.setCourseId(courseId);
        }
        modelAndView.addObject("lesson", lesson);

        return modelAndView;
    }

    @RequestMapping(value = "/lessons/new")
    public String newLesson() {
        return "redirect:./" + CommonUtils.generateId();
    }

    private Course getCourse(long id) {
        final Optional<Course> courseOptional = courseDao.getCourse(id);

        return courseOptional.orElseGet(() -> {
            final Course course = new Course();
            course.setId(id);
            return course;
        });
    }

    private Lesson getLesson(long id) {
        final Optional<Lesson> lessonOptional = courseDao.getLesson(id);

        return lessonOptional.orElseGet(() -> {
            final Lesson lesson = new Lesson();
            lesson.setId(id);
            return lesson;
        });
    }
}