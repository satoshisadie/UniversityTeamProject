$(document).ready(function () {

    var $navItems = $('.nav li');

    $navItems.click(function () {
        $navItems.removeClass('active');
        $(this).addClass('active');
    });

    $('.edit-course').click(function () {
        var courseId = $(this).closest('.teacher-course').find('.id').val();
        window.location = '/teacher/course/' + courseId;
    });

    $(window).on('hashchange', function () {
        var hash = window.location.hash;

        var $courses = $('.courses-content');
        var $newCourse = $('.new-course-content');
        var $manageCourse = $('.manage-course-content');

        switch (hash) {
            case '#new-course':
                hideElements($courses, $manageCourse);
                $newCourse.show();
                break;
            case '#courses':
                hideElements($newCourse, $manageCourse);
                $courses.show();
                break;
            case '#manage-course':
                hideElements($courses, $newCourse);
                $manageCourse.show();
                break;
        }
    });

    function hideElements() {
        _.each(arguments, function (argument) {
            argument.hide();
        });
    }
});
