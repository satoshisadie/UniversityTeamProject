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

    <div class="content row">
        <div class="col-md-2 col-md-offset-2">
            <ul class="nav nav-pills nav-stacked">
                <#list lessons as lesson>
                    <li role="presentation"><a href="#lesson-${lesson_index + 1}">Lesson ${lesson_index + 1}</a></li>
                </#list>
            </ul>
        </div>

        <div class="col-md-6" style="min-height: 800px;">
            <div class="lessons">
                <#list lessons as lesson>
                    <div class="student-lesson routable" data-hash="#lesson-${lesson_index + 1}">
                        ${lesson.content!}

                        <input class="id" type="hidden" value="${lesson.id}"/>
                    </div>
                </#list>
            </div>
        </div>
    </div>

    <#include "*/footer.ftl">
</div>
</body>
</html>