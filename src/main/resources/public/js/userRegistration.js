$(document).ready(function () {
    $('#studentSubmit').attr('disabled', true);
    $('#teacherSubmit').attr('disabled', true);
    $('#stPassDoNotMatch').hide();
    $('#tcPassDoNotMatch').hide();

    $('#stPassword').keyup(function () {
        checkPasswordsStudent($(this), $('#stConfirmPassword'))
    });

    $('#tcPassword').keyup(function () {
        checkPasswordsTeacher($(this), $('#tcConfirmPassword'))
    });

    $('#stConfirmPassword').keyup(function () {
        checkPasswordsStudent($('#stPassword'), $(this))
    });

    $('#tcConfirmPassword').keyup(function () {
        checkPasswordsTeacher($('#tcPassword'), $(this))
    });

    function checkPasswordsStudent(first, second) {
        if (first.val() != second.val()) {
            $('#stPassDoNotMatch').show();
        } else {
            $('#stPassDoNotMatch').hide();
        }
    }

    function checkPasswordsTeacher(first, second) {
        if (first.val() != second.val()) {
            $('#tcPassDoNotMatch').show();
        } else {
            $('#tcPassDoNotMatch').hide();
        }
    }

    $('#student').change(function () {
        $('.student-form').show();
        $('.teacher-form').hide();
    });

    $('#teacher').change(function () {
        $('.student-form').hide();
        $('.teacher-form').show();
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

    /*$('#studentSubmit').click(function () {
        $.ajax({
            url: '/new-student/',
            type: 'POST',
            data: {login: $('#login').val(), password: $('#password').val(), email: $("#e-mail").val()}
        }).done(function (response) {
            if(response == 'success') {
//                alert('Fuck YEA!');
                document.location.href = "http://localhost:8085/login/";
            }

        });
    });*/

    /*$('#teacherSubmit').click(function () {
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
    });*/

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