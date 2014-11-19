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
    <script type="application/javascript" src="/js/libs/tinymce/tinymce.min.js"></script>

    <script type="application/javascript" src="/js/main.js"></script>
    <script type="application/javascript" src="/js/teacher/lessons.js"></script>
</head>
<body>
<div class="container">
    <#include "*/menu.ftl">

    <div class="row">
        <div class="col-md-2 col-md-offset-2">
            <ul class="nav nav-pills nav-stacked">
                <#list lessons as lesson>
                    <li role="presentation"><a href="#lesson-${lesson_index + 1}">Lesson ${lesson_index + 1}</a></li>
                </#list>
            </ul>
            <br>
            <input class="new-lesson btn btn-primary" type="button" value="New lesson">
            <br>
            <br>
            <input class="save-changes btn btn-primary" type="button" value="Save changes">
        </div>

        <div class="col-md-6">
            <div class="lessons">
                <#list lessons as lesson>
                    <div class="teacher-lesson routable" data-hash="#lesson-${lesson_index + 1}">
                        <label for="content">Lesson content</label>
                        <textarea id="content" class="content" rows="4">${lesson.content!}</textarea>

                        <input class="id" type="hidden" value="${lesson.id}"/>
                    </div>
                </#list>
            </div>

            <div class="new-lesson routable" data-hash="#new-lesson">
                this is a new lesson
            </div>
        </div>
    </div>

    <input class="course-id" type="hidden" value="${courseId}"/>
</div>
</body>
</html>