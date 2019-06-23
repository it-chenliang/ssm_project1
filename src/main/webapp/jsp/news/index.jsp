<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>新闻管理系统后台</title>
    <jsp:include page="${path}/jsp/common/resources.jsp"></jsp:include>
    <link rel="stylesheet" href="${path}/static/layui/css/layui.css">
    <link rel="stylesheet" href="${path}/static/news/add.css">
    <link rel="stylesheet" href="${path}/static/bootstrap/button.css">
    <link rel="stylesheet" href="${path}/static/news/index.css">
</head>
<body class="layui-layout-body">
<div id="request-code" class="request-code">
    <div class="request-code-header">
        <p class="news-name">新闻详情</p>
        <i class="glyphicon glyphicon-remove" id="close"></i>
    </div>
    <div class="request-code-content">
        <%--新闻图片等--%>
        <div class="news-info">
            <h3 id="news-name"></h3>
            <div class="news-img-info">
                <img src="" alt="" id="news-img">
            </div>
            <div class="news-other-info">
                <ul>
                    <li>
                        <dl>
                            <dt class="span-name" style="width:80px;">作者：</dt>
                            <dd id="author"></dd>
                        </dl>
                    </li>
                    <li>
                        <dl>
                            <dt class="span-name" style="width:80px;">类别名称：</dt>
                            <dd id="typename"></dd>
                        </dl>
                    </li>
                    <li>
                        <dl>
                            <dt class="span-name" style="width:80px;">关键字：</dt>
                            <dd id="keyword"></dd>
                        </dl>
                    </li>
                    <li>
                        <dl>
                            <dt class="span-name" style="width:80px;">来源：</dt>
                            <dd id="source"></dd>
                        </dl>
                    </li>
                    <li>
                        <dl>
                            <dt class="span-name" style="width:80px;">发布时间：</dt>
                            <dd id="pubdate"></dd>
                        </dl>
                    </li>
                    <li>
                        <dl>
                            <dt class="span-name" style="width:80px;">发布者：</dt>
                            <dd id="publisher"></dd>
                        </dl>
                    </li>
                    <li>
                        <dl>
                            <dt class="span-name" style="width:80px;">点击次数：</dt>
                            <dd id="click"></dd>
                        </dl>
                    </li>
                </ul>
            </div>
        </div>
        <%--新闻内容--%>
        <div class="news-content">
            <p id="news-content"></p>
        </div>
    </div>
</div>
<div class="layui-layout layui-layout-admin" id="isHide">
    <%--    头部--%>
    <jsp:include page="${path}/jsp/common/header.jsp"></jsp:include>
    <!--菜单栏-->
    <jsp:include page="${path}/jsp/common/menu3.jsp"></jsp:include>
    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div style="padding: 15px 30px;">
            <div style="margin-left: 30px;margin-top: 20px;"><h3>新闻管理：新闻列表</h3></div>
            <div class="header">
                <div class="header-right">
                    <input type="text" class="search" id="searchByName">
                    <a class="search-button" id="search-button" href="">搜索</a>
                </div>
                <div class="header-left">
                    <a href="${path}/news/addNews" class="btn btn-primary">添加新闻</a>
                    <button class="btn btn-primary" id="all" style="margin-right: 30px;">全 选</button>
                    <button class="btn btn-primary" id="none" style="margin-right: 30px;">取消全选</button>
                    <button id="batchDelete" class="btn btn-success">批量删除</button>
                </div>
            </div>
            <div class="add-content">
                <div class="add-content-input">
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th>选择</th>
                                <th>id</th>
                                <th>新闻标题</th>
                                <th>记者</th>
                                <th>来源</th>
                                <th>类别名称</th>
                                <th>发布时间</th>
                                <th>发布者</th>
                                <th>操作</th>
                            </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${pageInfo.list}" var="obj">
                            <tr>
                                <td><input type="checkbox" value="${obj.id}" name="check"></td>
                                <td>${obj.id}</td>
                                <td>${obj.name}</td>
                                <td>${obj.author}</td>
                                <td>${obj.source}</td>
                                <td>${obj.type.name}</td>
                                <td><fmt:formatDate value="${obj.pubdate}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></td>
                                <td>${obj.publisher}</td>
                                <td>
                                    <a href="javascript:;" class="btn btn-success detail" id="add-club-button" name="${obj.id}">详 情</a>
                                    <a href="${path}/news/modify?id=${obj.id}" class="btn btn-info">修 改</a>
                                    <a href="${path}/news/delete?id=${obj.id}" class="btn btn-warning">删 除</a>
                                </td>
                            </tr>
                        </c:forEach>
                        <script>
                            window.onload = function(){
                                function show(){
                                    $("#isHide").css({
                                        "backgroundColor":"#ccc",
                                        "opacity":0.7,
                                        "z-index":2
                                    });
                                    $("#request-code").css({
                                        "display":"block",
                                        "left":($(window).width()-$("#request-code").width())/2 + "px",
                                        "top":($(window).height()-$("#request-code").height())/2 + "px"
                                    });
                                }
                                function hide(){
                                    $("#isHide").css({
                                        "backgroundColor":"#fff",
                                        "opacity":1,
                                        "z-index":2
                                    });
                                    $("#request-code").css({
                                        "display":"none"
                                    });
                                }
                                var detail = document.getElementsByClassName("detail");
                                for(var i=0;i<detail.length;i++){
                                    detail[i].onclick = function(){
                                        var url = "${path}/news/selectOne?id=" + $(this).attr("name");
                                        $.ajax({
                                            url:url,
                                            type:"post",
                                            success:function (data) {
                                                $("#news-name").text(data.name);
                                                $("#news-img").attr("src",data.picturePath);
                                                $("#author").text(data.author);
                                                $("#typename").text(data.type.name);
                                                $("#keyword").text(data.keyword);
                                                $("#source").text(data.source);
                                                var date = new Date(data.pubdate);
                                                var year = date.getFullYear();
                                                var month = (date.getMonth() + 1)>9?(date.getMonth() + 1):"0"+(date.getMonth()+1);
                                                var day = date.getDate()>9?date.getDate():"0"+date.getDate();
                                                var hour = date.getHours()>9?date.getHours():"0"+date.getHours();
                                                var minute = date.getMinutes()>9?date.getMinutes():"0"+date.getMinutes();
                                                var second = date.getSeconds()>9?date.getSeconds():"0"+date.getSeconds();
                                                $("#pubdate").text(year + "-" + month + "-" + day + " " + hour + ":" + minute + ":" + second);
                                                $("#publisher").text(data.publisher);
                                                $("#click").text(data.click);
                                                $("#news-content").text(data.content);
                                            }
                                        });
                                        show();
                                    }
                                }
                                // 关闭邀请码弹窗
                                $("#close").click(function(){
                                    hide();
                                });
                                //点击复选框
                                var all = document.getElementById("all");
                                var none = document.getElementById("none");
                                var checkbox = document.getElementsByName("check");
                                all.onclick = function(){
                                    for(var i=0;i<checkbox.length;i++){
                                        checkbox[i].checked = true;
                                    }
                                };
                                none.onclick = function(){
                                    for(var i=0;i<checkbox.length;i++){
                                        checkbox[i].checked = false;
                                    }
                                };
                                //批量删除
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
                                            url:"${path}/news/batchDelete",
                                            type:"post",
                                            data:{ids:str},
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
                            }
                        </script>
                        <tr>
                            <td colspan="9">
                                <p style="float: left;margin-left: 200px;">
                                    <span>每页显示<b>5</b>条记录，</span>
                                    共<b>${pageInfo.total}</b>条,
                                    当前<b>${pageInfo.pageNum}</b>页,总<b>${pageInfo.pages}</b>页
                                </p>
                                <p class="page">
                                    <a href="${path}/news/all?pageNo=${pageInfo.firstPage}">第一页</a>
                                    <c:if test="${pageInfo.hasPreviousPage}">
                                        <a href="${path}/news/all?pageNo=${pageInfo.pageNum-1}">上一页</a>
                                    </c:if>
                                    <c:if test="${pageInfo.hasNextPage}">
                                        <a href="${path}/news/all?pageNo=${pageInfo.pageNum+1}">下一页</a>
                                    </c:if>
                                    <a href="${path}/news/all?pageNo=${pageInfo.lastPage}">最后页</a>
                                    到第<input id="page" type="text" style="width: 20px;height: 20px;margin: 0 5px;">页 <a id="jump" class="button button-primary button-pill button-small">跳转</a>
                                    <script>
                                        $("#page").blur(function(){
                                            if($(this).val() == ""){
                                                $("#jump").attr("href","${path}/news/all?pageNo="+1);
                                            }else{
                                                $("#jump").attr("href","${path}/news/all?pageNo="+$(this).val());
                                            }
                                        })
                                    </script>
                                </p>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <%--模糊查询--%>
    <script>
        $("#search-button").click(function(){
            var text = $("#searchByName").val();
            $(this).attr("href","${path}/news/fuzzyQuery?text=" + text);
        });
    </script>
    <div class="layui-footer">
        <!-- 底部固定区域 -->
        Copyright &copy; 2019 allan

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
