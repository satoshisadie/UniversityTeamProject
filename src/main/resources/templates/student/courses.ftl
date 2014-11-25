<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title></title>

<#include "*/commonHeader.ftl">
    <link type="text/css" rel="stylesheet" href="/css/student/courses.css">
    <script type="application/javascript" src="/js/student/courses.js"></script>
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

                    <div role="tabpanel">
                        <ul class="nav nav-tabs navbar-right">
                            <li role="presentation" class="active">
                                <a href="#current-courses" role="tab" data-toggle="tab" aria-controls="current-courses">Current</a>
                            </li>
                            <li role="presentation">
                                <a href="#past-courses" role="tab" data-toggle="tab" aria-controls="past-courses">Past</a>
                            </li>
                            <li role="presentation">
                            <a href="#upcoming-courses" role="tab" data-toggle="tab" aria-controls="upcoming-courses">Upcoming</a>
                        </li>
                        </ul>
                    </div>
                </div>
            </blockquote>

            <div class="student-courses tab-content">
                <div id="current-courses" class="current-courses tab-pane active" role="tabpanel">
                <#list courses as course>
                    <#if course.status == 1>

                        <div class="student-course media" style="margin-bottom: 30px;">
                            <a class="media-left">
                                <#if course.img??>
                                    <img src="${course.img}" style="max-height: 100px; max-width: 100px;">
                                </#if>
                            </a>

                            <div class="media-body">
                                <a href="../course/${course.id?c}">
                                    <h4 class="media-heading">${course.name}</h4>
                                </a>
                                <span>Stanford</span>

                                <div class="buttons-container" style="margin-top: 15px;">
                                    <a class="course-info" href="../course/${course.id?c}">course info</a>
                                    <span>|</span>
                                    <a class="un-enroll" href="/student/courses/${course.id?c}">un-enroll</a>
                                </div>
                            </div>
                            <a class="go-to-class btn btn-success" style="float: right; margin-top: -50px;" href="/student/lessons/?courseId=${course.id?c}">Go to class</a>

                            <input class="id" type="hidden" value="${course.id?c}">
                        </div>
                    </#if>
                </#list>
                </div>

                <div id="past-courses" class="past-courses tab-pane" role="tabpanel">
                <#list courses as course>
                    <#if course.status == 2>

                        <div class="student-course media" style="margin-bottom: 30px;">
                            <a class="media-left">
                                <#if course.img??>
                                    <img src="${course.img}" style="max-height: 100px; max-width: 100px;">
                                </#if>
                            </a>

                            <div class="media-body">
                                <a href="../course/${course.id?c}">
                                    <h4 class="media-heading">${course.name}</h4>
                                </a>
                                <span>Stanford</span>

                                <div class="buttons-container" style="margin-top: 15px;">
                                    <a class="course-info" href="../course/${course.id?c}">course info</a>
                                </div>
                            </div>
                            <a class="go-to-class btn btn-success" style="float: right; margin-top: -50px;" href="/student/lessons/?courseId=${course.id?c}">Go to class</a>

                            <input class="id" type="hidden" value="${course.id?c}">
                        </div>

                    </#if>
                </#list>
                </div>

                <div id="upcoming-courses" class="upcoming-courses tab-pane" role="tabpanel">
                <#list courses as course>
                    <#if course.status == 3>

                        <div class="student-course media" style="margin-bottom: 30px;">
                            <a class="media-left">
                                <#if course.img??>
                                    <img src="${course.img}" style="max-height: 100px; max-width: 100px;">
                                </#if>
                            </a>

                            <div class="media-body">
                                <a href="../course/${course.id?c}">
                                    <h4 class="media-heading">${course.name}</h4>
                                </a>
                                <span>Stanford</span>

                                <div class="buttons-container" style="margin-top: 15px;">
                                    <a class="course-info" href="../course/${course.id?c}">course info</a>
                                    <span>|</span>
                                    <a class="un-enroll" href="/student/courses/${course.id?c}">un-enroll</a>
                                </div>
                            </div>

                            <input class="id" type="hidden" value="${course.id?c}">
                        </div>

                    </#if>
                </#list>
                </div>
            </div>
        </div>
    </div>

<#include "*/footer.ftl">
</div>
</body>
</html>