<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="layui-header">
    <div class="layui-logo">
        <img src="${path}/uploads/tupian.png" alt="" style="width: 200px;height: 60px;">
    </div>
    <ul class="layui-nav layui-layout-right">
        <li class="layui-nav-item">
            <a href="${path}/manage/index?username=${sessionScope.manager.username}">
                <span style="font-weight: bold;">管理员：</span>${sessionScope.manager.username}
            </a>
        </li>
        <li class="layui-nav-item"><a href="${path}/manage/logout">退了</a></li>
    </ul>
</div>
