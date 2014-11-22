<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>Teacher Dashboard</title>

    <link type="text/css" rel="stylesheet" href="/css/libs/bootstrap.css">
    <link type="text/css" rel="stylesheet" href="/css/main.css">
    <link href="/css/libs/docs.min.css" rel="stylesheet">

    <script type="application/javascript" src="/js/libs/jquery-2.1.1.js"></script>
    <script type="application/javascript" src="/js/libs/bootstrap.js"></script>
    <script type="application/javascript" src="/js/libs/underscore.js"></script>
    <script type="application/javascript" src="/js/main.js"></script>
</head>
<body>
<div class="container">
<#include "*/menu.ftl">

    <div class="content row">
        <div class="col-md-8 col-md-offset-2">
            <div class="text-center">
                <h2>${course.name}</h2>
            <#if course.img??>
                <p><img src="${course.img}"></p>
            </#if>
                <p>
                    <button class="btn btn-lg btn-primary">Learn</button>
                </p>
            </div>
            <div class="col-md-8">
            <#--<div class="bs-callout bs-callout-info">-->
            <#--</div>-->
                <h3 class="text-center">About this course</h3>

                <p>${course.description}</p>
            </div>
            <div class="col-md-4">
                <div class="text-center">
                    <h3>Teacher</h3>
                <#if teacher.photo??>
                    <img src="${teacher.photo}">
                </#if>
                    <h4>${teacher.login}</h4>

                    <p>Educational establishment: ${teacher.educationalEstablishment}</p>

                    <p>Academic status: ${teacher.academicStatus}</p>
                </div>
            </div>
        </div>
    </div>
<#include "*/footer.ftl">
</div>
</body>
</html>