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
        <blockquote>
            <div class="row">
                <div class="col-md-6">
                    <h4>${test.title}</h4>
                </div>
            </div>
        </blockquote>

        <form method="post" action="#">
        <#list test.questions as question>
            <div class="well">
                <div class="row">
                    <div class="col-md-6">
                        <h4>${question.title}</h4>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-10">${question.description!}</div>
                </div>

                <div class="row text-center">
                    <img src="${question.picture!}">
                </div>
            </div>

            <div class="row">
                <div class="col-md-offset-1">
                    <#list question.answers as ans>
                        <label class="radio">
                            <input type="radio" name="${question.title}" id="${ans}">${ans}
                        </label>
                    </#list>
                </div>
            </div>

            <hr>
        </#list>

            <input class="btn btn-default" type="submit" value="Send">
        </form>
    </div>

<#include "*/footer.ftl">
</div>
</body>
</html>