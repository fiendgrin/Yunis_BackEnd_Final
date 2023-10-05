$(document).ready(function () {

    $(document).on('click', '.deleteImageBtn', function (e) {
        e.preventDefault();
        let url = $(this).attr('href');
        fetch(url)
            .then(res => res.text())
            .then(data => {
                $('.imageContainer').html(data);
            });
    });

});