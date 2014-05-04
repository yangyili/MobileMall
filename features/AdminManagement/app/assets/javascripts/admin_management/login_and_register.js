// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery-1.11.0.min.js
//= require bootstrap.js
//=require ./change_header_style.js
//= require_self


$(window).ready(function () {
    init_user_regist_input();
    init_user_login_input();
});

$(document).keypress(function(e){
    if(window.location.pathname == "/login" && e.which == 13){
        login();
    }
    if(window.location.pathname == "/register" && e.which == 13){
        save_user();
    }
});

function init_user_regist_input() {
    $('#name').blur(function () {
        confirm_user('name',this)
    });
    $('#email').bind('blur', function () {
        confirm_user('email',this)
    });
    $('#phone').bind('blur', function () {
        confirm_user('phone',this)
    });
    $('#password').bind('keyup', function () {
        validate_password(this);
    });

    $('#confirm_password').bind('keyup', function () {
        validate_confirmed_password(this);
    });

    $('#regist_user').bind('click', save_user);
}

function init_user_login_input(){
    $('#login_email').bind('blur', function(){
        inspect_user('email', this)
    });
    $('#login_password').bind('keyup', function () {
        inspect_user('password', this);
    });
    $('#login_user').bind('click', login);
}

function confirm_user(column,el) {
    var input_value = $(el).val().trim();
    if(input_value == '') {
        $(el).parent().addClass('empty');
        $(el).nextAll('div').hide();
        return;
    }
    var handler = {
        name: function () {
            confirm_from_server();
        },
        phone: function () {
            var phone = /^\d+$/
            if(phone.test(input_value) && input_value.length == 11) {
                confirm_from_server()
            }else{
                $(el).next().addClass('warning').removeClass('ok').show();
                $(el).nextAll('div.warning_area').text('手机格式不正确').show();
            }
        },
        email: function () {
            var email_reg = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
            if(email_reg.test(input_value)){
                confirm_from_server();
            }else{
                $(el).next().addClass('warning').removeClass('ok').show();
                $(el).nextAll('div.warning_area').text('邮箱格式不正确').show();
            }
        }
    }

    handler[column]();

    function confirm_from_server(){
            var errors_handler = {
            name:'此申请人已注册',
            phone:'该手机已注册',
            email:'该邮箱已注册'
        };
        $.ajax({
            url:'/user/confirm?name='+column+'&content='+$(el).val().trim(),
            type:'GET',
            success: function (result) {
                $(el).parent().removeClass('empty');
                if(result=='no'){
                    $(el).next().addClass('warning').removeClass('ok').show();
                    $(el).nextAll('div.warning_area').text(errors_handler[column]).show();
                }else{
                    $(el).next().addClass('ok').removeClass('warning').show();
                    $(el).nextAll('div.warning_area').hide();
                }
            },
            error: function (error) {
            }
        })

    }
}

function validate_password(el) {
    if($(el).val() == ''){
        $(el).parent().addClass('empty');
        $(el).next().hide();
    }else {
        $(el).parent().removeClass('empty');
        $(el).next().show();
    }
}

function validate_confirmed_password(el) {
    if($(el).val() == ''){
        $(el).parent().addClass('empty');
        $(el).next().hide();
        $(el).nextAll('div.warning_area').hide();
        return;
    }

    $(el).parent().removeClass('empty');

    if($(el).val() == $('#password').val()){
        $(el).next().addClass('ok').removeClass('warning').show();
        $(el).nextAll('div.warning_area').hide();
    }else {
        $(el).next().addClass('warning').removeClass('ok').show();
        $(el).nextAll('div.warning_area').text('两次输入密码不一致').show();
    }
}

function save_user() {
    if(verify_form_errors()) {
        return;
    }else {
        $('#regist_user').val('注册中...').unbind('click');
        var channel = window.location.pathname == '/register' ? 'web' : '手机'
        $.ajax({
            url: '/user/create',
            type: 'POST',
            data: { user:{
                            name:$('#name').val().trim(),
                            phone:$('#phone').val().trim(),
                            email:$('#email').val().trim(),
                            password:$('#password').val()
                          },
                    channel:channel
            },
            success: function (result) {
                register_callback(result)
            },
            error: function (error) {
            }
        });
    }
}

function register_callback(result){
    if(result['tip'] == 'no_open_id'){
        setTimeout(function () {
            setTimeout(function(){
                window.location.href= result['url'];
            },1000)
        },1500);
    }

    if(result['tip'] == 'save_user'){
        setTimeout(function () {
            $('#regist_user').val('注册成功');
            setTimeout(function(){
                window.location.href= result['url'];
            },1000)
        },1500);
    }
    if(result['tip'] == 'not_save'){
        $('#regist_user').val('注册失败');
        setTimeout(function(){
            window.location.href= result['url'];
        },1000)
    }
}

function verify_form_errors() {
    var user_form = $('form.signup_area');
    var error_input = false;
    $.each(user_form.find('input:not(:button)'), function (index, el) {
        if($(el).val() == '') {
            $(el).parent().addClass('empty');
            error_input = true;
        }
        if($(el).next().hasClass('warning')) {
            error_input = true;
        }
    })
    return error_input
}

function inspect_user(column, el){
    var input_value = $(el).val().trim();

    if(input_value == '') {
        $(el).parent().addClass('empty');
        return;
    }

    if(column == 'email'){
        var email_reg = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
        if(email_reg.test(input_value)){
            $(el).nextAll('span.warning_area').hide().nextAll('.warning').hide();
            inspect_from_server();
        }else{
            $(el).next().removeClass('ok').nextAll('span.warning_area').text('邮箱格式不正确').show();
            $(el).nextAll('.warning').show()
        }
    }
    if(column == 'password'){
        if($('#login_email').val().trim() !=''){
            inspect_from_server();
        }
    }
}

function inspect_from_server(){

    $.ajax({
        url:'/user/user_inspect',
        type:'POST',
        data: {email: $('#login_email').val().trim(), password: $('#login_password').val().trim()},
        success: function (result) {
            $('#login_email').parent().removeClass('empty');
            $('#login_password').parent().removeClass('empty');

            if(result=='email_wrong'){
                $('#login_password').next().removeClass('ok');
                $('#login_email').next().removeClass('ok').nextAll('span.warning_area').text('登录邮箱错误').show().nextAll('.warning').show();
            }
            if(result=='password_wrong'){
                $('#login_email').next().addClass('ok');
                if($('#login_password').val().trim() != ''){
                    $('#login_password').next().removeClass('ok').nextAll('span.warning_area').text('密码错误').show().nextAll('.warning').show();
                }
            }
            if(result=='right'){
                $('#login_email').next().addClass('ok').nextAll('span.warning_area').hide().nextAll('.warning').hide();
                $('#login_password').next().addClass('ok').nextAll('span.warning_area').hide().nextAll('.warning').hide();
            }
        },
        error: function (error) {
        }
    })
}



function login(){
    if(verify_login_form_errors()) {
        return;
    }else {
        $('#login_user').val('登录中...').unbind('click');
        $.ajax({
            url: '/user/user_login',
            type: 'POST',
            data: {email: $('#login_email').val().trim(), password:$('#login_password').val().trim()},
            success: function (result) {

                if(result['tip'] == 'login_success'){
                    setTimeout(function () {
                        $('#login_user').val('登录成功');

                        setTimeout(function(){
                            window.location.href= result['url'];
                        },1000)
                    },1500);
                }

                if(result['tip'] == 'login_failure'){
                    $('#login_user').val('登录失败');
                    setTimeout(function(){
                        window.location.href= result['url'];
                    },1000)
                }
            },
            error: function (error) {
            }
        });
    }
}

function verify_login_form_errors(){

    var error_input = false;

    $.each($('form.login_area').find('input:not(:button)'), function (index, el) {
        if($(el).val() == '') {
            $(el).parent().addClass('empty');
            error_input = true;
        }
        if(!$(el).next().hasClass('ok')) {
            error_input = true;
        }
    });
    return error_input
}

