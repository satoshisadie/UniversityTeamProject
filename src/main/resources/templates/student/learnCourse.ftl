<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title></title>

    <link type="text/css" rel="stylesheet" href="/css/libs/bootstrap.css">

    <script type="application/javascript" src="/js/libs/jquery-2.1.1.js"></script>
    <script type="application/javascript" src="/js/libs/bootstrap.js"></script>
</head>
<body>
    <div class="container">
        <#include "*/menu.ftl">
        <br>
        <div class="col-md-8 col-md-offset-2">
            <div class="row">
                <div class="col-sm-2 col-sm-offset-2">
                    <img src="${course.img}" width="90" height="90">
                </div>
                <div class="col-sm-8">
                    <h1>${course.name}</h1>
                </div>
            </div>
            <br>
            <div class="row">
                <div class="col-sm-2 col-sm-offset-5">
                    <button type="button" class="btn btn-default">Start Learning</button>
                </div>
            </div>
            <hr>
            <div class="row">
                <div class="col-sm-2">
                    <h3>Teacher</h3>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-5">
                    ${course.teacher}
                </div>
            </div>
            <div class="row">
                <div class="col-sm-5">
                    <h3>About this Course</h3>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12">
                    ${course.description}
                </div>
            </div>
            <hr>
        </div>
        <#include "*/footer.ftl">
    </div>
</body>
</html>