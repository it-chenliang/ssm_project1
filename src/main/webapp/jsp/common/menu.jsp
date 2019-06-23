<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="layui-side layui-bg-black">
    <div class="layui-side-scroll">
        <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
        <ul class="layui-nav layui-nav-tree"  lay-filter="test">
            <style>
                .glyphicon{
                    margin-right: 10px;
                }
            </style>
            <li class="layui-nav-item layui-nav-itemed">
                <a class="" href="javascript:;"><i class="glyphicon glyphicon-user"></i>个人信息管理</a>
                <dl class="layui-nav-child">
                    <dd><a href="${path}/manage/index?username=${sessionScope.manager.username}">查看个人资料</a></dd>
                    <dd><a href="${path}/manage/security">修改密码</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item">
                <a class="" href="javascript:;"><i class="glyphicon glyphicon-user"></i>用户管理</a>
                <dl class="layui-nav-child">
                    <dd><a href="${path}/manage/toUserManage">用户列表</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item">
                <a href="javascript:;"><i class="glyphicon glyphicon-align-justify"></i>新闻管理</a>
                <dl class="layui-nav-child">
                    <dd><a href="${path}/news/all">新闻列表</a></dd>
                    <dd><a href="${path}/news/addNews">添加新闻</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item">
                <a href="javascript:;"><i class="glyphicon glyphicon-align-center"></i>新闻类别管理</a>
                <dl class="layui-nav-child">
                    <dd><a href="${path}/type/all">类别列表</a></dd>
                    <dd><a href="${path}/type/addType">添加类别</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item">
                <a href="${path}/manage/commentManage"><i class="glyphicon glyphicon-edit"></i>评论管理</a>
                <dl class="layui-nav-child">
                    <dd><a href="">评论列表</a></dd>
                </dl>
            </li>
        </ul>
    </div>
</div>
