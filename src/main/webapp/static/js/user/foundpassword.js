$(function(){
    $("#type").change(function(){
        var value = $(this).val();
        if("email" == value) {
            $("#typename").text("电子邮件");
        } else if("phone" == value) {
            $("#typename").text("手机号码");
        }
    });

    $("#btn").click(function () {
        $("#form").submit();
    });

    $("#form").validate({
        errorElement:'span',
        errorClass:"text-error",
        rules:{
            value:{
                required:true
            }
        },
        messages:{
            value:{
                required:"该项必填"
            }
        },
        submitHandler:function(form){
            $.ajax({
                url:"/foundpassword",
                type:"post",
                data:$(form).serialize(),
                beforeSend:function(){
                    $("#btn").text("提交中...").attr("disabled","disabled");
                },
                success:function(data){
                    if(data.state == "success") {
                        var type = $("#type").val();
                        if("email" == type) {
                            swal({
                                type:"success",
                                title:"请查收邮件进行操作"
                            })

                        } else {
                            //TODO 电话的提示
                        }
                    } else {
                        swal(data.message);
                    }
                },
                error:function(){
                    swal("服务器错误");
                },
                complete:function(){
                    $("#btn").text("提交").removeAttr("disabled");
                }
            });
        }
    });
});