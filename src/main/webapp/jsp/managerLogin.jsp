<%--
  Created by IntelliJ IDEA.
  User: Heali
  Date: 2019/6/21
  Time: 10:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>闲看新闻后台-登录</title>
    <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${path}/static/webfront/validationEngine.jquery.css" type="text/css"/>
    <link rel="stylesheet" href="${path}/static/webfront/managerLogin.css">
    <link rel="shortcut icon" href="${path}/static/images/xiankan.jpg">
    <script src="${path}/static/js/jquery-3.3.1.js" type="text/javascript"></script>
    <script src="${path}/static/js/jquery.cookie.js"></script>
    <script src="${path}/static/js/jquery.validationEngine.js" type="text/javascript" charset="utf-8"></script>
    <script src="${path}/static/js/languages/jquery.validationEngine-zh_CN.js" type="text/javascript" charset="utf-8"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script>
        jQuery(document).ready(function(){
            jQuery("#formID").validationEngine();
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
                <a href="javascript:void(0);" class="q-login q-login-focus q-login-item">闲看新闻后台管理</a>
            </div>
        </div>
        <div class="login-content quite-login" style="display: block;">
            <form id="formID" method="post" action="${path}/manage/login">
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
    </div>
</div>
</body>
</html>
<script>
    if('${msg}'==""){
        $("#message").text("填写请注意格式");
    }else{
        $("#message").text("${msg}");
    }
</script>