// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

function confirm_send_product(order_id){

    $.ajax({
        url: '/seller_management/confirm_send_product',
        type: 'POST',
        data: { order_id: order_id },
        success: success_call_back,
        error: error_call_back
    });

    function success_call_back(){
        window.location.reload();
    }

    function error_call_back(){
        alert("请求失败，请再试一次！");
    }

}