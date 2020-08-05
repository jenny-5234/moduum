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
    <link rel="stylesheet" href="/css/testhome.css">
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
        <section class="sub_top_container">
            <div class="map_box">
                <div id="map" style="width:100%;height:710px;position:relative;overflow:hidden;"></div>
                <script type="text/javascript" src="../../js/kakao/kakao_api_homepolygon.js"></script>
            </div>

            <div class="info_graph_box">
                <div class="mapinfo_box">
                    <h4>지역별 지역화폐</h4>
                    <hr>
                    <div class="sub_mapinfo">
                        <div class="sub_menuinfo_top">
                            <div class="sub_menuinfo_logo">
                                <img class="logo_image"
                                     src="/image/logoImage/경기도.png">
                            </div>
                            <div class="sub_menuinfo_text">
                                <div class="sub_info">
                                    <div class="yahoo1">
                                        <div class="info_title">발행 주체</div>
                                    </div>
                                    <div class="yahoo2">
                                        <div class="info_info1"></div>
                                    </div>
                                </div>
                                <div class="sub_info">
                                    <div class="yahoo1">
                                        <div class="info_title">사용처</div>
                                    </div>
                                    <div class="yahoo2">
                                        <div class="info_info2"></div>
                                    </div>
                                </div>
                                <div class="sub_info">
                                    <div class="yahoo1">
                                        <div class="info_title">제한업소</div>
                                    </div>
                                    <div class="yahoo2">
                                        <div class="info_info3"></div>
                                    </div>
                                </div>
                                <div class="sub_info">
                                    <div class="yahoo1">
                                        <div class="info_title">고객센터</div>
                                    </div>
                                    <div class="yahoo2">
                                        <div class="info_info4"></div>
                                    </div>
                                </div>

                            </div>
                        </div>

                        <div class="sub_menuinfo_bottom">
                            <div class="sub_menuinfo_btn">
                                <a class="homepage_button" id="home_Btn" href="#">
                                    <%--                                   onclick="location.href='/map/mapsearch'">--%>
                                    <%--                                    <img src="/image/homeImages/home.png" style="width: 10%; height: auto; ">--%>
                                    <%--                                    <span>홈페이지</span>--%>
                                    <div style="">
                                        <div class="younglot_1">
                                            <img src="/image/homeImages/home.png" style="width: 23%; height: auto;">
                                        </div>
                                        <div class="younglot_2">
                                            <span>홈페이지</span>
                                        </div>
                                    </div>
                                </a>

                                <a class="map_button" id="map_Btn" href="map/mapsearch">
                                    <div style="">
                                        <div class="younglot_1">
                                            <img src="/image/homeImages/address.png" style="width: 23%; height: auto;">
                                        </div>
                                        <div class="younglot_2">
                                            <span> 가맹점 찾기</span>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="graph_box">
                    <h4>현황 그래프</h4>
                    <hr>
                    <img src="/image/homeImages/testgraph1.png"/>
                </div>
            </div>

        </section>

        <section class="sub_bottom_box">
            <div class="news_video_container">
                <div class="banner_box">
                    <div class="banner_view">
                        <jsp:include page="banner.jsp"/>
                    </div>
                </div>

                <div class="news_box">
                    <div class="news_list">
                        <h4 class="tit1">최신 뉴스</h4>
                        <hr>
                        <ul class="m_text_list">
                            <c:forEach var="dto" items="${newstop5}" varStatus="status">
                                <li><a href="${dto.originallink}" target="_blank"
                                       class="news_top5_hyper">${dto.title}</a></li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>

                <div class="video_box">
                    <div class="video_view">
                        <jsp:include page="popup.jsp"/>
                    </div>
                </div>
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
