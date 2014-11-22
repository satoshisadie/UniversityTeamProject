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
            <div class="col-md-4 col-md-offset-4">
                <form method="POST" action="/login">
                    <div class="form-group">
                        <label for="login">Login</label>
                        <input id="login" name="login" type="text" class="form-control">
                    </div>

                    <div class="form-group">
                        <label for="password">Password</label>
                        <input id="password" name="password" type="password" class="form-control">
                    </div>

                    <input class="btn btn-primary" type="submit" value="LOGIN">
                </form>
            </div>
        </div>

        <#include "*/footer.ftl">
    </div>
</body>
</html>