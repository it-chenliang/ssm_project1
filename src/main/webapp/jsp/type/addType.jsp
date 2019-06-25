<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>新闻管理系统后台</title>
    <jsp:include page="${path}/jsp/common/resources.jsp"></jsp:include>
    <link rel="stylesheet" href="${path}/static/layui/css/layui.css">
    <link rel="stylesheet" href="${path}/static/type/addType.css">
    <link rel="shortcut icon" href="${path}/static/images/xiankan.jpg">
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <%--    头部--%>
    <jsp:include page="${path}/jsp/common/header.jsp"></jsp:include>
    <!--菜单栏-->
    <jsp:include page="${path}/jsp/common/menu4.jsp"></jsp:include>
    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div style="padding: 15px 30px;">
            <div style="margin-left: 30px;margin-top: 20px;"><h3>新闻类别：增加类别</h3></div>
            <div class="add-content">
                <div class="header-left">
                    <a href="${path}/type/all" class="btn btn-primary">类别列表</a>
                </div>
                <div class="add-content-input">
                    <form action="${path}/type/add" method="post">
                        <input type="text" name="name" placeholder="请输入类别名称" id="typeName" class="form-control"><br>
                        <h3>${msg}</h3>
                        <div class="submit">
                            <input type="submit" value="提交" class="btn btn-success">
                        </div>
                        <div class="reset">
                            <input type="reset" value="取消" class="btn btn-warning">
                        </div>
                    </form>
                </div>
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
