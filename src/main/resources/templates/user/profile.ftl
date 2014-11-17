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
            <div class="row">
                <div class="col-sm-2">
                    <img src="${user.photo}" width="100" height="100">
                </div>

                <div class="col-sm-7">
                    <p class="text-center">
                        <h3>${user.name}</h3>
                    </p>

                    <div class="row">
                        <div class="col-xs-2">
                            ${user.gender}
                        </div>
                        <div class="col-xs-4">
                            ${user.age} years old
                        </div>
                        <div class="col-xs-5">
                            ${user.location}
                        </div>
                    </div>
                </div>

                <div class="col-sm-2">
                    <a class="btn btn-default" href="profile/edit" role="button">Edit Profile</a>
                </div>
            </div>
            <br>
            <div class="row">
                <div class="col-md-12">
                    ${user.info}
                </div>
            </div>
            <hr>
            <#--Some else need data -->
        </div>

        <#include "*/footer.ftl">
    </div>
</body>
</html>