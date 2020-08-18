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
    <title>정보마당 상세보기 | 모둠전</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link rel="stylesheet" href="/css/board/pageview.css">
    <link rel="stylesheet" href="/css/bootstrap.css">

</head>
<body>
<%
    String strReferer = request.getHeader("referer");

    if(strReferer == null){
%>
<script language="javascript">
    alert("정상적인 경로를 통해 다시 접근해 주십시오.");
    document.location.href="return jsp or URL";
</script>
<%
        return;
    }
%>
<div class="menubar">
    <%@include file="/WEB-INF/views/navbar.jsp" %>
</div>


<div class="container">
    <div class="box-header">
        <h4>상세보기</h4>
        <hr>
    </div>


    <form name="viewForm" method="post" enctype="multipart/form-data">
        <table class="view">
            <tr>
                <td class="label">글 번호</td>
                <td class="form-control" style="display: table-cell;"> ${boardDto.boardId} </td>
                <input type="hidden" name="BoardId" id="BoardId" value="${boardDto.boardId}"/>
            </tr>
            <tr>
                <td class="label">작성일자</td>
                <td class="form-control" style="display: table-cell;"><fmt:formatDate value="${boardDto.b_Date}"
                                                                                      pattern="yyyy-MM-dd"/></td>
            </tr>
            <tr>
                <td class="label">조회수</td>
                <td class="form-control" style="display: table-cell;"> ${boardDto.b_Count} </td>
            </tr>
            <tr>
                <td class="label">작성자</td>
                <td class="form-control" style="display: table-cell;"> ${boardDto.b_Writer} </td>
            </tr>
            <tr>
                <td class="label">제목</td>
                <td class="form-control" style="display: table-cell;"> ${boardDto.b_Title}</td>
            </tr>
        </table>
    </form>
    <div class="textbox">
        ${boardDto.b_Context}
    </div>
    <div class="buttons">
        <button type="button" class="page_btn" name="curPage" onclick="location.href='/board/boardlist?curPage=1'">목록
        </button>
        <button type="button" class="page_btn" id="d_btn">삭제</button>
        <button type="button" class="page_btn" id="m_btn">수정</button>
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
                String admin = (String) session.getAttribute("adminid");
                if (admin != null) {
            %>
                    if (confirm("삭제하시겠습니까?") == true) {
                        location.href = '/board/delete.do?boardId=${boardDto.boardId}';
                    } else {

                    }
                <%} else {%>
                    var password = prompt("비밀번호");
                    if (password == "${boardDto.b_Password}") {
                        <%--location.href = '/board/delete.do?boardId=${boardDto.boardId}';--%>
                        sendPost()
                    } else if (password == null) {}
                    else {
                        alert("비밀번호가 올바르지 않습니다.");
                    }
                <%}%>
        });
    });

    $(function () {
        $('#m_btn').click(function () {
            var password = prompt("비밀번호")

            if (password == "${boardDto.b_Password}") {
                location.href = '/board/modify?boardId=${boardDto.boardId}';
            } else if (password == null) {}
            else {
                alert("비밀번호가 올바르지 않습니다.");
            }
        });
    });

    function sendPost() {
        var form = document.createElement('form');
        form.setAttribute('method', 'post');
        form.setAttribute('action', '/board/delete.do?boardId=${boardDto.boardId}');
        document.body.appendChild(form);
        form.submit();
    }
</script>
</html>
