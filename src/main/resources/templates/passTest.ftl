<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title></title>

    <link type="text/css" rel="stylesheet" href="/css/libs/bootstrap.css">
<#--<link type="text/css" rel="stylesheet" href="/css/bootstrap-theme.css">-->

    <script type="application/javascript" src="/js/libs/jquery-2.1.1.js"></script>
    <script type="application/javascript" src="/js/libs/bootstrap.js"></script>
</head>
<body>
    <div class="container">
        <#include "*/menu.ftl">

        <div class="col-md-8 col-md-offset-2">
            <blockquote>
                <div class="row">
                    <div class="col-md-6"><H4>${questions.getTestTitle()}</H4></div>
                </div>
            </blockquote>

            <form method="post" action="#">
            <#list questions.getQuestions() as q>
                <div class="well">
                    <div class="row">
                        <div class="col-md-6"><H5>${q.getTitle()}</H5></div>
                    </div>
                    <#if q.getDescription()?has_content>
                        <div class="row">
                            <div class="col-md-10">${q.getDescription()}</div>
                        </div>
                    </#if>
                    <#if q.getPicture()?has_content>
                        <div class="row">
                            <img src="${q.getPicture()}">
                        </div>
                    </#if>
                </div>

                <div class="row">
                <#--<div class="col-md-2"></div>-->
                    <div class="col-md-offset-1">
                        <div class="btn-group-vertical" data-toggle="buttons">
                            <#list q.getAnswers() as ans>

                                <label class="btn btn-primary">
                                    <input type="checkbox" autocomplete="off">${ans}
                                </label>
                            </#list>
                        </div>
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