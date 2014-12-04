<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>Courses</title>

    <#include "*/commonHeader.ftl">
    <link type="text/css" rel="stylesheet" href="/css/student/courses.css">
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
                        <#list sessions as session>
                            <#if session.status == 1>
                                <#include "studentCourse.ftl">
                            </#if>
                        </#list>
                    </div>

                    <div id="past-courses" class="past-courses tab-pane" role="tabpanel">
                        <#list sessions as session>
                            <#if session.status == 2>
                                <#include "studentCourse.ftl">
                            </#if>
                        </#list>
                    </div>

                    <div id="upcoming-courses" class="upcoming-courses tab-pane" role="tabpanel">
                        <#list sessions as session>
                            <#if session.status == 3>
                                <#include "studentCourse.ftl">
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