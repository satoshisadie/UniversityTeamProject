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
                <div class="col-sm-4">
                    <h3>My Profile</h3>
                </div>
                <div class="col-sm-2 col-sm-offset-5">
                    <a class="btn btn-default" href="\profile" role="button">View Profile</a>
                </div>
            </div>
            <hr>
            <div class="row">
                <div class="col-sm-3">
                    <p class="text-right">Photo</p>
                </div>
                <div class="col-sm-2">
                    <img src="${user.photo}" width="100" height="100">
                </div>
                <div class="col-sm-2">
                    <button type="button" class="btn btn-default">Upload File</button>
                </div>
            </div>
            <br>
            <div class="row">
                <div class="col-sm-3">
                    <p class="text-right">Location</p>
                </div>
                <div class="col-sm-5">
                    <form role="form">
                        <input class="form-control input-sm" type="text" value="${user.location}"></input>
                    </form>
                </div>
            </div>
            <br>
            <div class="row">
                <div class="col-sm-3">
                    <p class="text-right">Gender</p>
                </div>
                <div class="col-sm-9">
                    <label class="radio-inline">
                        <input type="radio" login="inlineRadioOptions" id="inlineRadio1" value="option1" checked> Female
                    </label>
                    <label class="radio-inline">
                        <input type="radio" login="inlineRadioOptions" id="inlineRadio2" value="option2"> Male
                    </label>
                </div>
            </div>
            <br>
            <div class="row">
                <div class="col-sm-3">
                    <p class="text-right">Birthday</p>
                </div>
                <div class="col-sm-3">
                    <select class="form-control input-sm">
                        <option>Month</option>
                    </select>
                </div>
                <div class="col-sm-2">
                    <select class="form-control input-sm">
                        <option>Day</option>
                    </select>
                </div>
                <div class="col-sm-2">
                    <select class="form-control input-sm">
                        <option>Year</option>
                    </select>
                </div>
            </div>
            <br>
            <div class="row">
                <div class="col-sm-3">
                    <p class="text-right">About Me</p>
                </div>
                <div class="col-sm-7">
                    <textarea class="form-control input-sm" rows="3">${user.info}</textarea>
                </div>
            </div>
            <hr>
            <div class="row">
                <div class="col-sm-3 col-sm-offset-3">
                    <button type="button" class="btn btn-default" >Save Changes</button>
                </div>
            </div>
        </div>

        <#include "*/footer.ftl">
    </div>
</body>
</html>