$(document).ready(function () {
    let arr = $('#navBarMenuContent').children();

    $(window).on("load", function () {
        for (var i = 0; i < arr.length; i++) {
            let path = "/" + $(arr[i]).find("a:eq(0)").text();
           /* console.log(path);*/
            if (window.location.pathname.toLocaleLowerCase() == path.toLocaleLowerCase()) {
                $(arr[i]).addClass('active');
            } else {
                $(arr[i]).removeClass('active')
            }
            if (window.location.pathname == "/" && path.toLowerCase() == "/home") {
                $(arr[i]).addClass('active');
            } else if (window.location.pathname.toLowerCase() == "/product" && path.toLowerCase() == "/shop") {
                $(arr[i]).addClass('active');

            } else if (window.location.pathname.toLowerCase() == "/contact" && path.toLowerCase() == "/contact us") {
                $(arr[i]).addClass('active');
            }
            console.log(window.location.pathname);

        }
    });
})