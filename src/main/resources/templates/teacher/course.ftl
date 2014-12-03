<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>Teacher Dashboard</title>

    <#include "*/commonHeader.ftl">

    <link type="text/css" rel="stylesheet" href="/css/libs/bootstrap-tagsinput.css">
    <link type="text/css" rel="stylesheet" href="/css/libs/typeaheadjs.css">
    <link type="text/css" rel="stylesheet" href="/css/teacher/courses.css">

    <script type="application/javascript" src="/js/libs/bootstrap-tagsinput.js"></script>
    <script type="application/javascript" src="/js/libs/typeahead.bundle.js"></script>
    <script type="application/javascript" src="/js/teacher/course.js"></script>
</head>
<body>
    <div class="container">
        <#include "*/menu.ftl">

        <div class="content row">
            <div class="col-md-6 col-md-offset-3">
                <form action="${course.id?c}/save" method="post">
                    <div class="form-group">
                        <label for="course-name">Course name</label>
                        <input id="course-name" name="name" class="form-control" type="text" value="${course.name!}">
                    </div>

                    <label for="course-tags">Course tags</label>
                    <br>
                    <select multiple id="course-tags" name="tags" class="tags">
                        <#if tags??>
                            <#list tags as tag>
                                <option value="${tag.name}"></option>
                            </#list>
                        </#if>
                    </select>

                    <div class="form-group">
                        <label for="course-description">Description</label>
                        <textarea id="course-description" name="description" class="form-control" rows="8">${course.description!}</textarea>
                    </div>

                    <h3>Course sessions</h3>
                    <div class="sessions">
                        <#if sessions??>
                            <#list sessions as session>
                                <div class="session">
                                    <div class="form-group">
                                        <label for="start-date">Start date</label>
                                        <#if session.startDate??>
                                            <input id="start-date" name="startDate" class="form-control" type="text" value="${session.startDate?string("MM/dd/yyyy")}">
                                        <#else>
                                            <input id="start-date" name="startDate" class="form-control" type="text">
                                        </#if>
                                    </div>

                                    <div class="form-group">
                                        <label for="end-date">End date</label>
                                        <#if session.endDate??>
                                            <input id="end-date" name="endDate" class="form-control" type="text" value="${session.endDate?string("MM/dd/yyyy")}">
                                        <#else>
                                            <input id="end-date" name="endDate" class="form-control" type="text">
                                        </#if>
                                    </div>

                                    <a class="btn btn-primary" href="/teacher/lessons/?sessionId=${session.id?c}">Lessons</a>
                                </div>
                            </#list>
                        </#if>
                    </div>

                    <input class="btn btn-primary" type="submit" value="Save"/>
                </form>
            </div>
        </div>
    </div>
</body>
</html>