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

        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <form>
                    <div class="form-group">
                        <label for="login">Login</label>
                        <input id="login" type="text" class="form-control">
                    </div>

                    <div class="form-group">
                        <label for="password">Password</label>
                        <input id="password" type="password" class="form-control">
                    </div>

                    <input class="btn btn-default" type="submit" value="LOGIN">
                </form>
            </div>
        </div>

        <#include "*/footer.ftl">
    </div>
</body>
</html>