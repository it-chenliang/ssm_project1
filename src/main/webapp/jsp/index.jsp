<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>新闻管理系统后台</title>
    <link rel="shortcut icon" href="${path}/static/images/xiankan.jpg">
    <jsp:include page="${path}/jsp/common/resources.jsp"></jsp:include>
    <link rel="stylesheet" href="${path}/static/layui/css/layui.css">
    <link rel="stylesheet" href="${path}/static/manager/index.css">
    <script src="https://cdn.bootcss.com/echarts/4.2.1-rc1/echarts.min.js"></script>
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
                <div class="platform-statistics">
                    <div class="statistics-count">
                        <ul>
                            <li style="background-color: #578ebe;">
                                <div class="count-item-left">
                                    <i class="glyphicon glyphicon-list-alt"></i>
                                </div>
                                <div class="count-item-right">
                                    <h2 style="line-height: 50px;"><span id="newsCount"></span><sub style="font-size: 15px;">条</sub></h2>
                                    <h5 style="line-height: 20px;">新闻数量</h5>
                                </div>
                            </li>
                            <li style="background-color: #44b6ae;">
                                <div class="count-item-left">
                                    <i class="glyphicon glyphicon-list-alt"></i>
                                </div>
                                <div class="count-item-right">
                                    <h2 style="line-height: 50px;"><span id="typeCount"></span><sub style="font-size: 15px;">条</sub></h2>
                                    <h5 style="line-height: 20px;">类别数量</h5>
                                </div>
                            </li>
                            <li style="background-color: #8775a7;">
                                <div class="count-item-left">
                                    <i class="glyphicon glyphicon-list-alt"></i>
                                </div>
                                <div class="count-item-right">
                                    <h2 style="line-height: 50px;"><span id="userCount"></span><sub style="font-size: 15px;">条</sub></h2>
                                    <h5 style="line-height: 20px;">用户数量</h5>
                                </div>
                            </li>
                            <li style="background-color: #4f5c65;">
                                <div class="count-item-left">
                                    <i class="glyphicon glyphicon-list-alt"></i>
                                </div>
                                <div class="count-item-right">
                                    <h2 style="line-height: 50px;"><span id="commentCount"></span><sub style="font-size: 15px;">条</sub></h2>
                                    <h5 style="line-height: 20px;">评论数量</h5>
                                </div>
                            </li>
                        </ul>
                        <script>
                            $(function () {
                                $.ajax({
                                    url:"${path}/manage/count",
                                    type:"post",
                                    success:function (data) {
                                        $("#newsCount").text(data.news);
                                        $("#userCount").text(data.user);
                                        $("#typeCount").text(data.type);
                                        $("#commentCount").text(data.comment);
                                    }
                                })
                            })
                        </script>
                    </div>
                    <div class="statistics-charts">
                        <div class="statistics-charts-header">
                            <label><i class="glyphicon glyphicon-globe"></i>新闻类别统计</label>
                        </div>
                        <div class="statistics-charts-content">
                            <div id="main" style="width: 380px;height:190px;"></div>
                            <script>
                                //绘制图表
                                // 基于准备好的dom，初始化echarts实例
                                var myChart = echarts.init(document.getElementById('main'));
                                var option = {
                                    tooltip : {
                                        trigger: 'item',
                                        formatter: "{a} <br/>{b} : {c} ({d}%)"
                                    },
                                    legend: {
                                        orient: 'vertical',
                                        left: 'left',
                                        data: []
                                    },
                                    series : [
                                        {
                                            name: '数量',
                                            type: 'pie',
                                            radius : '55%',
                                            center: ['50%', '60%'],
                                            data:[]
                                        }
                                    ]
                                };

                                //获取数据
                                var type = new Array();
                                var value = new Array();
                                var target = new Array();
                                var obj;
                                $.ajax({
                                    url:"${path}/news/type",
                                    type:"post",
                                    success:function (data) {
                                        for(var i=0;i<data.length;i++){
                                            type[i] = data[i].name;
                                        }
                                    }
                                });
                                $.ajax({
                                    url:"${path}/manage/countType",
                                    type:"post",
                                    success:function (data) {
                                        obj = data;
                                        for(x in type){
                                            value.push(data[type[x]]);
                                        }
                                        for (var i=0;i<type.length;i++){
                                            var Obj={};
                                            Obj.name = type[i];
                                            Obj.value = value[i];
                                            target.push(Obj);
                                        }
                                        myChart.setOption({
                                            tooltip : {
                                                trigger: 'item',
                                                formatter: "{a} <br/>{b} : {c} ({d}%)"
                                            },
                                            legend: {
                                                orient: 'vertical',
                                                left: 'left',
                                                data: type
                                            },
                                            series : [
                                                {
                                                    name: '数量',
                                                    type: 'pie',
                                                    center: ['50%', '60%'],
                                                    data:target
                                                }
                                            ]
                                        });
                                    }
                                });
                            </script>
                        </div>
                    </div>
                </div>
                <h3 style="margin: 20px 0;">管理员个人信息管理</h3>
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
                            <button type="submit" class="btn" style="background-color: #578ebe;">更改</button>
                            <button type="reset" class="btn" style="background-color: #578ebe;">取消</button>
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
