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
            <div style="margin-left: 30px;margin-top: 20px;"><h3>新闻管理：添加新闻</h3></div>
            <div class="add-content">
                <div class="header-left">
                    <a href="${path}/news/all" class="btn btn-primary">新闻列表</a>
                </div>
                <div class="add-content-input">
                    <h3 style="margin-bottom: 20px;color: #337ab7;">${msg}</h3>
                    <form class="form-horizontal"  method="post" enctype="multipart/form-data" action="${path}/news/add">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">新闻标题</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control form-control1" placeholder="请输入新闻标题" name="name">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">新闻作者</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control form-control2" placeholder="请输入新闻作者" name="author">
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
                                                    $("#all").append("<option value='" + data[i].id + "'>" + data[i].name + "</option>");
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
                                <textarea class="form-control form-control4" rows="3" placeholder="请输入新闻内容" name="content"></textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">新闻关键字</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control form-control5" placeholder="请输入关键字" name="keyword">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">封面图片</label>
                            <div class="col-sm-10">
                                <div class="file">
                                　　<div class="userdefined-file">
                                    　　<input type="text" name="userdefinedFile" id="uploadFile1" value="未选择任何文件">
                                    　　<button type="button"><i class="glyphicon glyphicon-cloud-upload"></i>上传</button>
                                    </div>
                                    <input type="file" name="file" id="file1" accept="image/*">
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">新闻来源</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control form-control6" placeholder="请输入新闻来源于" name="source">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">发表人</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control form-control8" placeholder="请输入发表人" name="publisher">
                            </div>
                        </div>
                        <div class="form-group" style="padding-left: 100px;">
                            <div class="submit">
                                <button id="save-button" class="btn btn-success">保存新闻</button>
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
                                if ($("#file1").val() == null || $("#file1").val()==""){
                                    $("#uploadFile1").val("未选择任何文件");
                                }else{
                                    var arr = $("#file1").val().split(".");
                                    if(arr[arr.length-1] == "jpeg" || arr[arr.length-1] == "jpg" ||
                                        arr[arr.length-1] == "png" ||arr[arr.length-1] == "gif" ||
                                        arr[arr.length-1] == "bmp" ||arr[arr.length-1] == "webp"){
                                        $("#uploadFile1").val($("#file1").val());
                                    }else{
                                        $("#uploadFile1").val("不支持的格式");
                                    }
                                }
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
