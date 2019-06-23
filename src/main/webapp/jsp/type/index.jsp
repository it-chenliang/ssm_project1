<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>新闻管理系统后台</title>
    <%--资源文件--%>
    <jsp:include page="${path}/jsp/common/resources.jsp"></jsp:include>
    <link rel="stylesheet" href="${path}/static/layui/css/layui.css">
    <link rel="stylesheet" href="${path}/static/type/index.css">
    <script src="${path}/static/js/checkbox.js"></script>
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
            <div style="margin-left: 30px;margin-top: 20px;"><h3>新闻类别：类别列表</h3></div>
            <div class="header">
                <div class="header-right">
                    <input type="text" class="search" id="searchByName">
                    <button class="search-button" id="search-button">搜索</button>
                </div>
                <div class="header-left">
                    <a href="${path}/type/addType" class="btn btn-primary" style="margin-right: 30px;">添加类别</a>
                    <a href="javascript:;" class="btn btn-primary" id="selectAll" style="margin-right: 30px;">全 选</a>
                    <a href="javascript:;" class="btn btn-primary" id="selectNone" style="margin-right: 30px;">取消全选</a>
                    <a href="javascript:;" class="btn btn-primary" id="selectReverse" style="margin-right: 30px;">反 选</a>
                    <button id="batchDelete" class="btn btn-success">批量删除</button>
                </div>
            </div>
            <table class="table">
                <thead>
                    <tr>
                        <th>选择</th>
                        <th>ID</th>
                        <th>类型名称</th>
                        <th>操作</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="obj" items="${typeList}">
                        <tr>
                            <td style="line-height: 45px;"><input type="checkbox" value="${obj.id}" name="check"></td>
                            <td style="line-height: 45px;">${obj.id}</td>
                            <td style="line-height: 45px;">${obj.name}</td>
                            <td style="line-height: 45px;">
                                <a href="${path}/type/modify?id=${obj.id}" class="btn btn-info">修 改</a>
                                <a href="${path}/type/delete?id=${obj.id}" class="btn btn-warning">删 除</a></td>
                        </tr>
                    </c:forEach>
                </tbody>
                <script>
                    var arr = new Array();
                    var str = "";
                    $("#batchDelete").click(function () {
                        $("input[name='check']:checked").each(function () {
                            arr.push($(this).val());
                        });
                        if(arr.length>=1){
                            for(var i=0;i<arr.length;i++){
                                if(i == arr.length-1){
                                    str += arr[i];
                                }else{
                                    str += arr[i] + ",";
                                }
                            }
                            $.ajax({
                                url:"${path}/type/batchDelete",
                                type:"post",
                                data:{name:str},
                                success:function (data) {
                                    if(data == "success"){
                                        // 删除成功后刷新页面
                                        window.location.reload();
                                    }
                                }
                            })
                        }else{
                            alert("至少选择一项");
                        }
                    })
                </script>
            </table>
        </div>
    </div>
    <%--模糊查询--%>
    <script>
        $("#search-button").click(function(){
            var typeName = $("#searchByName").val();
            $.ajax({
                url:"${path}/type/fuzzyQuery",
                type:"post",
                data:{typeName:typeName},
                success:function (data) {
                    $("tbody").empty();
                    for(var i=0;i<data.length;i++){
                        var tr;
                        tr='<td style="line-height: 45px;"><input type="checkbox" value="' + data[i].id + '" name="check"></td>'+
                           '<td style="line-height: 45px;">' + data[i].id + '</td>' +
                           '<td style="line-height: 45px;">' + data[i].name + '</td>' +
                           '<td style="line-height: 45px;"><a href="/type/modify?id=' + data[i].id + '" class="btn btn-info">修 改</a>'+
                           '<a href="/type/delete?id=' + data[i].id + '" class="btn btn-warning">删 除</a></td>'
                        $("tbody").append('<tr>'+tr+'</tr>')
                    }
                }
            })
        });
    </script>

    <div class="layui-footer">
        layui.com- 底部固定区域
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
