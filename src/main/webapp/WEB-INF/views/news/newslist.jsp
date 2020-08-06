<%--
  Created by IntelliJ IDEA.
  User: bit
  Date: 2020-07-08
  Time: 오후 2:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>뉴스 및 이슈</title>
    <link rel="stylesheet" href="/css/bootstrap.css">
    <link rel="stylesheet" href="/css/news.css">
    <link rel="stylesheet" href="/css/sidenavbar.css">
</head>
<body>
<div class="menubar">
    <%@include file="/WEB-INF/views/navbar.jsp" %>
</div>

<section class="description_intro">
    <div class="YL">
        <div class="description_intro_auto">
            <nav class="side_nav" img src="/image/introImages/side_navbar.png">
                <h2 class="side_nav_img">
                    <p>뉴스 및 이슈</p>
                </h2>
            </nav>

            <div class="news-section">
                <h4 cladd="Dda1">최신뉴스</h4>
                <hr>
                <div style="text-align: left; padding-bottom: 3px;">
                    총 뉴스 수 : ${pagination.listCnt }
                </div>
                <form id="News">
                    <table class="table table-hover">
                        <tr class="mainlist">
                            <td id="newsId">번호</td>
                            <td id="title">제목</td>
                            <td id="date">날짜</td>
                        </tr>

                        <c:forEach var="dto" items="${news}" varStatus="status">
                            <tr class="newslist">
                                <td>${status.index+1+(pagination.curPage-1)*15}</td>

                                <td class="listTitle"
                                    onclick="window.open('${dto.originallink}');">${dto.title}</td>

            <%--                    <td>${dto.description}</td>--%>
            <%--                    <td>${dto.originallink}</td>--%>
                                <td>${dto.date}</td>
                            </tr>
                        </c:forEach>
                    </table>
                    <hr/>
                    <div class="wrapper">
                        <ul class="pager">
                            <c:if test="${pagination.curPage ne 1}">
                                <li class="pager__item pager__item--prev"><a class="pager__link" href="#" onClick="fn_paging('${pagination.prevPage }')">
                                    <<</a></li>
                            </c:if>
                            <c:forEach var="pageNum" begin="${pagination.startPage }" end="${pagination.endPage }">
                                <c:choose>
                                    <c:when test="${pageNum eq  pagination.curPage}">
                                        <li class="pager__item active"><a class="pager__link" href="#" onClick="fn_paging('${pageNum }')">${pageNum }</a></li>
                                    </c:when>
                                    <c:otherwise>
                                        <li class="pager__item"><a class="pager__link" href="#" onClick="fn_paging('${pageNum }')">${pageNum }</a></li>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                            <c:if test="${pagination.curPage ne pagination.pageCnt && pagination.pageCnt > 0}">
                                <li class="pager__item pager__item--next"><a class="pager__link" href="#" onClick="fn_paging('${pagination.nextPage }')">
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
<script>
    function fn_paging(curPage) {
        location.href = "/news/newslist?curPage=" + curPage;
    }
</script>
</body>
</html>
