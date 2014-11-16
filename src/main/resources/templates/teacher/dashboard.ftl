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
            <div class="col-md-2 col-md-offset-2">
                <ul class="nav nav-pills nav-stacked">
                    <li role="presentation" class="active"><a href="#courses">Courses</a></li>
                    <li role="presentation"><a href="#new-course">New course</a></li>
                </ul>
            </div>
            <div class="col-md-6">
                <div class="courses-content">
                    <#list courses as course>
                        <#include "course.ftl">
                    </#list>
                </div>

                <div class="new-course-content">
                    <form>
                        <div class="form-group">
                            <label for="course-name">Name</label>
                            <input id="course-name" class="form-control" type="text">
                        </div>

                        <div class="form-group">
                            <label for="course-description">Description</label>
                            <textarea id="course-description" class="form-control"></textarea>
                        </div>
                    </form>
                </div>

                <div class="manage-course-content">

                </div>
            </div>
        </div>
    </div>
</body>
</html>