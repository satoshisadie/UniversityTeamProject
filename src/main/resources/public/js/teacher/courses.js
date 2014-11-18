$(document).ready(function () {

    $('.course-lessons-btn').click(function () {
        var courseId = $(this).closest('.teacher-course').find('.id').val();
        window.location = '/teacher/lessons/?courseId=' + courseId;
    });

});
