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
    <div class="col-md-8 col-md-offset-2">
    <#include "*/menu.ftl">
        <blockquote>
            <div class="row">


                <div class="col-md-6"><H4>YOUR COURSES</H4></div>
                <ul class="nav nav-tabs navbar-right">
                    <li role="presentation" class="active"><a href="#">Current</a></li>
                    <li role="presentation"><a href="#">Past</a></li>
                    <li role="presentation"><a href="#">Upcoming</a></li>
                </ul>

            </div>
        </blockquote>

        <#--<br>-->
        <#--<br>-->

        <div class="row">
        <#list cources as c>
            <div class="col-md-4">
            <#--wrong to set height!!! do it later-->
                <div class="thumbnail" style="height: 350px">
                    <img src="${c.getImg()}">

                    <div class="caption">
                        <H4>${c.getTitle()}</H4>

                        <p>${c.getDescription()}</p>

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