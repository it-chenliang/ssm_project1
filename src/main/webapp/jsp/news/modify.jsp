<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <link rel="shortcut icon" href="${path}/static/images/xiankan.jpg">
    <style>
        .control-label{
            width: 100px;
        }
    </style>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <%--    头部--%>
    <jsp:include page="${path}/jsp/common/header.jsp"></jsp:include>
    <!--菜单栏-->
    <jsp:include page="${path}/jsp/common/menu3.jsp"></jsp:include>
    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div style="padding: 15px 30px;">
            <div style="margin-left: 30px;margin-top: 20px;"><h3>新闻管理：修改新闻</h3></div>
            <div class="add-content">
                <div class="header-left">
                    <a href="${path}/news/all" class="btn btn-primary">新闻列表</a>
                </div>
                <div class="add-content-input">
                    <form class="form-horizontal"  method="post" enctype="multipart/form-data" action="${path}/news/update">
                        <input type="hidden" class="form-control form-control1" name="id" value="${news.id}">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">新闻标题</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control form-control1" name="name" value="${news.name}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">新闻作者</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control form-control2" name="author" value="${news.author}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">新闻类别</label>
                            <div class="col-sm-10">
                                <select class="form-control form-control3" name="typeId" id="all">
                                    <script>
                                        $.ajax({
                                            url:"${path}/news/type",
                                            type:"post",
                                            success:function (data) {
                                                for (var i=0;i<data.length;i++){
                                                    if (data[i].id == ${news.type.id}) {
                                                        $("#all").append("<option selected='selected' value='" + data[i].id + "'>" + data[i].name + "</option>");
                                                    }else{
                                                        $("#all").append("<option value='" + data[i].id + "'>" + data[i].name + "</option>");
                                                    }
                                                }
                                            }
                                        })
                                    </script>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">新闻内容</label>
                            <div class="col-sm-10">
                                <textarea class="form-control form-control4" rows="3" name="content">${news.content}</textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">新闻关键字</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control form-control5" name="keyword" value="${news.keyword}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">封面图片</label>
                            <div class="col-sm-10">
                                <div class="file">
                                    　　<div class="userdefined-file">
                                    　　<input type="text" name="userdefinedFile" id="uploadFile1" value="${news.picturePath}">
                                    　　<button type="button"><i class="glyphicon glyphicon-cloud-upload"></i>上传</button>
                                </div>
                                    <input type="file" name="file" id="file1" accept="image/*" value="${news.picturePath}">
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">新闻来源</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control form-control6" name="source" value="${news.source}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">发表人</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control form-control8" name="publisher" value="${news.publisher}">
                            </div>
                        </div>
                        <div class="form-group" style="padding-left: 100px;">
                            <div class="submit">
                                <button id="save-button" class="btn btn-success">更新新闻</button>
                            </div>
                            <div class="reset">
                                <input type="reset" value="取 消" class="btn btn-warning">
                            </div>
                        </div>
                        <script>
                            //表单提交
                            $("#save-button").click(function(){
                                $("#form").submit();
                            });
                            //判断是否选中文件
                            $("#file1").on("change",function(){
                                var arr = $("#file1").val().split(".");
                                $("#uploadFile1").val($("#file1").val());
                            });
                        </script>
                    </form>
                </div>
            </div>
        </div>
    </div>

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
