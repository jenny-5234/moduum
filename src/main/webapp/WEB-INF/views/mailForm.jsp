<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form"  uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>Kakao 지도 시작하기</title>
    <%-- 반응형 웹 --%>
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link rel="stylesheet" href="/css/testhome.css">
</head>
<body>
<div class="nav_container">
    <div class="menubar">
        <%@include file="navbar.jsp" %>
    </div>
</div>
<div class="container">
    <h4>메일 보내기</h4>
    <form action="/mailSender" method="post">
        <div align="center"><!-- 제목 -->
            <input type="text" name="title" size="120" style="width:100%" placeholder="제목을 입력해주세요" class="form-control" >
        </div>
        <p>
        <div align="center"><!-- 내용 -->
            <textarea name="content" cols="120" rows="12" style="width:100%; resize:none" placeholder="내용#" class="form-control"></textarea>
        </div>
        <p>
        <div align="center">
            <input type="submit" value="메일 보내기" class="btn btn-warning">
        </div>
    </form>
</div>
</body>
</html>
