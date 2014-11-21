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

            <form id="studentReg" class="student-form" method="POST" action="/new-student/">
                <div class="form-group">
                    <label for="stE-mail">E-mail</label>
                    <input id="stE-mail" name="email" type="text" class="form-control" placeholder="Example@email.com">
                </div>

                <div class="form-group">
                    <label for="stLogin">Login</label>
                    <input id="stLogin" name="login" type="text" class="form-control" placeholder="Login">
                </div>

                <div class="form-group">
                    <label for="stPassword">Password</label>
                    <input id="stPassword" name="password" type="password" class="form-control">
                </div>

                <div class="form-group">
                    <label for="stConfirmPassword">Confirm Password</label>
                    <input id="stConfirmPassword" type="password" class="form-control">
                </div>

                <div id="stPassDoNotMatch" class="alert alert-dismissable alert-danger">
                    <strong>Passwords do not match!</strong>
                </div>

                <div class="form-group">
                    <input id="studentService" type="checkbox" name="terms"> I agry to the <a href="#">Terms of
                    Service</a>
                </div>

                <input id="studentSubmit" class="btn btn-default" type="submit" value="REGISTER">
            </form>


            <form id="teacherReg" class="teacher-form" method="POST" action="/new-teacher/">
                <div class="form-group">
                    <label for="tcE-mail">E-mail</label>
                    <input id="tcE-mail" name="email" type="text" class="form-control" placeholder="Example@email.com">
                </div>

                <div class="form-group">
                    <label for="tcLogin">Login</label>
                    <input id="tcLogin" name="login" type="text" class="form-control" placeholder="Login">
                </div>

                <div class="form-group">
                    <label for="tcPassword">Password</label>
                    <input id="tcPassword" name="password" type="password" class="form-control">
                </div>

                <div class="form-group">
                    <label for="tcConfirmPassword">Confirm Password</label>
                    <input id="tcConfirmPassword" type="password" class="form-control">
                </div>

                <div id="tcPassDoNotMatch" class="alert alert-dismissable alert-danger">
                    <strong>Passwords do not match!</strong>
                </div>

                <div class="form-group">
                    <label for="edEstablishment">Educational establishment</label>
                    <input id="edEstablishment" name="educationalEstablishment" type="text" class="form-control">
                </div>

                <div class="form-group">
                    <label for="academicStatus">Academic status</label>
                    <input id="academicStatus" name="academicStatus" type="text" class="form-control">
                </div>

                <div class="form-group">
                    <input id="teacherService" type="checkbox" name="terms"> I agry to the <a href="#">Terms of
                    Service</a>
                </div>

                <input id="teacherSubmit" class="btn btn-default" type="submit" value="REGISTER">
            </form>
        </div>
    </div>

    <div class="row">
    <#include "*/footer.ftl">
    </div>
</div>
</body>
</html>