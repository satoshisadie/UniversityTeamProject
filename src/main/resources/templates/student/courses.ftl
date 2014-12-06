<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>Courses</title>

    <#include "*/commonHeader.ftl">
</head>
<body>
    <#include "*/menu.ftl">

    <div class="container">
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
                            <#if session.startDate lte .now?date && session.endDate gte .now?date>
                                <#include "studentCourse.ftl">
                            </#if>
                        </#list>
                    </div>

                    <div id="past-courses" class="past-courses tab-pane" role="tabpanel">
                        <#list sessions as session>
                            <#if session.endDate lt .now?date>
                                <#include "studentCourse.ftl">
                            </#if>
                        </#list>
                    </div>

                    <div id="upcoming-courses" class="upcoming-courses tab-pane" role="tabpanel">
                        <#list sessions as session>
                            <#if session.startDate gt .now?date>
                                <#include "studentCourse.ftl">
                            </#if>
                        </#list>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <#include "*/footer.ftl">
</body>
</html>