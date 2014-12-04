$(document).ready(function () {
    $('.submit-answers').click(function () {
        var questions = [];

        $('.question').each(function () {
            var answers = [];

            $(this).find('.answer').each(function () {
                var isChecked = $(this).find('input:checkbox').is(':checked');
                if (isChecked) {
                    answers.push($(this).find('.answer-text').text());
                }
            });

            questions.push(answers);
        });


        $.ajax({
            url: '/student/test/check',
            type: 'POST',
            dataType: 'json',
            data: {
                lessonId: $('.lesson-id').val(),
                questionsJson: JSON.stringify(questions)
            }
        }).done(function (response) {
            if (response.status === 'success') {
                alert("Good work! You have passed the test. Correct answers percent is " + response.correctAnswersPercent)
            } else {
                alert("Sorry. You haven't passed the test. Correct answers percent is " + response.correctAnswersPercent)
            }
        });
    });
});