$(function(){

    $(function () {
        $("#change").click(function () {
            $("#img").removeAttr("src").attr("src","/patchca.png?_="+new Date().getTime());
        });
    });

    function getParameterByName(name, url) {
        if (!url) {
            url = window.location.href;
        }
        name = name.replace(/[\[\]]/g, "\\$&");
        var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
            results = regex.exec(url);
        if (!results) return null;
        if (!results[2]) return '';
        return decodeURIComponent(results[2].replace(/\+/g, " "));
    }

    $("#loginBtn").click(function(){
        $("#loginForm").submit();
    });

    $("#password").keydown(function () {
        if(event.keyCode == '13'){
            $("#loginBtn").click();
        }
    })
    $("#loginForm").validate({
        errorElement:"span",
        errorClass:"text-error",
        rules:{
            username:{
                required:true
            },
            password:{
                required:true
            }
        },
        messages:{
            username:{
                required:"请输入账号"
            },
            password:{
                required:"请输入密码"
            }
        },
        submitHandler:function(form){
            $.ajax({
                url:"/login",
                type:"post",
                data:$(form).serialize(),
                beforeSend:function(){
                    $("#loginBtn").text("登录中...").attr("disabled","disabled");
                },

                    success: function (data) {
                        if (data.state == 'success') {
                            var url = getParameterByName("redirect");

                            if (url) {
                                var hash = window.location.hash;
                                /*h = "#reply"*/

                                if (hash) {
                                    window.location.href = url + hash;
                                } else {
                                    window.location.href = url;
                                }
                            } else {
                                swal({
                                        type: "success",
                                        title: "登陆成功!",
                                        text: "欢迎使用任妮浩邮箱",
                                        /* imageUrl: "images/thumbs-up.jpg"*/
                                    }
                                    , function () {
                                        window.location.href = "/home";
                                    });

                            }
                        } else {
                            swal({
                                type: "error",
                                title: data.message

                            })
                        }
                    },
                error:function(){
                    swal("服务器错误");
                },
                complete:function(){
                    $("#loginBtn").text("登录").removeAttr("disabled");
                }
            });
        }
    });



});