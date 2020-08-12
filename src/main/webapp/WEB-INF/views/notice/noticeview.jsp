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
    <link rel="stylesheet" href="/css/notice/noticeview.css"/>
    <link rel="stylesheet" href="/css/bootstrap.css">

    <title>Title</title>

</head>
<body>
<div class="menubar">
    <%@include file="/WEB-INF/views/navbar.jsp" %>
</div>


<div class="container">
    <div class="box-header">
        <h4 >상세보기</h4>
        <hr>
    </div>
    <form name="viewForm" method="post" enctype="multipart/form-data">
        <table class="view">
            <tr>
                <td class="label">글 번호</td>
                <td class="form-control" style="display: table-cell;"> ${noticeDto.noticeId} </td>
                <input type="hidden" name="NoticeId" id="NoticeId" value="${noticeDto.noticeId}"/>
            </tr>
            <tr>
                <td class="label">작성일자</td>
                <td class="form-control" style="display: table-cell;"><fmt:formatDate value="${noticeDto.n_Date}" pattern="yyyy-MM-dd"/></td>
            </tr>
            <tr>
                <td class="label">조회수</td>
                <td class="form-control" style="display: table-cell;"> ${noticeDto.n_Count} </td>
            </tr>
            <tr>
                <td class="label">작성자</td>
                <td class="form-control" style="display: table-cell;"> ${noticeDto.n_Writer} </td>
            </tr>
            <tr>
                <td class="label">제목</td>
                <td class="form-control" style="display: table-cell;"> ${noticeDto.n_Title}</td>
            </tr>
        </table>
    </form>
    <div class="textbox">
        ${noticeDto.n_Context}
    </div>

    <div class="buttons">
        <button type="button" class="list_Btn" name="curPage" onclick="location.href='/notice/noticeList?curPage=1'">목록</button>
        <%
            String admin = (String) session.getAttribute("adminid");
            if (admin != null) {
        %>
        <button type="button" class="list_Btn" id="d_btn">삭제</button>
        <button type="button" class="list_Btn" id="m_btn">수정</button>
        <%}%>
    </div>
</div>

<footer>
    <jsp:include page="../footer.jsp"/>
</footer>

</body>
<script>
    $(function () {
        $('#d_btn').click(function () {

            <%
                if (admin != null) {
            %>
            if (confirm("삭제하시겠습니까?") == true) {
                location.href = '/notice/delete.do?noticeId=${noticeDto.noticeId}';
            }
            <%}%>
        });
    });

    $(function () {
        $('#m_btn').click(function () {
            <%
                if (admin != null) {
            %>
            if (confirm("수정하시겠습니까?") == true) {
                location.href = '/notice/modify?noticeId=${noticeDto.noticeId}';
            }
            <%}%>
        });
    });
</script>
</html>
