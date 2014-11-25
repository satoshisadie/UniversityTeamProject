<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title></title>

    <#include "*/commonHeader.ftl">

    <link type="text/css" rel="stylesheet" href="/css/student/lessons.css">

    <script type="application/javascript" src="/js/main.js"></script>
    <script type="application/javascript" src="/js/student/lessons.js"></script>
</head>
<body>
<div class="container">
    <#include "*/menu.ftl">

    <div class="content">
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
        </div>

        <div class="col-md-6" style="min-height: 800px;">
            <div class="lessons tab-content">
                <#list lessons as lesson>
                    <div id="lesson-${lesson_index + 1}" class="student-lesson tab-pane" role="tabpanel">
                        <div class="student-lesson-content">
                            ${lesson.content!}
                        </div>

                        <br>
                        <a class="btn btn-primary" href="/student/test/?lessonId=${lesson.id?c}">Pass test</a>

                        <input class="id" type="hidden" value="${lesson.id?c}"/>
                    </div>
                </#list>
            </div>
        </div>
    </div>

    <#include "*/footer.ftl">
</div>
</body>
</html>