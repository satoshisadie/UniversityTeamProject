<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>Teacher Dashboard</title>

    <link type="text/css" rel="stylesheet" href="/css/libs/bootstrap.css">
    <link type="text/css" rel="stylesheet" href="/css/teacherDashboard.css">

    <script type="application/javascript" src="/js/libs/jquery-2.1.1.js"></script>
    <script type="application/javascript" src="/js/libs/bootstrap.js"></script>
    <script type="application/javascript" src="/js/libs/underscore.js"></script>
    <script type="application/javascript" src="/js/teacher/courses.js"></script>
</head>
<body>
    <div class="container">
        <#include "*/menu.ftl">

        <div class="row">
            <div class="col-md-6 col-md-offset-3">
                <a class="btn btn-primary" href="/teacher/courses/new" style="margin-bottom: 30px;">New course</a>

                <div class="courses">
                    <#list courses as course>
                        <div class="teacher-course media">
                            <a class="media-left" href="./${course.id?c}">
                                <img src="/img/avatar.jpg">
                            </a>

                            <div class="media-body">
                                <h4 class="media-heading">${course.name}</h4>
                                <span class="description">${course.description}</span><br>
                                <a class="edit" href="/teacher/courses/${course.id?c}">Edit</a>
                            </div>

                            <input class="id" type="hidden" value="${course.id?c}">
                        </div>
                    </#list>
                </div>
            </div>
        </div>
    </div>
</body>
</html>