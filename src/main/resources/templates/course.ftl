<#setting locale="en_US">

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
        <div class="row">
            <div class="col-md-10 col-md-offset-1" style="min-height: 150px;">
                <h1 class="text-center">${session.name}</h1>
            </div>
        </div>

        <div class="row">
            <div class="col-md-10 col-md-offset-1">
                <div class="col-md-7">
                    <h3>About the Course</h3>
                    <p>${session.description}</p>
                </div>

                <div class="col-md-4 col-md-offset-1">
                    <h3>Session</h3>
                    <span>${session.startDate?date} - ${session.endDate?date}</span>
                    <button class="btn btn-lg btn-primary">Join for free</button>

                    <h3>Instructor</h3>
                    <div class="course media">
                        <#if teacher.photo??>
                            <a class="media-left">
                                <img class="img-circle" src="${teacher.photo}">
                            </a>
                        </#if>

                        <div class="media-body">
                            <h4>${teacher.firstName!} ${teacher.lastName!}</h4>

                            <p>Academic status: ${teacher.academicStatus}</p>
                            <p>Educational establishment: ${teacher.educationalEstablishment}</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <#include "*/footer.ftl">
</div>
</body>
</html>