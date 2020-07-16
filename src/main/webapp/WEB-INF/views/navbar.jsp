<!doctype html>
<html lang="ko">
<head>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <title>CSS Tips | Dropdown Menu</title>
    <link rel="stylesheet" href="/css/navbar.css">
</head>

<body>
<div class="Menu">
    <ul class="menu01">
        <li class="top-menu1" style="width: 20%; "><span><a href="../"><img src="/image/homeImages/modum-logo.png"
                                                                           style="width: 100%"></a></span>
            <ul class="dept01" style="width: 20%">
                <li><a class="sub-menu"> </a></li>
            </ul>
        </li>
        <li>
        <li class="top-menu" style="width: 16%"><span><a class="main-menu" href="/index.jsp">지역화폐란?</a></span>
            <ul class="dept01" style="width: 16%">
                <li><a class="sub-menu" href="/index.jsp">지역화폐 소개</a></li>
                <li><a class="sub-menu" href="/index.jsp">지역화폐 장점</a></li>
                <li><a class="sub-menu" href="/index.jsp">지역화폐 발급</a></li>
            </ul>
        </li>
        <li class="top-menu" style="width: 16%"><span><a class="main-menu">현황</a></span>
            <ul class="dept01" style="width: 16%">
                <li><a class="sub-menu" href="#">현황</a></li>
                <li><a class="sub-menu" href="#">분석 및 예측</a></li>
<%--                <li><a class="sub-menu" href="#">예측</a></li>--%>
            </ul>
        </li>
        <li class="top-menu" style="width: 16%"><span><a class="main-menu">가맹점 찾기</a></span>
            <ul class="dept01" style="width: 16%">
                <li><a href="../"> <img src="/image/homeImages/map01.png" class="mapImage"/></a></li>
            </ul>
        </li>
        <li class="top-menu" style="width: 16%"><span><a class="main-menu">뉴스 및 이슈</a></span>
            <ul class="dept01" style="width: 16%">
                <li><a class="sub-menu" href="/news/newslist">뉴스</a></li>
<%--                <li><a class="sub-menu" href="#">sub02</a></li>--%>
<%--                <li><a class="sub-menu" href="#">sub03</a></li>--%>
            </ul>
        </li>
        <li class="top-menu" style="width: 16%"><span><a class="main-menu" href="/notice/noticeList">고객지원</a></span>
            <ul class="dept01" style="width: 16%">
                <li><a class="sub-menu" href="/notice/noticeList">공지사항</a></li>
                <li><a class="sub-menu" href="/board/boardlist">정보마당</a></li>
                <li><a class="sub-menu" href="#">피드백</a></li>
            </ul>
        </li>
        </li>
    </ul>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="/js/navbar.js"></script>

</body>
</html>