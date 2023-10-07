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
           

        }
    });


    //Search
    $('#searchInput').keyup(function () {
      
        if ($(this).val().trim().length == 0) {
            $('#searchBody').html('');
        }
    });

    $('#searchBtn').click(function (e) {
        e.preventDefault();
      

        let search = $('#searchInput').val().trim();
        let searchUrl = 'product/search?search=' + search;
     

        if (search.length > 2) {
            fetch(searchUrl)
                .then(res => res.text())
                .then(data => {
                   
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
        let url = $(this).attr('href');
          
        fetch(url)
            .then(res => res.text())
            .then(data => {
                $('.minicart-content-box').html(data)
            });
          
      
    });

    //LoadMore
    $(document).on('click', '.loadMoreBtn', function (e) {
        e.preventDefault();
        let url = $(this).attr('href');
        console.log(url);
        let pageIndex = $(this).data('pageindex');
        console.log(pageIndex);

        let totalPage = $(this).data('maxpage');
        console.log(totalPage);

        if (pageIndex > 0 && (pageIndex + 1) < totalPage) {
            fetch(url + '?pageIndex=' + pageIndex)
                .then(res => res.text())
                .then(data => {
                    $('.productContainer').append(data)
                });
        } else if (pageIndex == (totalPage - 1)) {
            fetch(url + '?pageIndex=' + pageIndex)
                .then(res => res.text())
                .then(data => {
                    $('.productContainer').append(data)
                });
            $('.loadMoreBtn').remove();
        }
        pageIndex++;
        $('.loadMoreBtn').data("pageindex", pageIndex)
    });



    $('.addAddressBtn').click(function (e) {
        e.preventDefault();
        $('.addressForm').removeClass('d-none');
        $('.addAddressBtn').addClass('d-none');
        $('.addressContainer').removeClass('d-flex');
        $('.addressContainer').addClass('d-none');
        $('.goBackBtn').removeClass('d-none');



    });

    $('.goBackBtn').click(function (e) {
        e.preventDefault();
        $('.addressForm').addClass('d-none');
        $('.addAddressBtn').removeClass('d-none');
        $('.addressContainer').removeClass('d-none');
        $('.addressContainer').addClass('d-flex');
        $('.goBackBtn').addClass('d-none');
        $('.editAddressForm').addClass('d-none');
    });

    $('.editAddressBtn').click(function (e) {
        e.preventDefault();
        $('.addressContainer').removeClass('d-flex');
        $('.addressContainer').addClass('d-none');
        $('.goBackBtn').removeClass('d-none');
        $('.addAddressBtn').addClass('d-none');
        $('.editAddressForm').removeClass('d-none');
        let url = $(this).attr('href');
        fetch(url)
            .then(res => res.text())
            .then(data => {
                $('.editAddressForm').html(data)
            })
    })

})