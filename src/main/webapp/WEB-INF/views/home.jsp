<%--
  Created by IntelliJ IDEA.
  User: bit
  Date: 2020-05-29
  Time: 오전 9:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>홈페이지</title>
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script type="text/javascript"
            src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4f389b62ab24856e4ae992dfc8a85562&libraries=services,clusterer"></script>
    <link rel="stylesheet" href="/css/home.css">
</head>

<body>
<div class="nav_container">
    <div class="menubar">
        <%@include file="navbar.jsp" %>
    </div>
</div>
<div class="main_container">

    <div class="graphbox">
        <div class="box_top_name">
            <span>현황</span>
            <hr>
        </div>
        <div class="graph_insert">
            <img src="/image/homeImages/testgraph1.png"/>&nbsp;
        </div>
    </div>
    <div class="mapbox">
        <div class="box_top_name">
            <span>가맹점 위치</span>
            <hr>
        </div>
        <div class="box_insert">
            <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"
                 onclick="location.href='/map/mapsearch'"></div>
            <script type="text/javascript" src="../../js/kakao/hompage_kakao_map.js"></script>
        </div>
        <div class="map_button">
            <button id="button_effect" onclick="location.href='/map/mapsearch'">가맹점 찾기</button>
        </div>
    </div>
<%--    <div class="livechattinbox">--%>
<%--        <div class="box_top_name">--%>
<%--            <span>실시간 채팅</span>--%>
<%--            <hr>--%>
<%--        </div>--%>
<%--        <div class="chatting_box_insert">--%>
<%--&lt;%&ndash;            <jsp:include page="chatting.jsp"/>&ndash;%&gt;--%>
<%--        </div>--%>
<%--    </div>--%>
    <div class="bannerbox">
        <div class="box_top_name">
            <span>토탈 지역화폐</span>
            <hr>
        </div>
        <div class="box_insert">
            <%@include file="banner.jsp" %>
        </div>
    </div>
    <div class="newsbox">
        <div class="box_top_name">
            <span>뉴스 & 이슈
                <a href="/news/newslist" class="more">더보기</a>
            </span>
            <hr>
        </div>
        <div class="box_insert">
            <h4 class="tit1">최신 브리핑</h4>
            <ul class="m_text_list">
                <c:forEach var="dto" items="${newstop5}" varStatus="status">
                    <li><a href="${dto.originallink}" target="_blank" class="news_top5_hyper">${dto.title}</a></li>
                </c:forEach>
            </ul>
        </div>
    </div>
    <div class="videobox">
        <div class="box_top_name">
            <span>팝업존</span>
            <hr>
        </div>
        <div class="box_insert">
            <%--                <span>YouTube 팝업 삽입</span>--%>
            <jsp:include page="popup.jsp"/>
        </div>
    </div>
</div>
<footer>
    <div class="foo_div1">
        <span>모둠전</span> <span>|</span>
        <span>대표 : 영웅다영</span> <span>|</span>
        <p>주소 : 비트교육센터</p>
    </div>
</footer>

</body>
</html>
