$(document).ready(function () {
    $('#passDoNotMatch').hide();

    $('#password').blur(function(){
        checkPasswords($(this), $('#confirmPassword'))
    });

    $('#confirmPassword').blur(function(){
        checkPasswords($('#password'), $(this))
    });

    function checkPasswords(first, second) {
        if(first.val() != second.val()) {
            $('#passDoNotMatch').show();
        }else{
            $('#passDoNotMatch').hide();
        }
    }

    $('#registration').submit(function (event) {
        event.preventDefault();

        $.ajax({
            url: '/new-user/',
            type: 'POST',
            data: {login: $('#login').val(), password: $('#password').val()}
        }).done(function (response) {

        });

    });

});