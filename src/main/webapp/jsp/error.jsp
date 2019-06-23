<%--
  Created by IntelliJ IDEA.
  User: Heali
  Date: 2019/6/19
  Time: 17:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>403 Forbidden</title>
    <style>
        .container{
            width: 100%;
            margin: 0 auto;
            height: auto;
        }
        .header{
            height: 80px;
            text-align: center;
            border-bottom: 1px solid lightgray;
            line-height: 80px;
            box-shadow:1px 1px 3px lightgray;
        }
        .error-info{
            height: 40px;
            line-height: 40px;
            text-align: center;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="header">
        <h1>403 Forbidden</h1>
    </div>
    <div class="error-info">
        <span>对不起，你还未登录，没有访问权限</span><br>
        <a href="${path}/jsp/login.jsp">用户登录</a><br>
        <a href="${path}/jsp/managerLogin.jsp">管理员登录</a>
    </div>
</div>
</body>
</html>
