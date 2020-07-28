<%--
  Created by IntelliJ IDEA.
  User: jenny
  Date: 2020-06-17
  Time: 오후 4:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Title</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <link rel="stylesheet" href="/css/board/pageview.css" >
    <link rel="stylesheet" href="/css/bootstrap.css">

</head>
<body>

<div class="menubar">
    <%@include file="/WEB-INF/views/navbar.jsp" %>
</div>



<div class="container">
    <div class="box-header">
        <h3 class="box-title">상세보기</h3>
    </div>
    <hr class="hr">

    <form name="viewForm" method="post" enctype="multipart/form-data">
        <table class="view">
            <tr>
                <td class="label">글 번호</td>
                <td class="form-control"> ${boardDto.boardId} </td>
                <input type="hidden" name="BoardId" id="BoardId" value="${boardDto.boardId}"/>
            </tr>
            <tr>
                <td class="label">작성일자</td>
                <td class="form-control"><fmt:formatDate value="${boardDto.b_Date}" pattern="yyyy-MM-dd"/></td>
            </tr>
            <tr>
                <td class="label">조회수</td>
                <td class="form-control"> ${boardDto.b_Count} </td>
            </tr>
            <tr>
                <td class="label">작성자</td>
                <td class="form-control"> ${boardDto.b_Writer} </td>
            </tr>
            <tr>
                <td class="label">제목</td>
                <td class="form-control"> ${boardDto.b_Title}</td>
            </tr>
        </table>
    </form>
    <div class="textbox">
        ${boardDto.b_Context}
    </div>
    <div class="buttons">
        <button type="button" name="curPage" onclick="location.href='/board/boardlist?curPage=1'">목록</button>
        <button type="button" id="d_btn">삭제</button>
        <button type="button" id="m_btn">수정</button>
    </div>
</div>

<script>
    $(function () {
        $('#d_btn').click(function () {
            var password = prompt("비밀번호")

            if (password == ${boardDto.b_Password}) {
                location.href = '/board/delete.do?boardId=${boardDto.boardId}'
            } else {
                alert("다시 입력해주세요")
            }
        })
    })

    $(function () {
        $('#m_btn').click(function () {
            var password = prompt("비밀번호")

            if (password == ${boardDto.b_Password}) {
                location.href = '/board/modify?boardId=${boardDto.boardId}'
            } else {
                alert("다시 입력해주세요")
            }
        })
    })
</script>
</body>
</html>
