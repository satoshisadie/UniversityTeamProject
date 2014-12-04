package com.university.controllers.client;

import com.google.gson.*;
import com.university.controllers.client.model.*;
import com.university.dao.CourseDao;
import com.university.dao.UserDao;
import com.university.utils.CommonUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.text.DecimalFormat;
import java.util.*;
import java.util.stream.Collectors;

@Controller
@RequestMapping(value = "/student")
public class StudentController {
    @Autowired private CourseDao courseDao;
    @Autowired private UserDao userDao;
    @Autowired private Gson serializer;
    @Autowired private JsonParser jsonParser;

    private final DecimalFormat wholePercentsFormat = new DecimalFormat("#");

    @RequestMapping("/lessons/")
    public ModelAndView course(@RequestParam(value = "sessionId") Long sessionId) throws Exception {
        final ModelAndView modelAndView = new ModelAndView("/student/lessons");

        final List<Lesson> lessons = courseDao.getLessons(sessionId);
        modelAndView.addObject("lessons", lessons);

        final List<Long> lessonsIds = lessons.stream().map(Lesson::getId).collect(Collectors.toList());
        final List<Test> tests = courseDao.getTestsByLessonsIds(lessonsIds).stream()
                .map(test -> serializer.fromJson(test, Test.class))
                .collect(Collectors.toList());



        return modelAndView;
    }

    @RequestMapping(value = "/courses")
    public ModelAndView courses(HttpServletRequest httpServletRequest)
    {
        final ModelAndView modelAndView = new ModelAndView("/student/courses");

        final User user = CommonUtils.getUserFromRequest(httpServletRequest);
        modelAndView.addObject("user", user);

        final List<CourseSession> sessions = userDao.getUserCoursesSessions(user.getId());
        modelAndView.addObject("sessions", sessions);

        final List<Long> coursesIds = sessions.stream()
                .map(CourseSession::getCourseId)
                .collect(Collectors.toList());

        final List<Course> courses = courseDao.getCoursesByIds(coursesIds);
        final Map<String, Course> courseById = courses.stream()
                .collect(Collectors.toMap(course -> course.getId().toString(), course -> course));
        modelAndView.addObject("courseById", courseById);

        final List<Integer> teachersIds = courses.stream().map(Course::getTeacherId).collect(Collectors.toList());
        final Map<String, Teacher> teacherById = userDao.getTeachersByIds(teachersIds).stream()
                .collect(Collectors.toMap(teacher -> teacher.getId().toString(), teacher -> teacher));
        modelAndView.addObject("teacherById", teacherById);

        return modelAndView;
    }

    @RequestMapping("/test/")
    public ModelAndView passTest(@RequestParam Long lessonId) throws Exception {
        final ModelAndView modelAndView = new ModelAndView("/student/test");

        final Optional<String> test = courseDao.getTestByLessonId(lessonId);

        if (test.isPresent()) {
            modelAndView.addObject("test", serializer.fromJson(test.get(), Test.class));
            modelAndView.addObject("lessonId", lessonId);
            return modelAndView;
        }
        throw new Exception("Resource not found");
    }

    @RequestMapping("/test/check")
    @ResponseBody
    public String checkTest(@RequestParam Long lessonId,
                            @RequestParam String questionsJson,
                            HttpServletRequest httpServletRequest)
    {
        final JsonArray questionsArray = jsonParser.parse(questionsJson).getAsJsonArray();

        final Test test = serializer.fromJson(courseDao.getTestByLessonId(lessonId).get(), Test.class);

        final Iterator<JsonElement> iterator = questionsArray.iterator();

        int index = 0;
        int correctAnswersCount = 0;

        while (iterator.hasNext()) {
            final List<String> selectedAnswers = Arrays.asList(serializer.fromJson(iterator.next(), String[].class));
            final List<String> correctAnswers = test.getQuestions().get(index).getAnswers().stream()
                    .filter(Answer::getIsCorrect)
                    .map(Answer::getText)
                    .collect(Collectors.toList());

            if (selectedAnswers.size() == correctAnswers.size() && selectedAnswers.containsAll(correctAnswers)) {
                correctAnswersCount++;
            }
            index++;
        }

        final User student = CommonUtils.getUserFromRequest(httpServletRequest);
        courseDao.saveTestPassing(student.getId(), test.getId(), correctAnswersCount);

        final JsonObject response = new JsonObject();

        final double correctAnswersPercent = 1.0 * correctAnswersCount / test.getQuestions().size() * 100;
        if (correctAnswersPercent >= 80) {
            response.addProperty("status", "success");
        } else {
            response.addProperty("status", "failure");
        }
        response.addProperty("correctAnswersPercent", wholePercentsFormat.format(correctAnswersPercent));

        return response.toString();
    }
}
