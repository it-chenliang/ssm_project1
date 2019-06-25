<%--
  Created by IntelliJ IDEA.
  User: Heali
  Date: 2019/6/19
  Time: 21:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>闲看新闻个人中心</title>
    <link rel="stylesheet" href="${path}/static/webfront/userInfo.css">
    <jsp:include page="${path}/jsp/common/resources.jsp"></jsp:include>
    <link rel="shortcut icon" href="${path}/static/images/xiankan.jpg">
    <script src="${path}/static/js/jquery-3.3.1.js"></script>
</head>
<body style="background-color: #f3f2f0;">
<jsp:include page="${path}/jsp/common/frontHeader.jsp"></jsp:include>
<div class="body">
    <div class="userInfo-menu">
        <div class="userInfo-menu-header">
            <div class="userInfo-menu-header-img">
                <img src="${user.headPortrait}" alt="">
            </div>
            <div class="userInfo-menu-header-name">
                <label>奶油味拥抱</label>
            </div>
        </div>
        <ul class="userInfo-bar">
            <li><a href="javascript:;"><i class="glyphicon glyphicon-user"></i>基本资料</a></li>
            <li><a href="javascript:;"><i class="glyphicon glyphicon-comment"></i>评论管理</a></li>
            <li class="active"><a href="javascript:;"><i class="glyphicon glyphicon-lock"></i>安全中心</a></li>
        </ul>
    </div>
    <div class="userInfo-content" id="userInfo-content">
        <div class="user-form">
            <div class="userInfo-content-header"><label>个人中心 >> 基本资料</label></div>
            <div class="userInfo-content-detail">
                <p>上次登录:<fmt:formatDate value="${user.lastLoginTime}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></p>
                <form action="${path}/user/changeUserInfo" method="post" enctype="multipart/form-data">
                    <ul class="user-detail">
                        <li>
                            <input type="hidden" name="username" value="${user.username}">
                            <input type="text" name="name" value="${user.name}">
                            <button class="button">真实姓名</button>
                        </li>
                        <li>
                            <input type="text" name="nickname" value="${user.nickname}">
                            <button class="button">网名</button>
                        </li>
                        <li>
                            <input type="text" name="tel" value="${user.tel}">
                            <button class="button">联系电话</button>
                        </li>
                        <li>
                            <input type="text" name="gender" value="${user.gender}">
                            <button class="button">性别</button>
                        </li>
                        <li>
                            <input type="text" name="email" value="${user.email}">
                            <button class="button">邮箱</button>
                        </li>
                        <li>
                            <input type="date" name="birthday" value="${user.birthday}">
                            <button class="button">出生日期</button>
                        </li>
                        <li>
                            <div class="file">
                                <div class="userdefined-file">
                                    <button type="button">
                                        <i class="glyphicon glyphicon-cloud-upload"></i>头像</button>
                                    <input type="text" name="userdefinedFile" id="uploadFile1" value="上传头像/修改头像">
                                </div>
                                <input type="file" name="file" id="file1" accept="image/*">
                            </div>
                        </li>
                        <li style="width:910px;">
                            <button type="submit" class="btn">提交</button>
                            <button type="reset" class="btn">取消</button>
                        </li>
                    </ul>
                </form>
            </div>
        </div>
        <div class="user-form">
            <div class="userInfo-content-header"><label>个人中心 >> 评论管理</label></div>
            <div class="userInfo-content-detail">
                <ul class="all-comment" id="all-comment">
                </ul>
            </div>
        </div>
        <div class="user-form" style="display: block;">
            <div class="userInfo-content-header"><label>个人中心 >> 安全中心</label></div>
            <div class="userInfo-content-detail">
                <h3>${msg}</h3>
                <form action="${path}/user/changPassword" method="post" id="changePwd">
                    <ul class="security-manage">
                        <li>
                            <input type="hidden" name="username" value="${user.username}" id="username">
                            <input type="password" name="original" placeholder="请输入原始密码" id="original">
                            <button class="button">原始密码</button>
                            <span id="originalError"></span>
                        </li>
                        <li>
                            <input type="password" name="password" placeholder="请输入新密码" id="now">
                            <button class="button">新密码</button>
                            <span id="nowError"></span>
                        </li>
                        <li>
                            <input type="password" name="confirm" placeholder="请再次输入密码" id="confirm">
                            <button class="button">确认密码</button>
                            <span id="confirmError"></span>
                        </li>
                        <li>
                            <button type="button" id="pwdChang" class="btn">更改密码</button>
                            <button type="reset" class="btn">取消</button>
                        </li>
                    </ul>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>
<script>
    window.onload = function(){
        var ul = document.getElementsByClassName("userInfo-bar")[0];
        var li = ul.getElementsByTagName("li");
        var oDiv = document.getElementsByClassName("user-form");
        for(var i=0;i<li.length;i++){
            li[i].index = i;
            li[i].onclick = function(){
                for(var j=0;j<li.length;j++){
                    li[j].className = "";
                    oDiv[j].style.display = "none";
                }
                this.className = "active";
                oDiv[this.index].style.display = 'block';
            }
        }
    };

    //判断是否选中文件
    $("#file1").on("change",function(){
        if ($("#file1").val() == null || $("#file1").val()==""){
            $("#uploadFile1").val("上传头像/修改头像");
        }else{
            var arr = $("#file1").val().split(".");
            if(arr[arr.length-1] == "jpeg" || arr[arr.length-1] == "jpg" ||
                arr[arr.length-1] == "png" ||arr[arr.length-1] == "gif" ||
                arr[arr.length-1] == "bmp" ||arr[arr.length-1] == "webp"){
                $("#uploadFile1").val($("#file1").val());
            }else{
                $("#uploadFile1").val("不支持的格式");
            }
        }
    });

    //加载评论记录
    $(function(){
        $.ajax({
            url:"${path}/comment/userComment",
            type:"post",
            async:false,
            dataType:"json",
            data:{username:${user.username}},
            success:function (data) {
                for(var i=0;i<data.length;i++){
                    var date = new Date(data[i].comdate);
                    var year = date.getFullYear();
                    var month = (date.getMonth() + 1)>9?(date.getMonth() + 1):"0"+(date.getMonth()+1);
                    var day = date.getDate()>9?date.getDate():"0"+date.getDate();
                    var hour = date.getHours()>9?date.getHours():"0"+date.getHours();
                    var minute = date.getMinutes()>9?date.getMinutes():"0"+date.getMinutes();
                    var second = date.getSeconds()>9?date.getSeconds():"0"+date.getSeconds();
                    var text = year + "-" + month + "-" + day + " " + hour + ":" + minute + ":" + second;
                    var li = '<li><div class="user-img"><img src="' + data[i].news.picturePath + '" alt=""></div>';
                    li += '<div class="comment-info"><div><a href="/news/detail?id=' + data[i].news.id + '">' + data[i].news.name + '</a></div>';
                    li += '<div>' + data[i].content + '</div>';
                    li += '<div><span style="margin-right: 20px;">' + text + '</span><a href="/comment/delete?username=' + data[i].user.username
                        + '&&id=' + data[i].id + '">删除</a></div>';
                    li += '</div></li>';
                    $("#all-comment").append(li);
                }
            }
        })
    })

    //密码核对
    $(function(){
        var info = null;
        /**
         * 表单失去焦点验证密码
         */
        $("#original").blur(function(){
            $.ajax({
                url:'/user/checkPassword',
                data:{username:$("#username").val()},
                type:'post',
                dataType:"json",
                success:function(data){
                    info = data;
                    if($("#original").val()!=data){
                        $("#originalError").html('<i class="glyphicon glyphicon-remove-circle"></i>密码不正确');
                        $("#originalError").css({
                            "color":"red"
                        });
                    }else{
                        $("#originalError").html('<i class="glyphicon glyphicon-ok-circle"></i>');
                        $("#originalError").css({
                            "color":"green"
                        });
                    }
                }
            })
        });

        $("#now").blur(function(){
            var len = $(this).val().length;
            if(len<6 || len>16){
                $("#nowError").html('<i class="glyphicon glyphicon-remove-circle"></i>请输入6-16的字符');
                $("#nowError").css({
                    "color":"red"
                });
            }else{
                $("#nowError").html('<i class="glyphicon glyphicon-ok-circle"></i>');
                $("#nowError").css({
                    "color":"green"
                });
            }
        });

        $("#confirm").blur(function(){
            var now = $("#now").val();
            if(now!=$(this).val() || $(this).val().length<=0){
                $("#confirmError").html('<i class="glyphicon glyphicon-remove-circle"></i>两次输入密码不一致');
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

        $("#pwdChang").click(function(){
            if($("#original").val()!=info){
                $("#original").focus();
            }else if($("#now").val().length<6||$("#now").val().length>16){
                $("#now").focus();
            }else if($("#confirm").val()!=$("#now").val()||$("#confirm").val().length<=0){
                $("#confirm").focus();
            }else{
                $("#changePwd").submit();
            }
        })
    })
</script>
