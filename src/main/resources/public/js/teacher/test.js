$(document).ready(function () {
    $('.question').each(function () {
        initializeQuestion($(this));
    });

    var questionTemplate =
        '<div class="question">' +
            '<textarea class="question-text form-control" rows="4"></textarea>' +
            '<div class="answers">' +
                '<div class="answer form-inline">' +
                    '<input class="is-correct" type="checkbox"/>' +
                    '<input class="answer-text form-control" type="text"/>' +
                '</div>' +
            '</div>' +
            '<input class="add-answer btn btn-primary" type="button" value="Add answer"/>' +
        '</div>';

    var answerTemplate =
        '<div class="answer form-inline">' +
            '<label class="checkbox">' +
                '<input class="is-correct" type="checkbox"/>' +
            '</label>' +
            '<input class="answer-text form-control" type="text"/>' +
        '</div>';

    $('.add-question').click(function () {
        var $question = $(questionTemplate);
        $('.questions').append($question);
        initializeQuestion($question);
    });

    $('.save-test').click(function () {
        var test = {};

        var testId = $('.test-id').val();
        if (!_.isEmpty(testId)) {
            test.id = testId;
        }
        test.lessonId = $('.lesson-id').val();
        test.questions = [];

        $('.question').each(function () {
            var question = {};

            question.text = $(this).find('.question-text').val();
            question.answers = [];

            $(this).find('.answer').each(function () {
                var answer = {};

                answer.text = $(this).find('.answer-text').val();
                answer.isCorrect = $(this).find('.is-correct').is(':checked');

                question.answers.push(answer);
            });

            test.questions.push(question);
        });

        $.ajax({
            url: '/teacher/tests/save',
            type: 'POST',
            data: {
                testJson: JSON.stringify(test)
            }
        }).done(function (response) {
            alert(response);
        });
    });

    function initializeQuestion($question) {
        $question.find('.add-answer').click(function () {
            $question.find('.answers').append(answerTemplate);
        })
    }
});