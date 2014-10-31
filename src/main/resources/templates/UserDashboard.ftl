<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title></title>
    <link type="text/css" rel="stylesheet" href="/css/bootstrap.css">
    <#--<link type="text/css" rel="stylesheet" href="/css/bootstrap-theme.css">-->
    <script type="application/javascript" src="/js/lib/jquery-2.1.1.js"></script>
    <script type="application/javascript" src="/js/lib/bootstrap.js"></script>
</head>
<body>
<div class="container">

    <div class="row">
        <div class="col-md-8 col-md-offset-2">
            <#include "*/menu.ftl">
            <div class="col-md-4"><H5>YOUR COURSES</H5></div>
            <#--I don't know is it right-->
            <div class="col-md-4"></div>
            <ul class="nav nav-tabs">
                <li role="presentation" class="active"><a href="#">Current</a></li>
                <li role="presentation"><a href="#">Past</a></li>
                <li role="presentation"><a href="#">Upcoming</a></li>
            </ul>
        </div>
    </div>
</div>
</body>
</html>