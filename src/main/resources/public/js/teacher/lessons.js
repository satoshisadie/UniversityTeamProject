$(document).ready(function () {

    $(window).on('hashchange', function () {
        var hash = window.location.hash;

        hideAll();

        $('[data-hash=' + hash + ']').closest('.routable').show();
    });

    $('.save-changes').click(function () {
        tinymce.triggerSave();

        var lessons = [];

        $('.teacher-lesson').each(function () {
            var lesson = {};

            var id = $(this).find('.id').val();
            if (id) {
                lesson.id = id;
            }

            lesson.description = $(this).find('.description').val();
            lesson.content = $(this).find('.content').val();
            lesson.courseId = $('.course-id').val();

            lessons.push(lesson);
        });

        $.ajax({
            url: '/teacher/lessons/save',
            type: 'POST',
            data: {
                lessons: JSON.stringify(lessons)
            }
        }).done(function (response) {
            alert(response);
        });
    });

    function hideAll() {
        $('.routable').hide();
    }

    tinymce.init({
        selector: '.teacher-lesson .content',
        theme: "modern",
        extended_valid_elements : "iframe[src|frameborder|style|scrolling|class|width|height|name|align]",
        plugins: [
            "advlist autolink lists link image charmap preview hr anchor pagebreak",
            "searchreplace wordcount visualblocks visualchars code fullscreen",
//            "insertdatetime media nonbreaking save table contextmenu directionality",
            "insertdatetime nonbreaking save table contextmenu directionality",
            "template paste textpattern"
        ],
//        toolbar1: "undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image | preview media | mce_media",
        toolbar1: "undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image | preview",
        image_advtab: true,
        height: 400,
        setup: function (editor) { }
    });
});
