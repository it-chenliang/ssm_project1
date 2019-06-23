<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>新闻管理系统后台</title>
    <jsp:include page="${path}/jsp/common/resources.jsp"></jsp:include>
    <link rel="stylesheet" href="${path}/static/layui/css/layui.css">
    <link rel="stylesheet" href="${path}/static/manager/index.css">
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <%--    头部--%>
    <jsp:include page="${path}/jsp/common/header.jsp"></jsp:include>
    <!--菜单栏-->
    <jsp:include page="${path}/jsp/common/menu.jsp"></jsp:include>
    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div style="padding: 15px;">
            <div class="userInfo-content-detail">
                <h3 style="margin-bottom: 20px;">管理员个人信息管理</h3>
                <p style="margin-bottom: 20px;">${msg}</p>
                <form action="${path}/manage/changManagerInfo" method="post">
                    <ul class="user-detail">
                        <li>
                            <input type="hidden" name="username" value="${mManager.username}">
                            <input type="text" name="name" value="${mManager.name}">
                            <button class="button">真实姓名</button>
                        </li>
                        <li>
                            <input type="text" name="nickname" value="${mManager.nickname}">
                            <button class="button">网名</button>
                        </li>
                        <li>
                            <input type="text" name="tel" value="${mManager.tel}">
                            <button class="button">联系电话</button>
                        </li>
                        <li>
                            <input type="email" name="email" value="${mManager.email}">
                            <button class="button">邮箱</button>
                        </li>
                        <li style="width:910px;">
                            <button type="submit" class="btn">更改</button>
                            <button type="reset" class="btn">取消</button>
                        </li>
                    </ul>
                </form>
            </div>
        </div>
    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        layui.com

        - 底部固定区域
    </div>
</div>
<script src="${path}/static/layui/layui.js"></script>
<script>
    //JavaScript代码区域
    layui.use('element', function(){
        var element = layui.element;
    });
</script>
</body>
</html>
