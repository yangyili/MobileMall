// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.


function select_the_checkbox(el){
    if($(el).attr("checked")){
        $(el).removeAttr("checked")
    }else{
        $(el).attr("checked", true)
    }

}



function submit_everyday_recommend(){
    var checkbox_array = [];
    $(".checkbox").each(function(){
        var checkbox_hash = {
                    id: $($(this)).val(),
            is_display: $($(this)).attr("checked")=="checked"
        };
        checkbox_array.push(checkbox_hash);
    });

    post_checkbox_array_to_server(checkbox_array)

}

function post_checkbox_array_to_server(checkbox_array){

    $.ajax({
        url: '/everyday_recommend/recommend',
        type: 'POST',
        data: { data: checkbox_array },
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