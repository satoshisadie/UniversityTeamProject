$(document).ready(function () {

    $(window).on('hashchange', function () {
        var hash = window.location.hash;

        hideAll();

        $('[data-hash=' + hash + ']').closest('.routable').show();
    });

    function hideAll() {
        $('.routable').hide();
    }
});
