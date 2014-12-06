<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>Profile</title>

    <#include "*/commonHeader.ftl">

    <link type="text/css" rel="stylesheet" href="/css/user/profile.css">
</head>
<body>
    <#include "*/menu.ftl">

    <div class="container">
        <div class="content row">
            <div class="col-md-8 col-md-offset-2">

                <div class="info media">
                    <div class="media-left">
                        <img src="${u.photo}" width="100" height="100">
                    </div>
                    <div class="media-body">
                        <div class="user-name">
                            <#if u.firstName?? && u.lastName??>
                                ${u.firstName} ${u.lastName}
                            </#if>
                        </div>
                        <#if u.type == "teacher">
                            <div class="form-group">
                                <div class="teacher-educationalEstablishment">
                                    <#if teacher.educationalEstablishment??>
                                        ${teacher.educationalEstablishment}
                                    </#if>
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="teacher-academicStatus">
                                    <#if teacher.academicStatus??>
                                        ${teacher.academicStatus}
                                    </#if>
                                </div>
                            </div>
                        </#if>
                    </div>
                </div><hr>

                <div class="form-group">
                    <label for="user-info">Information about ${u.type}</label>
                    <div class="user-info">
                        <#if u.info??>
                            ${u.info}
                        </#if>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <#include "*/footer.ftl">
</body>
</html>