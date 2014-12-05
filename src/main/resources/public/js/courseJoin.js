$(document).ready(function() {
    $('#join-button').click(function () {
        $.ajax({
            url: $('#right-href').attr("value"),
            type: 'POST',
            data: {sessionId: $('select').val(), currentURL: document.URL}
        }).done(function (response) {
            if(response !== "success"){
                window.location = response;
            }else{
                $('#join-button').hide();
                $('#already-signed').show();
            }
        });
    });

    $('select').change(function() {
        $.ajax({
            url: '/student/is-student-signed',
            type: 'POST',
            data: {sessionId: $('select').val()}
        }).done(function(response) {
            if(response) {
                $('#join-button').hide();
                $('#already-signed').show();
            }else{
                $('#join-button').show();
                $('#already-signed').hide();
            }
        });
    });
});