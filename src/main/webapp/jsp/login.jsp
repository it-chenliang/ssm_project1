<%--
  Created by IntelliJ IDEA.
  User: Heali
  Date: 2019/5/22
  Time: 18:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${path}/static/webfront/validationEngine.jquery.css" type="text/css"/>
    <link rel="stylesheet" href="${path}/static/webfront/login.css">
    <script src="${path}/static/js/jquery-3.3.1.js" type="text/javascript"></script>
    <script src="${path}/static/js/jquery.cookie.js"></script>
    <script src="${path}/static/js/jquery.validationEngine.js" type="text/javascript" charset="utf-8"></script>
    <script src="${path}/static/js/languages/jquery.validationEngine-zh_CN.js" type="text/javascript" charset="utf-8"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script>
        jQuery(document).ready(function(){
            jQuery("#formID").validationEngine();
            jQuery("#formID2").validationEngine();
        });
    </script>
</head>
<body style="background: #fff url('${path}/static/images/1.jpg') 50% 0 no-repeat;">
    <div class="container-box">
        <div class="web-title">
            <img src="${path}/static/images/xiankan.png" alt="" style="width:250px;height: auto;">
        </div>
        <div class="login">
            <div class="header">
                <div class="switch" id="switch">
                    <a href="javascript:void(0);" class="q-login q-login-focus q-login-item">快速登录</a>
                    <a href="javascript:void(0);" class="q-login q-register-item">快速注册</a>
                    <div class="switch_bottom" id="switch_bottom"></div>
                </div>
            </div>
            <div class="login-content quite-login" style="display: block;">
                <form id="formID" method="post" action="${path}/user/login">
                    <div class="message-info">
                        <div class="message-info-show" id="message"></div>
                    </div>
                    <div class="login-item">
                        <label for="username" class="title">用户名</label>
                        <input type="text" id="username" name="username"  class="validate[required]">
                        <label class="msg"></label>
                    </div>
                    <div class="login-item">
                        <label for="password" class="title">密码</label>
                        <input type="password" id="password" name="password" class="validate[required,minSize[6]]">
                        <label class="msg"></label>
                    </div>
                    <div class="remember-pwd">
                        <input type="checkbox" id="checkbox"><span>记住密码</span>
                    </div>
                    <div class="submit-btn">
                        <button type="submit" class="btn btn-success" id="login-btn">登录</button>
                    </div>
                    <div class="forget-pwd">
                        <a href="#">忘记密码?</a>
                    </div>
                </form>
            </div>
            <div class="login-content quite-regist">
                <form action="${path}/user/register" method="post" id="formID2">
                    <div class="login-item" style="margin-top:30px;">
                        <label for="rusername" class="title">用户名</label>
                        <input type="text" id="rusername" name="username" placeholder="请输入用户名" class="validate[required,minSize[4]]">
                        <label class="msg" id="rusernameError"></label>
                    </div>
                    <div class="login-item">
                        <label for="pwd" class="title">密码</label>
                        <input type="password" id="pwd" name="password" placeholder="请输入6-16位密码">
                        <label class="msg" id="pwdError"></label>
                    </div>
                    <div class="login-item">
                        <label for="confirm" class="title">确认密码</label>
                        <input type="password" id="confirm" name="confirm" placeholder="请再次输入密码">
                        <label class="msg" id="confirmError"></label>
                    </div>
                    <div class="login-item">
                        <label for="email" class="title">邮箱</label>
                        <input type="text" id="email" name="email" placeholder="请输入邮箱">
                        <label class="msg" id="emailError"></label>
                    </div>
                    <div class="submit-btn">
                        <button type="button" class="btn btn-success" id="register">注册</button>
                    </div>
                    <script>
                        var info = false;
                        var pattern = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
                        $(function () {
                            $("#rusername").blur(function () {
                                if($(this).val().length==0){
                                    $("#rusernameError").html('<i class="glyphicon glyphicon-remove-circle" title="用户名不能为空"></i>');
                                    $("#rusernameError").css({
                                        "color":"red"
                                    });
                                }else{
                                    $.ajax({
                                        url:'/user/checkUsername',
                                        data:{username:$(this).val()},
                                        type:'post',
                                        dataType:"json",
                                        success:function(data){
                                            info = data;
                                            if(!data){
                                                $("#rusernameError").html('<i class="glyphicon glyphicon-remove-circle" title="用户名不可用"></i>');
                                                $("#rusernameError").css({
                                                    "color":"red"
                                                });
                                            }else{
                                                $("#rusernameError").html('<i class="glyphicon glyphicon-ok-circle" title="用户名可用"></i>');
                                                $("#rusernameError").css({
                                                    "color":"green"
                                                });
                                            }
                                        }
                                    });
                                }
                            });
                            $("#pwd").blur(function(){
                                var len = $(this).val().length;
                                if(len<6 || len>16){
                                    $("#pwdError").html('<i class="glyphicon glyphicon-remove-circle" title="请输入6-16的字符"></i>');
                                    $("#pwdError").css({
                                        "color":"red"
                                    });
                                }else{
                                    $("#pwdError").html('<i class="glyphicon glyphicon-ok-circle"></i>');
                                    $("#pwdError").css({
                                        "color":"green"
                                    });
                                }
                            });
                            $("#confirm").blur(function(){
                                var now = $("#pwd").val();
                                if(now!=$(this).val() || $(this).val().length<=0){
                                    $("#confirmError").html('<i class="glyphicon glyphicon-remove-circle" title="两次输入密码不一致"></i>');
                                    $("#confirmError").css({
                                        "color":"red"
                                    });
                                }else{
                                    $("#confirmError").html('<i class="glyphicon glyphicon-ok-circle"></i>');
                                    $("#confirmError").css({
                                        "color":"green"
                                    });
                                }
                            });
                            $("#email").blur(function(){
                                if(pattern.test($(this).val())==false){
                                    $("#emailError").html('<i class="glyphicon glyphicon-remove-circle" title="邮箱不符合要求"></i>');
                                    $("#emailError").css({
                                        "color":"red"
                                    });
                                }else{
                                    $("#emailError").html('<i class="glyphicon glyphicon-ok-circle"></i>');
                                    $("#emailError").css({
                                        "color":"green"
                                    });
                                }
                            });
                            $("#register").click(function () {
                                if(info==false){
                                    $("#rusernameError").html('<i class="glyphicon glyphicon-remove-circle" title="用户名不可用"></i>');
                                    $("#rusernameError").css({
                                        "color":"red"
                                    });
                                    $("#rusername").focus();
                                }else if($("#pwd").val().length<6||$("#pwd").val().length>16){
                                    $("#pwdError").html('<i class="glyphicon glyphicon-remove-circle" title="密码长度6-16位"></i>');
                                    $("#pwdError").css({
                                        "color":"red"
                                    });
                                    $("#pwd").focus();
                                }else if($("#confirm").val()!=$("#pwd").val()){
                                    $("#confirmError").html('<i class="glyphicon glyphicon-remove-circle" title="两次输入密码不一致"></i>');
                                    $("#confirmError").css({
                                        "color":"red"
                                    });
                                    $("#confirm").focus();
                                }else if(pattern.test($("#email").val())==false){
                                    $("#emailError").html('<i class="glyphicon glyphicon-remove-circle" title="邮箱不符合要求"></i>');
                                    $("#emailError").css({
                                        "color":"red"
                                    });
                                    $("#email").focus();
                                }else{
                                    $("#formID2").submit();
                                }
                            })
                        })
                    </script>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
<script>
    window.onload = function(){
        var div = document.getElementById("switch");
        var a = div.getElementsByTagName("a");
        var oDiv = document.getElementsByClassName("login-content");
        for(var i=0;i<a.length;i++){
            a[i].index = i;
            a[i].onclick=function(){
                for(var j=0;j<a.length;j++){
                    a[j].className = "q-login";
                    oDiv[j].style.display = "none";
                }
                this.className = "q-login q-login-focus";
                oDiv[this.index].style.display = "block";
            }
        }
    }
</script>

<script>
    var str = "${message}";
    if (str == null || str == ""){
        $("#message").text("填写请注意格式");
    }else{
        $("#message").text(str);
        $("#username").val("${user.username}");
    }
    $(function(){
        $(".q-login-item").click(function(){
            $("#switch_bottom").animate({left:"3px"});
        });
        $(".q-register-item").click(function(){
            $("#switch_bottom").animate({left:"157px"});
        });
        if($.cookie("username")!=null){
            $("#username").val($.cookie("username"));
            $("#password").val($.cookie("password"));
            $("#checkbox").attr("checked",$.cookie("checkbox"));
        }
    })
</script>
