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
    <link rel="stylesheet" href="${path}/static/manager/security.css">
    <link rel="shortcut icon" href="${path}/static/images/xiankan.jpg">
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
                <h3 style="margin-bottom: 20px;">修改密码</h3>
                <p style="margin-bottom: 20px;">${msg}</p>
                <form action="${path}/manage/changPassword" method="post" id="changePwd">
                    <ul class="security-manage">
                        <li>
                            <input type="hidden" name="username" value="${sessionScope.manager.username}" id="username">
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
                            <button type="button" id="pwdChang" class="btn" style="background-color: #e35b5a;">更改密码</button>
                            <button type="reset" class="btn" style="background-color: #e35b5a;">取消</button>
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

    //密码核对
    $(function(){
        var info = null;
        /**
         * 表单失去焦点验证密码
         */
        $("#original").blur(function(){
            $.ajax({
                url:'/manage/checkPassword',
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
</body>
</html>
