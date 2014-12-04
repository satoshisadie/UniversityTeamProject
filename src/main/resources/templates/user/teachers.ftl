<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>Teacher Dashboard</title>

<#include "*/commonHeader.ftl">
</head>
<body>
<div class="container">
<#include "*/menu.ftl">

    <div class="content row">
        <div class="col-md-8 col-md-offset-2">
            <div style="display: inherit">
            <#list teachers as teacher>

                <div class="course media">
                    <#if teacher.photo??>
                        <a class="media-left">
                            <img class="img-circle" src="${teacher.photo}">
                        </a>
                    </#if>

                    <div class="media-body">
                        <#if teacher.lastName??>
                            <h4>${teacher.firstName!} ${teacher.lastName!}</h4>
                        <#else>
                            <h4>${teacher.login}</h4>
                        </#if>

                        <p>Academic status: ${teacher.academicStatus}</p>

                        <p>Educational establishment: ${teacher.educationalEstablishment}</p>

                        <a class="edit" href="/teachers/viewProfile/${teacher.id?c}">View Profile</a>
                        <input class="id" type="hidden" value="${teacher.id?c}">
                    </div>
                </div>

            </#list>
            </div>
        </div>
    </div>

<#include "*/footer.ftl">
</div>
</body>
</html>