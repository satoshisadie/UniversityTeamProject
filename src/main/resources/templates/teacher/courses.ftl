<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>Teacher Dashboard</title>

    <#include "*/commonHeader.ftl" >

    <link type="text/css" rel="stylesheet" href="/css/teacher/courses.css">

    <script type="application/javascript" src="/js/teacher/courses.js"></script>
</head>
<body>
    <div class="container">
        <#include "*/menu.ftl">

        <div class="content row">
            <div class="col-md-6 col-md-offset-3">
                <a class="btn btn-primary" href="/teacher/courses/new" style="margin-bottom: 30px;">New course</a>

                <div class="courses">
                    <#list courses as course>
                        <div class="teacher-course media">
                            <a class="media-left">
                                <img src="/img/avatar.jpg">
                            </a>

                            <div class="media-body">
                                <a href="./${course.id?c}">
                                    <h4 class="media-heading">${course.name}</h4>
                                </a>
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