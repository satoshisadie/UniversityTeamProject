<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>CourseUp</title>

    <#include "*/commonHeader.ftl">

    <link type="text/css" rel="stylesheet" href="/css/teacherDashboard.css">

    <script type="application/javascript" src="/js/mainPage.js"></script>
</head>
<body>
<div class="container">
    <#include "*/menu.ftl">

    <div class="content row">
        <div class="col-md-2 col-lg-offset-2">
            <ul class="tag-select nav nav-pills nav-stacked">
                <li role="presentation"><a href="" data-tag="all">All</a></li>
                <li role="presentation"><a href="" data-tag="arts">Arts</a></li>
                <li role="presentation"><a href="" data-tag="biology">Biology</a></li>
                <li role="presentation"><a href="" data-tag="chemistry">Chemistry</a></li>
                <li role="presentation"><a href="" data-tag="computer science">Computer Science</a></li>
                <li role="presentation"><a href="" data-tag="economics">Economics</a></li>
                <li role="presentation"><a href="" data-tag="law">Law</a></li>
                <li role="presentation"><a href="" data-tag="mathematics">Mathematics</a></li>
                <li role="presentation"><a href="" data-tag="physics">Physics</a></li>
            </ul>
        </div>

        <div class="col-md-6">
            <div class="courses">
                <#list courses as course>
                    <div class="course media">
                        <a class="media-left">
                            <img src="/img/avatar.jpg">
                        </a>

                        <div class="media-body">
                            <a href="./course/${course.id?c}">
                                <h4 class="media-heading">${course.name}</h4>
                            </a>
                            <p>${coursesTeachers[course_index].educationalEstablishment!}</p>
                            <p>${coursesTeachers[course_index].firstName!} ${coursesTeachers[course_index].lastName!}</p>
                        </div>

                        <input class="id" type="hidden" value="${course.id?c}">
                        <input class="tags" type="hidden" value="<#if course.tags??><#list course.tags as tag>${tag.name}</#list></#if>"/>
                    </div>
                </#list>
            </div>
        </div>
    </div>
</div>
</body>
</html>