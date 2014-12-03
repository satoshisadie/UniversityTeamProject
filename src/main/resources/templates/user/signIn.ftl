<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title></title>

    <#include "*/commonHeader.ftl">
    <script type="application/javascript" src="/js/signIn.js"></script>
</head>
<body>
    <div class="container">
        <#include "*/menu.ftl">

        <div class="content row">
            <div class="col-md-4 col-md-offset-4">
                <span style="color: red; margin-bottom: 30px; display: block;" data-bind="visible: signInFailed">
                    Please, check password and login
                </span>

                <div class="form-group">
                    <label for="login">Login</label>
                    <input id="login" class="form-control" type="text" data-bind="value: login">
                </div>

                <div class="form-group">
                    <label for="password">Password</label>
                    <input id="password" type="password" class="form-control" data-bind="value: password">
                </div>

                <input class="btn btn-primary" value="Login" data-bind="click: signIn">
            </div>
        </div>

        <#include "*/footer.ftl">
    </div>
</body>
</html>