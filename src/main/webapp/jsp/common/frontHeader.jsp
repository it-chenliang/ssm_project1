<%--
  Created by IntelliJ IDEA.
  User: Heali
  Date: 2019/6/22
  Time: 13:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="header">
    <div class="logo">
        <a href="/"><img src="${path}/static/images/xiankan.jpg" alt="闲看" style="width: 200px;height: 60px;"></a>
    </div>
    <div class="menu">
        <ul id="menu"></ul>
        <script>
            $.ajax({
                url:"${path}/news/type",
                type:"post",
                success:function (data) {
                    for(var i=0;i<data.length;i++){
                        $("#menu").append("<li><a class='menu-link' href='/news/typeInfo?typeId=" + data[i].id + "'>" + data[i].name +"</a></li>");
                    }
                }
            })
        </script>
    </div>
    <div class="user" id="user">
        <script>
            var username = "${sessionScope.user.username}";
            if(username == "" || username==null){
                $("#user").append('<a href="${path}/jsp/login.jsp">登录</a>');
            }else{
                if("${sessionScope.user.nickname}"==""||"${sessionScope.user.headPortrait}"==""){
                    if("${sessionScope.user.nickname}"=="" && "${sessionScope.user.headPortrait}"!=""){
                        $("#user").append('<ul class="userInfo-link"><li><a href="${path}/user/userInfo?'+
                            'username=${sessionScope.user.username}"><img src="${sessionScope.user.headPortrait}">闲看网友</a></li>' +
                            '<li><a href="${path}/user/logout?username=${sessionScope.user.username}">退出</a></li></ul>');
                    }
                    if("${sessionScope.user.headPortrait}"=="" && "${sessionScope.user.nickname}"!=""){
                        $("#user").append('<ul class="userInfo-link"><li><a href="${path}/user/userInfo?'+
                            'username=${sessionScope.user.username}"><img src="/uploads/1561103430163.jpg">${sessionScope.user.nickname}</a></li>' +
                            '<li><a href="${path}/user/logout?username=${sessionScope.user.username}">退出</a></li></ul>');
                    }
                    if("${sessionScope.user.headPortrait}"=="" && "${sessionScope.user.nickname}"==""){
                        $("#user").append('<ul class="userInfo-link"><li><a href="${path}/user/userInfo?'+
                            'username=${sessionScope.user.username}"><img src="/uploads/1561103430163.jpg">闲看网友</a></li>' +
                            '<li><a href="${path}/user/logout?username=${sessionScope.user.username}">退出</a></li></ul>');
                    }
                }
                if("${sessionScope.user.nickname}"!=""&&"${sessionScope.user.headPortrait}"!=""){
                    $("#user").append('<ul class="userInfo-link"><li><a href="${path}/user/userInfo?'+
                        'username=${sessionScope.user.username}"><img src="${sessionScope.user.headPortrait}">${sessionScope.user.nickname}</a></li>' +
                        '<li><a href="${path}/user/logout?username=${sessionScope.user.username}">退出</a></li></ul>');
                }
            }
        </script>
    </div>
</div>
