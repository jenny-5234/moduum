<%--
  Created by IntelliJ IDEA.
  User: jenny
  Date: 2020-07-15
  Time: 오후 3:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <link rel="stylesheet" href="/css/bootstrap.css">
    <title>Title</title>
    <style>
        body{
            width: 90%;
            margin: 0 auto;
        }
        .container {
            margin: 0 auto;
            margin-top: 3%;
            margin-bottom: 3%;
            width: 70%;
            height: auto;
        }

        .box-header {
            margin: 10px;
        }

        .view {
            width: 100%;
        }


        .label {
            border-radius: 10px;
            background-color: rgba(153, 197, 243, 0.5);
            width: 20%;
            padding: 7px;
            font-weight: bolder;
        }

        .textbox {
            max-height: fit-content;
            height: 600px;
            overflow: auto;
            border: 1px solid lightgray;
        }

        .buttons {
            text-align: right;
            margin: 10px;
        }

        button {
            padding: 2px;
            font-size: 15px;
            background-color: white;
            color: black;
            border: 2px solid dodgerblue;
            transition-duration: 0.4s;
        }

        button:hover {
            background-color: dodgerblue;
            color: white;
        }

    </style>
</head>
<body>
<div class="menubar">
    <%@include file="/WEB-INF/views/navbar.jsp" %>
</div>


<div class="container">
    <div class="box-header">
        <h3 class="box-title">상세보기</h3>
    </div>
    <form name="viewForm" method="post" enctype="multipart/form-data">
        <table class="view">
            <tr>
                <td class="label">글 번호</td>
                <td class="form-control"> ${noticeDto.noticeId} </td>
                <input type="hidden" name="NoticeId" id="NoticeId" value="${noticeDto.noticeId}"/>
            </tr>
            <tr>
                <td class="label">작성일자</td>
                <td class="form-control"><fmt:formatDate value="${noticeDto.n_Date}" pattern="yyyy-MM-dd"/></td>
            </tr>
            <tr>
                <td class="label">조회수</td>
                <td class="form-control"> ${noticeDto.n_Count} </td>
            </tr>
            <tr>
                <td class="label">이름</td>
                <td class="form-control"> ${noticeDto.n_Writer} </td>
            </tr>
            <tr>
                <td class="label">제목</td>
                <td class="form-control"> ${noticeDto.n_Title}</td>
            </tr>
        </table>
    </form>
    <div class="textbox">
        ${noticeDto.n_Context}
    </div>

    <div class="buttons">
        <button type="button" name="curPage" onclick="location.href='/notice/noticeList?curPage=1'">목록</button>
    </div>
</div>

</body>
</html>
