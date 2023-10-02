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


    //Modal
    $('.modalBtn').click(function (e) {
        e.preventDefault();

        let url = $(this).attr('href');
        fetch(url)
            .then((res) => res.text())
            .then((data) => {
                $('.modal-body').html(data);

                // prodct details slider active
                $('.product-large-slider').slick({
                    fade: true,
                    arrows: false,
                    asNavFor: '.pro-nav'
                });


                // product details slider nav active
                $('.pro-nav').slick({
                    slidesToShow: 4,
                    asNavFor: '.product-large-slider',
                    arrows: false,
                    focusOnSelect: true
                });

            });

    });


    //addToCart


    $(document).on('click', '.removeFromBasket, .removeFromCart', function (e) {
        e.preventDefault();
        console.log($(this).attr('href'))
        let urlArr = $(this).attr('href').split('/');
        let Id = urlArr[urlArr.length - 1]
        let basketUrl = '/Basket/RemoveBasket/' + Id
        fetch(basketUrl)
            .then(res => res.text())
            .then(data => {
                $('.minicart-content-box').html(data);
                $('#totalCart').html($('#totalBasket').html());
                $('#subTotalCart').html($('#subTotalBasket').html());
                $('#taxesCart').html($('#taxesBasket').html());

            });
        let cartUrl = '/Cart/RemoveCart/' + Id
        fetch(cartUrl)
            .then(res => res.text())
            .then(data => {
                $('#cartBody').html(data);
                $('#totalCart').html($('#totalBasket').html());
                $('#subTotalCart').html($('#subTotalBasket').html());
                $('#taxesCart').html($('#taxesBasket').html());
            });


    });
    $(document).on('click', '.addBasket, .removeFromBasket ', function (e) {
        e.preventDefault();
        console.log(1)
        let url = $(this).attr('href');
        fetch(url)
            .then(res => res.text())
            .then(data => {
                $('.minicart-content-box').html(data)

            });

    });

})