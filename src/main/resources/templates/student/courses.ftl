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

                <div class="student-courses">
                    <#list courses as course>
                        <div class="student-course media" style="margin-bottom: 30px;">
                            <a class="media-left">
                                <img src="/img/avatar.jpg">
                            </a>

                            <div class="media-body">
                                <a href="./${course.id?c}">
                                    <h4 class="media-heading">${course.name}</h4>
                                </a>
                                <span>Stanford</span>
                                <div class="buttons-container" style="margin-top: 15px;">
                                    <a class="course-info" href="/student/courses/${course.id?c}">course info</a>
                                    <span>|</span>
                                    <a class="un-enroll" href="/student/courses/${course.id?c}">un-enroll</a>
                                </div>
                            </div>
                            <a class="go-to-class btn btn-success" style="float: right; margin-top: -70px;" href="/student/lessons/?courseId=${course.id?c}">Go to class</a>

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