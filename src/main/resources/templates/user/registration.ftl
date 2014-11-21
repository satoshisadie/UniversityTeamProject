<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title></title>

    <link type="text/css" rel="stylesheet" href="/css/libs/bootstrap.css">
    <link type="text/css" rel="stylesheet" href="/css/registration.css">

    <script type="application/javascript" src="/js/libs/jquery-2.1.1.js"></script>
    <script type="application/javascript" src="/js/libs/bootstrap.js"></script>
    <script type="application/javascript" src="/js/userRegistration.js"></script>
</head>
<body>
<div class="container">
    <div class="row">
    <#include "*/menu.ftl">
    </div>

    <div class="row">
        <div class="col-md-4 col-md-offset-4">

            <div class="form-group">
                <label for="student"> Select user type: </label>
                <label class="radio-inline">
                    <input type="radio" name="userType" id="student" checked> Student
                </label>
                <label class="radio-inline">
                    <input type="radio" name="userType" id="teacher"> Teacher
                </label>
            </div>

            <form id="registration">
                <div class="form-group">
                    <label for="e-mail">E-mail</label>
                    <input id="e-mail" type="text" class="form-control" placeholder="Example@email.com">
                </div>

                <div class="form-group">
                    <label for="login">Login</label>
                    <input id="login" type="text" class="form-control" placeholder="Login">
                </div>

                <div class="form-group">
                    <label for="password">Password</label>
                    <input id="password" type="password" class="form-control">
                </div>

                <div class="form-group">
                    <label for="confirmPassword">Confirm Password</label>
                    <input id="confirmPassword" type="password" class="form-control">
                </div>

                <div id="passDoNotMatch" class="alert alert-dismissable alert-danger">
                    <strong>Passwords do not match!</strong>
                </div>

                <div class="student-info">
                    <div class="form-group">
                        <input id="studentService" type="checkbox" name="terms"> I agry to the <a href="#">Terms of Service</a>
                    </div>

                    <input id="studentSubmit" class="btn btn-default" type="submit" value="REGISTER">
                </div>

                <div class="teacher-info">
                    <div class="form-group">
                        <label for="edEstablishment">Educational establishment</label>
                        <input id="edEstablishment" type="text" class="form-control">
                    </div>

                    <div class="form-group">
                        <label for="academicStatus">Academic status</label>
                        <input id="academicStatus" type="text" class="form-control">
                    </div>

                    <div class="form-group">
                        <input id="teacherService" type="checkbox" name="terms"> I agry to the <a href="#">Terms of Service</a>
                    </div>

                    <input id="teacherSubmit" class="btn btn-default" type="submit" value="REGISTER">
                </div>

            </form>
        </div>
    </div>

    <div class="row">
    <#include "*/footer.ftl">
    </div>
</div>
</body>
</html>