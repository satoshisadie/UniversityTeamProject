<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>Pass test</title>

    <#include "*/commonHeader.ftl">
    <script type="application/javascript" src="/js/student/test.js"></script>
</head>
<body>
    <div class="container">
        <#include "*/menu.ftl">

        <div class="content row">
            <div class="col-md-6 col-md-offset-3">
                <#list test.questions as question>
                    <div class="question">
                        <span>${question.text}</span>

                        <div class="answers">
                            <#list question.answers as answer>
                                <div class="answer">
                                    <input type="checkbox"/>
                                    <span class="answer-text">${answer.text}</span>
                                </div>
                            </#list>
                        </div>
                    </div>
                </#list>

                <input class="submit-answers btn btn-primary" type="button" value="Submit answers">
            </div>
        </div>

        <#include "*/footer.ftl">
    </div>

    <input class="lesson-id" type="hidden" value="${lessonId}">
</body>
</html>