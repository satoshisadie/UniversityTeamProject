<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title></title>
    <link type="text/css" rel="stylesheet" href="/css/bootstrap.css">
<#--<link type="text/css" rel="stylesheet" href="/css/bootstrap-theme.css">-->
    <script type="application/javascript" src="/js/lib/jquery-2.1.1.js"></script>
    <script type="application/javascript" src="/js/lib/bootstrap.js"></script>
</head>
<body>
<div class="container">
    <div class="col-md-8 col-md-offset-2">
    <#include "*/menu.ftl">
        <div class="row">
            <div class="col-md-6 col-md-offset-3">
                <form>
                    <div class="input-group">
                        <span class="input-group-addon">Login:</span>
                        <input type="text" class="form-control" placeholder="Example@email.com">
                    </div>
                    <div class="input-group">
                        <span class="input-group-addon">Password:</span>
                        <input type="password" class="form-control" placeholder="qwerty12345:)">
                    </div>
                    <input class="btn btn-default" type="submit" value="LogIn">
                </form>
            </div>
        </div>

    <#include "*/footer.ftl">
    </div>
</div>
</body>
</html>