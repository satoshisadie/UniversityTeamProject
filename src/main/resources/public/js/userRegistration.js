$(document).ready(function () {
    $('#studentSubmit').attr('disabled', true);
    $('#teacherSubmit').attr('disabled', true);
    $('#passDoNotMatch').hide();

    $('#password').keyup(function () {
        checkPasswords($(this), $('#confirmPassword'))
    });

    $('#confirmPassword').keyup(function () {
        checkPasswords($('#password'), $(this))
    });

    function checkPasswords(first, second) {
        if (first.val() != second.val()) {
            $('#passDoNotMatch').show();
        } else {
            $('#passDoNotMatch').hide();
        }
    }

    $('#student').click(function () {
        $('.student-info').show();
        $('.teacher-info').hide();
    });

    $('#teacher').click(function () {
        $('.student-info').hide();
        $('.teacher-info').show();
    });

    $('#studentService').change(function () {
        if ($('#studentService').is(':checked')) {
            $('#studentSubmit').attr('disabled', false);
        } else {
            $('#studentSubmit').attr('disabled', true);
        }
    });

    $('#teacherService').change(function () {
        if ($('#teacherService').is(':checked')) {
            $('#teacherSubmit').attr('disabled', false);
        } else {
            $('#teacherSubmit').attr('disabled', true);
        }
    });

    $('#studentSubmit').click(function () {
        $.ajax({
            url: '/new-student/',
            type: 'POST',
            data: {login: $('#login').val(), password: $('#password').val(), email: $("#e-mail").val()}
        }).done(function (response) {


        });
    });

    $('#teacherSubmit').click(function () {
        $.ajax({
            url: '/new-teacher/',
            type: 'POST',
            data: {
                login: $('#login').val(),
                password: $('#password').val(),
                email: $('#e-mail').val(),
                educationalEstablishment: $('#edEstablishment').val(),
                academicStatus: $('#academicStatus').val()
            }
        }).done(function (response) {


        });
    });

    /*$('#registration').submit(function (event) {
     event.preventDefault();

     $.ajax({
     url: '/new-user/',
     type: 'POST',
     data: {login: $('#login').val(), password: $('#password').val(), email: $("#e-mail").val()}
     }).done(function (response) {

     });

     });*/

});