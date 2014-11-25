<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/html">
<head lang="en">
    <meta charset="UTF-8">
    <title>Teacher Dashboard</title>

    <#include "*/commonHeader.ftl">
    <link type="text/css" rel="stylesheet" href="/css/teacher/test.css">
    <script type="application/javascript" src="/js/teacher/test.js"></script>
</head>
<body>
    <div class="container">
        <#include "*/menu.ftl">

        <div class="content row">
            <div class="col-md-2 col-md-offset-2">
                <input class="add-question btn btn-primary" type="button" value="Add question"/>
                <br>
                <br>
                <input class="save-test btn btn-primary" type="button" value="Save test"/>
            </div>

            <div class="col-md-6">
                <div class="questions">
                    <#if test??>
                        <#list test.questions as question>
                            <div class="question">
                                <textarea class="question-text form-control" rows="4">${question.text}</textarea>

                                <div class="answers">
                                    <#list question.answers as answer>
                                        <div class="answer form-inline">
                                            <input class="is-correct" type="checkbox" <#if answer.isCorrect>checked</#if>/>
                                            <input class="answer-text form-control" type="text" value="${answer.text}"/>
                                        </div>
                                    </#list>
                                </div>

                                <input class="add-answer btn btn-primary" type="button" value="Add answer"/>
                            </div>
                        </#list>
                    </#if>
                </div>
            </div>
        </div>

        <#include "*/footer.ftl" >
    </div>
    <input class="lesson-id" type="hidden" value="${lessonId?c}"/>
    <input class="test-id" type="hidden" value="${test.id?c!}"/>
</body>
</html>