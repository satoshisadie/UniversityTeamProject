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
            <div class="col-md-8 col-md-offset-2">
                <#list test.questions as question>
                    <div class="question" style="margin-top: 30px; border: 1px solid darkgrey; padding: 0 20px 20px 20px;">
                        <h3>Question ${question_index + 1}</h3>
                        <span style="margin-bottom: 10px; display: block;">${question.text}</span>

                        <div class="answers">
                            <#list question.answers as answer>
                                <label class="answer" style="margin-top: 5px; display: block; font-weight: normal;">
                                    <input type="checkbox"/>
                                    <span class="answer-text">${answer.text}</span>
                                </label>
                            </#list>
                        </div>
                    </div>
                </#list>

                <input class="submit-answers btn btn-success" style="margin-top: 20px" type="button" value="Submit answers">
            </div>
        </div>

        <#include "*/footer.ftl">
    </div>

    <input class="lesson-id" type="hidden" value="${lessonId}">
</body>
</html>