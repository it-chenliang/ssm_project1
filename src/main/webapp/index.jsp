<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>闲看新闻</title>
    <jsp:include page="${path}/jsp/common/resources.jsp"></jsp:include>
    <link rel="stylesheet" href="${path}/static/webfront/index.css">
    <link rel="shortcut icon" href="${path}/static/images/xiankan.jpg">
    <style>
        .body a:link,.body a:visited{
            text-decoration: none;
            color: #555;
        }
        .body a:hover{
            text-decoration: underline;
        }
        .recent-news-content li{
            list-style: circle inside url('${path}/uploads/eg_arrow.gif')
        }
        #user>a{
            line-height: 60px;
        }
        #user>a>img{
            width: 40px;
            height: 40px;
            margin-top: 10px;
            border-radius: 50%;
            margin-right: 10px;
        }
    </style>
</head>
<body>
    <jsp:include page="${path}/jsp/common/frontHeader.jsp"></jsp:include>
    <div class="body">
        <div class="body-left">
            <div id="myCarousel" class="carousel slide">
                <!-- 轮播（Carousel）指标 -->
                <ol class="carousel-indicators">
                    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                    <li data-target="#myCarousel" data-slide-to="1"></li>
                    <li data-target="#myCarousel" data-slide-to="2"></li>
                </ol>
                <!-- 轮播 -->
                <div class="carousel-inner" id="carousel">
                    <script>
                        $.ajax({
                            url:"${path}/news/carousel",
                            type:"post",
                            success:function (data) {
                                for(var i=0;i<data.length;i++){
                                    if(i==0){
                                        $("#carousel").append('<div class="item active"><a href="/news/detail?id=' + data[i].id + '"><img style="height: 350px;width: 700px;" src="' +
                                        data[i].picturePath + '"><div class="carousel-caption"><h3>' + data[i].name +'</div></a></div>');
                                    }else{
                                        $("#carousel").append('<div class="item"><a href="/news/detail?id=' + data[i].id + '"><img style="height: 350px;width: 700px;" src="' + data[i].picturePath +
                                        '"><div class="carousel-caption"><h3>' + data[i].name + '</h3></div></a></div>');
                                    }
                                }
                            }
                        })
                    </script>
                </div>
            </div>
            <script>
                $('#myCarousel').carousel({
                    interval: 1500
                })
            </script>
            <div class="news-type-item1">
                <ul class="nav nav-tabs">
                    <li class="active"><a href="#">军事</a></li>
                </ul>
                <div class="military-news-menu">
                    <ul id="item1">
                        <script>
                            $.ajax({
                                url:"${path}/news/item1",
                                type:"post",
                                success:function (data) {
                                    for(var i=0;i<data.length;i++){
                                        var date = new Date(data[i].pubdate);
                                        var year = date.getFullYear();
                                        var month = date.getMonth() + 1>9?(date.getMonth() + 1):"0"+(date.getMonth()+1);
                                        var day = date.getDate()>9?date.getDate():"0"+date.getDate();
                                        var dateStr = year + "-" + month + "-" + day;
                                        $("#item1").append('<li><a href="/news/detail?id=' + data[i].id
                                        + '"><div class="menu-row"><div class="news-name">' + data[i].name + "</div>"
                                        + '<div class="news-date">' + dateStr + "</div>"
                                        + '</a></li>');
                                    }
                                }
                            })
                        </script>
                    </ul>
                </div>
            </div>
            <div class="news-type-item2">
                <ul class="nav nav-tabs">
                    <li class="active"><a href="#">国际</a></li>
                </ul>
                <div class="international-news-list">
                    <ul id="international-news"></ul>
                    <script>
                        $.ajax({
                            url:"${path}/news/international",
                            type:"post",
                            success:function (data) {
                                for(var i=0;i<data.length;i++){
                                    var date = new Date(data[i].pubdate);
                                    var year = date.getFullYear();
                                    var month = date.getMonth() + 1>9?(date.getMonth() + 1):"0"+(date.getMonth()+1);
                                    var day = date.getDate()>9?date.getDate():"0"+date.getDate();
                                    var dateStr = year + "-" + month + "-" + day;
                                    $("#international-news").append('<li><div  class="international-new-img">' +
                                    '<img  style="width: 150px;height: 110px;" src="' + data[i].picturePath + '"></div>'+
                                    '<div class="international-new-info"><p class="news-title">' + data[i].name + '</p>' +
                                    '<p class="news-content">' + data[i].content + "</p>"+
                                    '<p class="news-pubdate"><span class="news-source">' + data[i].source + '</span>' +
                                    '<span class="news-source">' + dateStr + '</span>' +
                                    '<span class="news-source">点击量:' + data[i].click + '</span>' +
                                    '<a class="news-source" href="/news/detail?id=' + data[i].id + '">[详情]</a>' +
                                    '<span style="float: right;" class="btn btn-default"><i class="glyphicon glyphicon-thumbs-up"></i></span>' +
                                    '</p></div></li>');
                                }
                            }
                        })
                    </script>
                </div>
            </div>
        </div>
        <div class="body-right">
            <div class="last-menu">
                <ul class="nav nav-tabs">
                    <li class="active"><a href="#">最新新闻</a></li>
                </ul>
                <div class="last-menu-content">
                    <div class="last-menu-content-name"><label id="last-news-name" style="margin-left: 10px;"></label></div>
                    <div class="last-menu-img">
                        <img id="last-news-img" src="" alt="" style="width: 150px;height:150px;">
                    </div>
                    <div class="last-menu-info">
                        <p id="last-news-content"></p>
                        <p id="last-news-detail"></p>
                    </div>
                </div>
                <script>
                    $.ajax({
                        url:"${path}/news/lastNews",
                        type:"post",
                        success:function (data) {
                            $("#last-news-name").text(data.name);
                            $("#last-news-img").attr("src",data.picturePath);
                            $("#last-news-content").text(data.content);
                            $("#last-news-detail").append('<a href="${path}/news/detail?id=' + data.id + '">[详细]</a>');
                        }
                    })
                </script>
            </div>
            <div class="recent-news">
                <ul class="nav nav-tabs">
                    <li class="active"><a href="#">最近新闻</a></li>
                </ul>
                <br>
                <div style="height: 100px;margin-top: 2px;">
                    <a href="" id="recent-news-detail">
                        <span id="recent-news-img"></span>
                        <p style="float: right;width:  280px;height: 100px;">
                            <label class="special" style="width: 280px;line-height: 20px;" id="recent-news-name"></label>
                            <label class="text" style="width: 280px;line-height: 18px;height: 72px;" id="recent-news-content"></label>
                        </p>
                    </a>
                </div>
                <br>
                <ul class="recent-news-content"></ul>
            </div>
            <script>
                $.ajax({
                    url:"${path}/news/recentNews",
                    type:"post",
                    success:function (data) {
                        for(var i=0;i<data.length;i++){
                            if (i==2){
                                $("#recent-news-detail").attr("href","/news/detail?id=" + data[i].id);
                                $("#recent-news-img").append('<img src="' + data[i].picturePath + '" style="width: 150px;height: 100px;float: left;">');
                                $("#recent-news-name").text(data[i].name);
                                $("#recent-news-content").text(data[i].content);
                            }else{
                                $(".recent-news-content").append('<li><a href="/news/detail?id=' + data[i].id + '">' + data[i].name + '</a></li>');
                            }
                        }
                    }
                })
            </script>
            <div class="news-rank">
                <ul class="nav nav-tabs">
                    <li class="active"><a href="#">热门新闻</a></li>
                </ul>
                <div class="news-rank-menu">
                    <ol class="news-rank-list"></ol>
                    <script>
                        $.ajax({
                            url:"${path}/news/clickRank",
                            type:"post",
                            success:function (data) {
                                for(var i=0;i<data.length;i++){
                                    $(".news-rank-list").append('<li><a href="/news/detail?id=' + data[i].id + '"><span style="margin-right: 15px;">'+
                                    '0' + (i+1) + '</span><span>' + data[i].name + '</span></a></li>');
                                }
                            }
                        })
                    </script>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="${path}/jsp/common/footer.jsp"></jsp:include>
</body>
</html>