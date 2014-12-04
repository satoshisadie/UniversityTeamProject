$(document).ready(function () {
    var $course = $('.course');

    $('.tag-select a').click(function (event) {
        event.preventDefault();

        var tag = $(this).attr('data-tag');

        if (tag === 'all') {
            $course.show();
            return;
        }

        $course.each(function () {
            var $course = $(this);

            var tags = $course.find('.tags').val();

            if (tags.indexOf(tag) >= 0) {
                $course.show();
            } else {
                $course.hide();
            }
        });
    });
});
