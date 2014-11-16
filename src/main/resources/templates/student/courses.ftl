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

    <div class="col-md-8 col-md-offset-2">
        <blockquote>
            <div class="row">
                <div class="col-md-6">
                    <h4>YOUR COURSES</h4>
                </div>

                <ul class="nav nav-tabs navbar-right">
                    <li role="presentation" class="active">
                        <a href="#current">Current</a>
                    </li>
                    <li role="presentation">
                        <a href="#past">Past</a>
                    </li>
                    <li role="presentation">
                        <a href="#upcoming">Upcoming</a>
                    </li>
                </ul>
            </div>
        </blockquote>

        <#--<br>-->
        <#--<br>-->

        <div class="row">
            <#list courses as course>
                <div class="col-md-4">
                <#--wrong to set height!!! do it later-->
                    <div class="thumbnail" style="height: 350px">
                        <img src="${course.img}">

                        <div class="caption">
                            <H4>${course.name}</H4>

                            <p>${course.description}</p>

                            <p>
                                <a href="#" class="btn btn-primary" role="button">Button</a>
                                <a href="#" class="btn btn-default" role="button">Button</a>
                            </p>
                        </div>
                    </div>
                </div>
            </#list>
        </div>

        <#include "*/footer.ftl">
    </div>
</div>
</body>
</html>