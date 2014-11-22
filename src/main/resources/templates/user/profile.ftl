<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title></title>

    <#include "*/commonHeader.ftl">
</head>
<body>
    <div class="container">
        <#include "*/menu.ftl">

        <div class="content row">
            <div class="col-md-8 col-md-offset-2">
                <div class="row">
                    <div class="col-sm-2">
                        <img src="${user.photo}" width="100" height="100">
                    </div>

                    <div class="col-sm-7">
                        <p class="text-center">
                        <h3>${user.login}</h3>
                        </p>

                    <#--<div class="row">-->
                    <#--<div class="col-xs-2">-->
                    <#--${user.gender}-->
                    <#--</div>-->
                    <#--<div class="col-xs-4">-->
                    <#--years old-->
                    <#--</div>-->
                    <#--<div class="col-xs-5">-->
                    <#--${user.location}-->
                    <#--</div>-->
                    <#--</div>-->
                    </div>




                </div>
                <br>
                <div class="row">
                    <div class="col-md-12">
                        ${user.info!}
                    </div>
                </div>
                <a class="btn btn-default" href="profile/edit" role="button">Edit Profile</a>
            </div>
        </div>

        <#include "*/footer.ftl">
    </div>
</body>
</html>