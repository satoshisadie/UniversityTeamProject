<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title></title>

    <#include "*/commonHeader.ftl">
</head>
<body>
    <div class="container">
        <#include "*/menu.ftl">

        <div class="content row">
            <div class="col-md-8 col-md-offset-2">
                <blockquote>
                    <div class="row">
                        <div class="col-md-6">
                            <h4>YOUR COURSES</h4>
                        </div>

                        <ul class="nav nav-tabs navbar-right">
                            <li role="presentation" class="active">
                                <a href="#current">Current</a>
                            </li>
                            <li role="presentation">
                                <a href="#past">Past</a>
                            </li>
                            <li role="presentation">
                                <a href="#upcoming">Upcoming</a>
                            </li>
                        </ul>
                    </div>
                </blockquote>

            <#--<br>-->
            <#--<br>-->

                <div class="student-courses">
                    <#list courses as course>
                        <div class="student-course media">
                            <a class="media-left">
                                <img src="/img/avatar.jpg">
                            </a>

                            <div class="media-body">
                                <a href="./${course.id?c}">
                                    <h4 class="media-heading">${course.name}</h4>
                                </a>
                                <span class="description">${course.description}</span>
                                <br>
                                <a class="course-info" href="/student/courses/${course.id?c}">course info</a>
                                <a class="un-enroll" href="/student/courses/${course.id?c}">un-ebroll</a>
                                <a class="go-to-class btn btn-success" href="/student/lessons/?courseId=${course.id?c}">Go to class</a>
                            </div>

                            <input class="id" type="hidden" value="${course.id?c}">
                        </div>
                    </#list>
                </div>
            </div>
        </div>

        <#include "*/footer.ftl">
    </div>
</body>
</html>