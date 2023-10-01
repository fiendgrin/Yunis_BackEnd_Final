$(document).ready(function () {

    //NavBar
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


    //Search
    $('#searchInput').keyup(function () {
        console.log(1)
        if ($(this).val().trim().length == 0) {
            $('#searchBody').html('');
        }
    });

    $('#searchBtn').click(function (e) {
        e.preventDefault();
        console.log(1)

        let search = $('#searchInput').val().trim();
        let searchUrl = 'product/search?search=' + search;
        console.log(searchUrl);

        if (search.length > 2) {
            fetch(searchUrl)
                .then(res => res.text())
                .then(data => {
                    console.log(data);
                    $('#searchBody').html(data);
                });
        }

    });
})