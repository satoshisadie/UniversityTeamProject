<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title></title>

    <#include "*/commonHeader.ftl">

    <link type="text/css" rel="stylesheet" href="/css/signUp.css">
    <script type="application/javascript" src="/js/signUp.js"></script>
</head>
<body>
    <div class="container">
        <#include "*/menu.ftl">

        <div class="content row">
            <div class="col-md-4 col-md-offset-4">
                <div class="btn-group" data-toggle="buttons">
                    <label class="btn btn-primary active">
                        <input class="type-student" type="radio" checked>
                        Student
                    </label>
                    <label class="btn btn-primary">
                        <input class="type-teacher" type="radio">
                        Teacher
                    </label>
                </div>

                <form id="student-form" data-bind="submit: newStudent">
                    <div class="form-group">
                        <label for="student-email">E-mail</label>
                        <input id="student-email" class="form-control" type="text" data-bind="value: email">
                    </div>

                    <div class="form-group">
                        <label for="student-login">Login</label>
                        <input id="student-login" class="form-control" type="text" data-bind="value: login">
                    </div>

                    <div class="form-group">
                        <label for="student-password">Password</label>
                        <input id="student-password" class="form-control" type="password" data-bind="value: password">
                    </div>

                    <div class="form-group">
                        <label for="student-confirm-password">Confirm Password</label>
                        <input id="student-confirm-password" class="form-control" type="password" data-bind="value: confirmPassword">
                    </div>

                    <input class="btn btn-primary" type="submit" value="Sign-up">
                </form>

                <form id="teacher-form" data-bind="submit: newTeacher">
                    <div class="form-group">
                        <label for="teacher-email">E-mail</label>
                        <input id="teacher-email" type="text" class="form-control" data-bind="email">
                    </div>

                    <div class="form-group">
                        <label for="teacher-login">Login</label>
                        <input id="teacher-login" type="text" class="form-control" data-bind="login">
                    </div>

                    <div class="form-group">
                        <label for="teacher-password">Password</label>
                        <input id="teacher-password" class="form-control" type="password" data-bind="password">
                    </div>

                    <div class="form-group">
                        <label for="teacher-confirm-password">Confirm Password</label>
                        <input id="teacher-confirm-password" class="form-control" type="password" data-bind="value: confirmPassword">
                    </div>

                    <div class="form-group">
                        <label for="educational-establishment">Educational establishment</label>
                        <input id="educational-establishment" class="form-control" type="text" data-bind="value: educationalEstablishment">
                    </div>

                    <div class="form-group">
                        <label for="academic-status">Academic status</label>
                        <input id="academic-status" class="form-control" type="text" data-bind="value: academicStatus">
                    </div>

                    <input class="btn btn-primary" type="submit" value="Sign-up">
                </form>
            </div>
        </div>

        <#include "*/footer.ftl">
    </div>
</body>
</html>