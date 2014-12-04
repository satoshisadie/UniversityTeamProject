<#setting locale="en_US">

<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>${course.name}</title>

    <#include "*/commonHeader.ftl">
</head>
<body>
    <div class="container">
        <#include "*/menu.ftl">

        <div class="content row">
            <div class="row">
                <div class="col-md-10 col-md-offset-1" style="min-height: 150px;">
                    <h1 class="text-center">${course.name}</h1>
                </div>
            </div>

            <div class="row">
                <div class="col-md-10 col-md-offset-1">
                    <div class="col-md-7">
                        <h3>About the Course</h3>
                        <p>${course.description}</p>
                    </div>

                    <div class="col-md-4 col-md-offset-1">
                        <h3>Sessions</h3>
                        <select class="form-control">
                            <#list sessions as session>
                                <option value="${session.id}">${session.startDate?date} - ${session.endDate?date}</option>
                            </#list>
                        </select>
                        <button class="btn btn-lg btn-primary" style="margin-top: 20px;">Join for free</button>

                        <h3>Instructor</h3>
                        <div class="course media">
                            <#if teacher.photo??>
                                <a class="media-left">
                                    <img class="img-circle" src="${teacher.photo}">
                                </a>
                            </#if>

                            <div class="media-body">
                                <h4>${teacher.firstName!} ${teacher.lastName!}</h4>

                                <p>${teacher.academicStatus!}</p>
                                <p>${teacher.educationalEstablishment!}</p>
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