<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title></title>
    <link type="text/css" rel="stylesheet" href="/css/bootstrap.css">
    <script type="application/javascript" src="/js/lib/jquery-2.1.1.js"></script>
    <script type="application/javascript" src="/js/lib/bootstrap.js"></script>
</head>
<body>
<div class="container">
    <div class="col-md-8 col-md-offset-2">
    <#include "*/menu.ftl">

        <div class="row">
            <div class="col-sm-2">
                <img src="${user.getUserPhoto()}" width="100" height="100">
            </div>
            <div class="col-sm-7">
                <p class="text-center"><h3>${user.getUserName()}</h3></p>
                <div class="row">
                    <div class="col-xs-2">
                        ${user.getUserGender()}
                    </div>
                    <div class="col-xs-3">
                        ${user.getUserAge()} years old
                    </div>
                    <div class="col-xs-5">
                        ${user.getUserLocation()}
                    </div>
                </div>
            </div>
            <div class="col-sm-2">
                <a class="btn btn-default" href="user/profile" role="button">Edit Profile</a>
            </div>
        </div>
        <br>
        <div class="row">
            <div class="col-md-12">
                ${user.getUserInfo()}
            </div>
        </div>
        <hr>
        <#--Some else need data -->
    <#include "*/footer.ftl">
    </div>
</div>
</body>
</html>