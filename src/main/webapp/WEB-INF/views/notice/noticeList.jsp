<%--
  Created by IntelliJ IDEA.
  User: jenny
  Date: 2020-06-17
  Time: 오후 3:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>정보마당</title>
    <link rel="stylesheet" href="/css/notice/noticelist.css">
    <link rel="stylesheet" href="/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="/css/sidenavbar.css">
    <%--    <script src="/js/bootstrap.js"/>--%>

</head>
<body>

<div class="menubar">
    <%@include file="/WEB-INF/views/navbar.jsp" %>
</div>

<section class="description_intro">
    <div class="YL">
        <div class="description_intro_auto">
            <%--    <div class="container">--%>
            <nav class="side_nav" img src="/image/introImages/side_navbar.png">
                <h2 class="side_nav_img">
                    <p>고객지원</p>
                </h2>
                <ul class="nav_ul">
                    <li class="nav_li" onclick="location.href='/notice/noticeList'">
                        공지사항
                    </li>
                    <li class="nav_li" onclick="location.href='/board/boardlist'">
                        정보마당
                    </li>
                    <li class="nav_li" onclick="location.href='/mail/feedback'">
                        문의사항
                    </li>
                </ul>
            </nav>

                <div class="board-section">
                    <div style="text-align: right; padding-bottom: 3px;">
                    총 게시글 수 : ${pagination.listCnt }
                </div>
                <form id="Board">
                    <table class="table table-hover">
                        <tr class="mainlist">
                            <td id="noticeid">번호</td>
                            <td id="title">제목</td>
                            <td id="writer">작성자</td>
                            <td id="date">날짜</td>
                            <td id="count">조회수</td>
                        </tr>

                        <c:forEach var="dto" items="${notice}" varStatus="status">
                            <tr class="noticelist">
                                <td>${status.index+1+(pagination.curPage-1)*15}</td>

                                <td class="listTitle"
                                    onclick="location.href='/notice/noticeview?NoticeId=${dto.noticeId}';">${dto.n_Title}</td>

                                <td>${dto.n_Writer}</td>
                                <td>${dto.n_Date}</td>
                                <td>${dto.n_Count}</td>
                            </tr>
                        </c:forEach>
                    </table>

                    <div class="wrapper">
                        <ul class="pager">
                            <c:if test="${pagination.curPage ne 1}">
                                <li class="pager__item pager__item--prev"><a class="pager__link" href="#"
                                                                             onClick="fn_paging('${pagination.prevPage }')">
                                    <<</a></li>
                            </c:if>
                            <c:forEach var="pageNum" begin="${pagination.startPage }" end="${pagination.endPage }">
                                <c:choose>
                                    <c:when test="${pageNum eq  pagination.curPage}">
                                        <li class="pager__item active"><a class="pager__link" href="#"
                                                                          onClick="fn_paging('${pageNum }')">${pageNum }</a>
                                        </li>
                                    </c:when>
                                    <c:otherwise>
                                        <li class="pager__item"><a class="pager__link" href="#"
                                                                   onClick="fn_paging('${pageNum }')">${pageNum }</a>
                                        </li>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                            <c:if test="${pagination.curPage ne pagination.pageCnt && pagination.pageCnt > 0}">
                                <li class="pager__item pager__item--next"><a class="pager__link" href="#"
                                                                             onClick="fn_paging('${pagination.nextPage }')">
                                    >></a></li>
                            </c:if>
                        </ul>
                    </div>

                </form>
            </div>
        </div>
    </div>
</section>
<footer>
    <jsp:include page="../footer.jsp"/>
</footer>
<%--<script>--%>
<%--    function fn_paging(curPage) {--%>
<%--        location.href = "/notice/noticeList?curPage=" + curPage;--%>
<%--    }--%>

<%--    $(function () {--%>
<%--        $('#write_btn').click(function () {--%>

<%--            var password = prompt("비밀번호를 입력해주세요")--%>

<%--            if (password == 'admin') {--%>
<%--                location.href = '/notice/notice_write';--%>
<%--            } else {--%>
<%--                alert("권한이 없습니다.")--%>
<%--            }--%>
<%--        })--%>
<%--    })--%>

<%--</script>--%>
</body>
</html>