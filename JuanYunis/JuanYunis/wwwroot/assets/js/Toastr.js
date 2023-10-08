$(document).ready(function ()
{

    /*toastr["info"]("Select Products before checking Out")*/

    toastr.options = {
        "closeButton": false,
        "debug": false,
        "newestOnTop": false,
        "progressBar": false,
        "positionClass": "toast-top-right",
        "preventDuplicates": false,
        "onclick": null,
        "showDuration": "300",
        "hideDuration": "1000",
        "timeOut": "5000",
        "extendedTimeOut": "1000",
        "showEasing": "swing",
        "hideEasing": "linear",
        "showMethod": "fadeIn",
        "hideMethod": "fadeOut"
    }

    let infoToaster = $('#infoToaster');
    console.log(infoToaster)
    if (infoToaster.val() != undefined && infoToaster.val().length > 0) {
        toastr["info"](infoToaster.val());
    }

    let successToaster = $('#successToaster');
    console.log(successToaster.val())
    if (successToaster.val() != undefined && successToaster.val().length > 0) {
        toastr["success"](successToaster.val());
    }

})