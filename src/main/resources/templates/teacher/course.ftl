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
                    <h3>Course information</h3>
                    <div class="form-group">
                        <label for="course-name">Name</label>
                        <input id="course-name" name="name" class="form-control" type="text" value="${course.name!}">
                    </div>

                    <label for="course-tags">Tags</label>
                    <br>
                    <select multiple id="course-tags" name="tags" class="tags">
                        <#if course.tags??>
                            <#list course.tags as tag>
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
                                    <span>${session.startDate?string("MM/dd/yyyy")} - ${session.endDate?string("MM/dd/yyyy")}</span>

                                    <a class="btn btn-default" href="/teacher/lessons/?sessionId=${session.id?c}">Lessons</a>
                                </div>
                            </#list>
                        </#if>
                    </div>
                    <input class="add-session btn btn-primary" style="display: block;" type="button" value="Add new session"/>

                    <input class="btn btn-primary" style="margin-top: 40px;" type="submit" value="Save"/>

                    <input name="teacherId" type="hidden" value="${user.id}">
                </form>
            </div>
        </div>
        <#include "*/footer.ftl">
    </div>
</body>
</html>