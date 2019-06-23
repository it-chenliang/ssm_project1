<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: Heali
  Date: 2019/6/19
  Time: 10:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${path}/static/webfront/typeInfo.css">
    <jsp:include page="${path}/jsp/common/resources.jsp"></jsp:include>
    <script src="${path}/static/js/jquery-3.3.1.js"></script>
    <style>
        .body a{
            text-decoration: none;
            color: #222;
            out-line: none;
        }
    </style>
</head>
<body>
<jsp:include page="${path}/jsp/common/frontHeader.jsp"></jsp:include>
<div class="body">
    <div class="news-info">
        <ul class="news-list">
            <c:forEach items="${pageInfo.list}" var="obj">
                <li>
                    <a href="${path}/news/detail?id=${obj.id}">
                        <div>
                            <img src="${obj.picturePath}" alt="">
                        </div>
                        <div>
                            <div class="news-name">
                                ${obj.name}
                            </div>
                            <div class="news-content">
                            <span>${obj.content}</span>
                            </div>
                            <div class="news-pubdate">
                                <span><fmt:formatDate value="${obj.pubdate}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></span>
                                <span class="typeId" index="${obj.typeId}" style="display: none;"></span>
                            </div>
                        </div>
                    </a>
                </li>
            </c:forEach>
        </ul>
    </div>
    <div class="page btn-group">
        <div>
            <c:if test="${pageInfo.isFirstPage == true}">
                <a class="firstPage btn btn-default">首页</a>
            </c:if>
            <c:if test="${pageInfo.hasPreviousPage}">
                <a class="prePage btn btn-default">上一页</a>
            </c:if>
            <c:if test="${pageInfo.hasNextPage}">
                <a class="nextPage btn btn-default">下一页</a>
            </c:if>
            <c:if test="${pageInfo.isLastPage == false}">
                <a class="lastPage btn btn-default">尾页</a>
            </c:if>
        </div>
    </div>
</div>
</body>
</html>
<script>
    $(function(){
        $(".firstPage").attr("href","${path}/news/typeInfo?typeId=" + $(".typeId").attr("index") + "&&pageNo=${pageInfo.firstPage}");
        $(".prePage").attr("href","${path}/news/typeInfo?typeId=" + $(".typeId").attr("index") + "&&pageNo=${pageInfo.pageNum-1}");
        $(".nextPage").attr("href","${path}/news/typeInfo?typeId=" + $(".typeId").attr("index") + "&&pageNo=${pageInfo.pageNum+1}");
        $(".lastPage").attr("href","${path}/news/typeInfo?typeId=" + $(".typeId").attr("index") + "&&pageNo=${pageInfo.lastPage}");
    })
</script>
