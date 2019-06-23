<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: Heali
  Date: 2019/6/17
  Time: 16:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>闲看新闻</title>
    <jsp:include page="${path}/jsp/common/resources.jsp"></jsp:include>
    <link rel="stylesheet" href="${path}/static/webfront/detail.css">
</head>
<body>
    <jsp:include page="${path}/jsp/common/frontHeader.jsp"></jsp:include>
    <div class="body">
        <div class="news-title">
            <h2>${news.name}</h2>
        </div>
        <div class="news-source">
            <p>
                <span>
                    <fmt:formatDate value="${news.pubdate}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate>
                </span>
                <span>来源：${news.source}</span>
                <span>类别：${news.type.name}</span>
                <span>点击：${news.click}</span>
            </p>
        </div>
        <div class="news-picture">
            <img style="width: 700px;height: 400px;" src="${news.picturePath}" alt="">
        </div>
        <div class="news-content">
            <p>${news.content}</p>
        </div>
        <div class="news-author">
            <label style="float: right;">记者：${news.author}</label>
        </div>
        <div class="news-keyword" id="keyword"></div>
        <form action="${path}/comment/addComment" method="post">
            <div class="write-comment">
                <div class="comment-count">
                    <input type="hidden" name="userId" value="${sessionScope.user.id}">
                    <input type="hidden" name="newsId" value="${news.id}">
                    <span class="pull-left">我有话说......</span>
                    <span class="pull-right">已有<span id="comment-count">1</span>条评论</span>
                </div>
                <div class="input-comment">
                    <textarea cols="30" name="content" rows="4" class="comment-content" placeholder="请输入您的评论"></textarea>
                </div>
                <div class="comment-btn">
                    <span style="float: left;line-height: 34px;color: #555;">网友评论仅供其表达个人看法，并不表明闲看立场。...</span>
                    <span id="button"></span>
                </div>
            </div>
        </form>
        <div class="comment-list">
            <div class="comment-list-header"><span>评论列表</span></div>
            <ul class="all-comment" id="comment-list">
                <script>
                    $(function () {
                        $.ajax({
                            url:"${path}/comment/selectCommentByNid",
                            type:"post",
                            data:{id:${news.id}},
                            dataType:"json",
                            success:function (data) {
                                if(data.length==0){
                                    $("#comment-count").text("0");
                                    $("#comment-list").append('<h5>没有任何评论........</h5>');
                                }else{
                                    $("#comment-count").text(data.length);
                                    for(var i=0;i<data.length;i++){
                                        var date = new Date(data[i].comdate);
                                        var year = date.getFullYear();
                                        var month = (date.getMonth() + 1)>9?(date.getMonth() + 1):"0"+(date.getMonth()+1);
                                        var day = date.getDate()>9?date.getDate():"0"+date.getDate();
                                        var hour = date.getHours()>9?date.getHours():"0"+date.getHours();
                                        var minute = date.getMinutes()>9?date.getMinutes():"0"+date.getMinutes();
                                        var second = date.getSeconds()>9?date.getSeconds():"0"+date.getSeconds();
                                        var text = year + "-" + month + "-" + day + " " + hour + ":" + minute + ":" + second;
                                        var li = '<li><div class="user-img"><img src="' + data[i].user.headPortrait + '" alt="">';
                                        li += '</div><div class="comment-info"><div>' + data[i].user.nickname + '</div>';
                                        li += '<div>' + data[i].content + '</div><div>' + text + '</div></div></li>';
                                        $("#comment-list").append(li);
                                    }
                                }
                            }
                        })
                    })
                </script>
            </ul>
        </div>
    </div>
    <jsp:include page="${path}/jsp/common/footer.jsp"></jsp:include>
</body>
</html>
<script>
    //截取关键字
    var keyword = "${news.keyword}";
    for(var i=0;i<keyword.split("、").length;i++){
        $(".news-keyword").append('<button  class="keyword-btn">' + keyword.split("、")[i] + '</button >');
    }
    //发布评论时判断用户是否登录
    var username = "${sessionScope.user.username}";
    if(username == "" || username == null){
        $("#button").append('<a href="${path}/jsp/login.jsp" class="btn btn-success pub-comment">登录发布评论</a>');
    }else{
        $("#button").append('<button  type="submit" class="btn btn-success pub-comment">发布评论</button >');
    }
</script>