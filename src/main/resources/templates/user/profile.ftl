<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>Profile</title>

    <#include "*/commonHeader.ftl">

    <link type="text/css" rel="stylesheet" href="/css/user/profile.css">

</head>
<body>
    <div class="container">
        <#include "*/menu.ftl">

        <div class="content row">
            <div class="col-md-8 col-md-offset-2">

                <div class="form-group">
                    <div class="user-login">${user.login}</div>
                    <div class="edit-button">
                        <a href="/profile/edit" class="btn btn-default">Edit Profile</a>
                    </div>
                </div><hr>

                <div class="info media">
                    <div class="media-left">
                        <img src="${user.photo}" width="100" height="100">
                    </div>
                    <div class="media-body">
                        <div class="user-name">
                            <#if user.firstName?? && user.lastName??>
                                ${user.firstName} ${user.lastName}
                            </#if>
                        </div>
                        <#if user.type == "teacher">
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
                    <label for="user-info">Information about ${user.login}:</label>
                    <div class="user-info">
                        <#if user.info??>
                            ${user.info}
                        </#if>
                    </div>
                </div>

            </div>
        </div>

        <#include "*/footer.ftl">
    </div>
</body>
</html>