<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>Edit Profile</title>

    <#include "*/commonHeader.ftl">

    <link type="text/css" rel="stylesheet" href="/css/user/editProfile.css">
</head>
<body>
    <#include "*/menu.ftl">

    <div class="container-fluid">
        <div class="content row">
            <div class="col-md-8 col-md-offset-2">

                <div class="media">
                    <div class="user-login media-left">${user.login}</div>
                    <div class="view-button media-body">
                        <a href="../profile" class="btn btn-default">View Profile</a>
                    </div>
                </div><hr>

                <div class="some-info">User Information</div>

                <form action="edit/save" method="post">

                    <div class="form-group">
                        <div class="media">
                            <div class="user-photo media-left">
                                <img src="${user.photo}" width="100" height="100">
                            </div>
                            <div class="upload-button media-body" onclick='alert("This button must upload user avatar!")'>
                                <input class="btn btn-default" type="button" value="Upload"/>
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="user-firstName">First Name</label>
                        <input id="user-firstName" name="firstName" class="form-control" type="text" value="${user.firstName!}"/>
                    </div>

                    <div class="form-group">
                        <label for="user-lastName">Last Name</label>
                        <input id="user-lastName" name="lastName" class="form-control" type="text" value="${user.lastName!}"/>
                    </div>

                    <div class="form-group">
                        <label for="user-info">About</label>
                        <textarea id="user-info" name="info" class="form-control" rows="3">${user.info!}</textarea>
                    </div>

                    <#if user.type == "teacher">
                        <div class="form-group">
                            <label for="teacher-academicStatus">Academic Status</label>
                            <textarea id="teacher-academicStatus" name="academicStatus" class="form-control" rows="3">${teacher.academicStatus!}</textarea>
                        </div>

                        <div class="form-group">
                            <label for="teacher-educationalEstablishment">Educational Establishment</label>
                            <textarea id="teacher-educationalEstablishment" name="educationalEstablishment" class="form-control" rows="3">${teacher.educationalEstablishment!}</textarea>
                        </div>
                    </#if>

                    <input class="btn btn-primary" type="submit" value="Save"/>
                </form>
            </div>
        </div>
    </div>

    <#include "*/footer.ftl">
</body>
</html>