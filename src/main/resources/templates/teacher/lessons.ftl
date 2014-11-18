<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>Teacher Dashboard</title>

    <link type="text/css" rel="stylesheet" href="/css/libs/bootstrap.css">
    <link type="text/css" rel="stylesheet" href="/css/teacherLessons.css">

    <script type="application/javascript" src="/js/libs/jquery-2.1.1.js"></script>
    <script type="application/javascript" src="/js/libs/bootstrap.js"></script>
    <script type="application/javascript" src="/js/libs/underscore.js"></script>
    <script type="application/javascript" src="/js/teacher/lessons.js"></script>
</head>
<body>
<div class="container">
    <#include "*/menu.ftl">

    <div class="row">
        <div class="col-md-2 col-md-offset-2">
            <ul class="nav nav-pills nav-stacked">
                <li><a class="new-lesson" href="#new-lesson">New lesson</a></li>
                <#list lessons as lesson>
                    <li><a href="#lesson-${lesson_index + 1}">Lesson ${lesson_index + 1}</a></li>
                </#list>
            </ul>
        </div>

        <div class="col-md-6">
            <div class="lessons">
                <#list lessons as lesson>
                    <div class="teacher-lesson routable" style="display: none;" data-hash="#lesson-${lesson_index + 1}">
                        <textarea class="form-control" name="" id="" rows="4">${lesson.description}</textarea>

                        <input name="id" type="hidden" value="${lesson.id}"/>
                    </div>
                </#list>
            </div>

            <div class="new-lesson routable" data-hash="#new-lesson">
                this is a new lesson
            </div>
        </div>
    </div>

    <input name="courseId" type="hidden" value="${courseId}"/>
</div>
</body>
</html>