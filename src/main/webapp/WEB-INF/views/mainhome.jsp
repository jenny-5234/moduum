<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: BIT
  Date: 2020-07-29
  Time: 오전 10:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8"/>

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script type="text/javascript"
            src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4f389b62ab24856e4ae992dfc8a85562&libraries=services,clusterer"></script>
    <link rel="stylesheet" href="/css/mainhome.css">
    <link rel="stylesheet" type="text/css" href="../../css/kakao/kakao_api_polygon.css">
    <title>지역화폐 모둠전</title>

</head>
<body>
<div class="nav_container">
    <div class="menubar">
        <%@include file="navbar.jsp" %>
    </div>
</div>

<section class="container">
    <div class="sub_container">

        <section class="sub_left_container">
            <div>
                <div class="graph_box">
                    <h4>현황 그래프</h4>
                    <hr>
                    <img src="/image/homeImages/testgraph1.png"/>
                </div>
                <div class="banner_box">
                    <h4>배너</h4>
                    <hr>
                    <div class="banner_view">
                        <jsp:include page="banner.jsp"/>
                    </div>
                </div>
            </div>
        </section>

        <section class="sub_right_container">
            <div>
                <section class="map_container">
                    <div>
                        <div class="map_box">
                            <h4>지도 검색</h4>
                            <hr>
                            <div id="map" style="width:100%;height:580px;position:relative;overflow:hidden;"></div>
                            <script type="text/javascript" src="../../js/kakao/hompage_kakao_map.js"></script>
                        </div>
                        <div class="mapinfo_box">
                            <h4>지역화폐</h4>
                            <hr>
                            <div class="sub_mapinfo">

                                <div class="sub_menuinfo_logo">
                                    <img class="logo_image"
                                         src="/image/introImages/gyunggi1-1.png">
                                </div>
                                <div class="sub_menuinfo_text">
                                    <ul>
                                        <%--                                <li> 로고이미지</li>--%>
                                        <li>할인율, 공제율</li>
                                        <%--                                <li>시군별 종류</li>--%>
                                        <li>홈페이지 바로가기</li>
                                        <li>가맹점 찾기</li>
                                    </ul>
                                </div>
                                <div class="sub_menuinfo_btn">
                                    <button id="hompage_button"
                                            onclick="location.href='/map/mapsearch'">가맹점 찾기
                                    </button>

                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>

                <section class="news_video_container">
                    <div>
                        <div class="news_box">
                            <h4>뉴스</h4>
                            <hr>
                            <div class="news_list">
                                <h4 class="tit1">최신 브리핑</h4>
                                <ul class="m_text_list">
                                    <c:forEach var="dto" items="${newstop5}" varStatus="status">
                                        <li><a href="${dto.originallink}" target="_blank"
                                               class="news_top5_hyper">${dto.title}</a></li>
                                    </c:forEach>
                                </ul>
                            </div>
                        </div>
                        <div class="video_box">
                            <h4>홍보 동영상</h4>
                            <hr>
                            <div class="video_view">
                                <jsp:include page="popup.jsp"/>
                            </div>
                        </div>
                    </div>
                </section>

            </div>
        </section>
    </div>
</section>

<footer>
    <div class="foo_div1">
        <span>모둠전</span> <span>|</span>
        <span>대표 : 영웅다영</span> <span>|</span>
        <p>주소 : 비트교육센터</p>
    </div>
</footer>

</body>
</html>
