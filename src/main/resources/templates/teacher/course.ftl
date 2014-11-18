<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>Teacher Dashboard</title>

    <link type="text/css" rel="stylesheet" href="/css/libs/bootstrap.css">
    <link type="text/css" rel="stylesheet" href="/css/teacherDashboard.css">

    <script type="application/javascript" src="/js/libs/jquery-2.1.1.js"></script>
    <script type="application/javascript" src="/js/libs/bootstrap.js"></script>
    <script type="application/javascript" src="/js/libs/underscore.js"></script>
    <script type="application/javascript" src="/js/teacherDashboard.js"></script>
</head>
<body>
<div class="container">
    <#include "*/menu.ftl">

    <div class="row">
        <div class="col-md-6 col-md-offset-3">
            <form action="${course.id?c}/save" method="post">
                <div class="form-group">
                    <label for="course-name">Course name</label>
                    <input id="course-name" name="name" class="form-control" type="text" value="${course.name!}">
                </div>

                <div class="form-group">
                    <label for="course-subjects">Course subjects</label>
                    <input id="course-subjects" name="subjects" class="form-control" type="text"">
                </div>

                <div class="form-group">
                    <label for="course-start-date">Course start date</label>
                    <#if course.startDate??>
                        <input id="course-start-date" name="startDate" class="form-control" type="text" value="${course.startDate?string("MM/dd/yyyy")!}">
                    <#else>
                        <input id="course-start-date" name="startDate" class="form-control" type="text">
                    </#if>
                </div>

                <div class="form-group">
                    <label for="course-end-date">Course end date</label>
                    <#if course.endDate??>
                        <input id="course-end-date" name="endDate" class="form-control" type="text" value="${course.endDate?string("MM/dd/yyyy")!}">
                    <#else>
                        <input id="course-end-date" name="endDate" class="form-control" type="text">
                    </#if>
                </div>

                <div class="form-group">
                    <label for="course-description">Description</label>
                    <textarea id="course-description" name="description" class="form-control">${course.description!}</textarea>
                </div>

                <a class="btn btn-primary" href="/teacher/lessons/?courseId=${course.id?c}">Lessons</a>

                <input class="btn btn-primary" type="submit" value="Save"/>
            </form>
        </div>
    </div>
</div>
</body>
</html>