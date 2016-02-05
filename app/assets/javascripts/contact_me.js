$(function() {
    $('input,textarea').keyup(function(e) {
        if ($(this).attr("id") == "required") {
            if ($(this).val().length == 0) {
                $(this).addClass('error-border');
            } else {
                $(this).removeClass('error-border');
            }

        }
    });
    $('select').change(function(e) {
        if ($(this).attr("id") == "required") {
            if ($(this).val().length == 0) {
                $(this).addClass('error-border');
            } else {
                $(this).removeClass('error-border');
            }

        }
    });
});