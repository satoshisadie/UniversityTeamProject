<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>Teacher Dashboard</title>

    <#include "*/commonHeader.ftl">

    <link type="text/css" rel="stylesheet" href="/css/teacher/lessons.css">

    <script type="application/javascript" src="/js/libs/tinymce/tinymce.min.js"></script>
    <script type="application/javascript" src="/js/teacher/lessons.js"></script>
</head>
<body>
    <#include "*/menu.ftl">

    <div class="container">
        <div class="content row">
            <div class="col-md-2 col-md-offset-2">
                <ul class="nav nav-pills nav-stacked">
                    <#list lessons as lesson>
                        <li role="presentation">
                            <a href="#lesson-${lesson_index + 1}" aria-controls="lesson-${lesson_index + 1}" role="tab" data-toggle="pill">
                                Lesson ${lesson_index + 1}
                            </a>
                        </li>
                    </#list>
                </ul>
                <br>
                <input class="new-lesson btn btn-primary" type="button" value="New lesson">
                <br>
                <br>
                <input class="save-changes btn btn-primary" type="button" value="Save changes">
            </div>

            <div class="col-md-6">
                <div class="lessons tab-content">
                    <#list lessons as lesson>
                        <div id="lesson-${lesson_index + 1}" class="teacher-lesson tab-pane" role="tabpanel">
                            <label for="content">Lesson content</label>
                            <textarea id="content" class="content" rows="4">${lesson.content!}</textarea>
                            <br>
                            <br>
                            <a class="btn btn-primary" href="/teacher/tests/?lessonId=${lesson.id?c}">Edit test</a>
                            <input class="id" type="hidden" value="${lesson.id?c}"/>
                        </div>
                    </#list>
                </div>

                <div class="new-lesson routable" data-hash="#new-lesson">
                    this is a new lesson
                </div>
            </div>
        </div>
        <input class="course-id" type="hidden" value="${sessionId}"/>
    </div>

    <#include "*/footer.ftl">
</body>
</html>