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
    <link rel="stylesheet" href="/css/home.css">
    <link rel="stylesheet" href="/css/tptp.css">
    <link rel="stylesheet" type="text/css" href="../../css/kakao/kakao_api_polygon.css">

    <%--    구글차트 라이브러리--%>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
        google.charts.load('current',{'packages':['corechart','bar','line']});
        google.charts.setOnLoadCallback(drawpiechart);
        google.charts.setOnLoadCallback(drawlinechart);

        // 사용량, 충전량 예측 및 분석(선그래프)
        function drawlinechart(){
            var data = google.visualization.arrayToDataTable([
                ['날짜', '사용량', '충전량'],
                <c:forEach items="${chart}" var="chart" varStatus="status">
                ['${chart.date}', ${chart.spend}, ${chart.charge}]
                <c:if test="${not st.last}">,
                </c:if>
                </c:forEach>
            ]);

            var date_format = new google.visualization.DateFormat('yyyy-MM');
            date_format.format(data, 0);

            var options = {
                title: '지역화폐 사용량 및 충전량',
                pointSize: 0,
                backgroundColor: 'white',
                chartArea: {width: '65%', height: '60%'},
                animation: {startup: true, duration: 1000, easing: 'in'},   // 그래프 에니메이션
                titleTextStyle:{
                    color: "black",
                    fontSize: 15
                },
                series:{    // 선 색상
                    0:{
                        color: '#ffa303'
                    },
                    1:{
                        color: '#5e6eff'
                    }
                },
                vAxis:{ // 세로
                    title: "사용량(1,000원단위)",
                    titleTextStyle: {color:"#8C8C8C", fontSize:10},
                    textStyle:{
                        fontSize: 9,
                        color: "#8C8C8C"
                    },
                    gridlines:{ // 중간선
                        color: "#F6F6F6"
                    },
                    baselineColor:"black" // 하단선
                },
                hAxis: { // 가로
                    format:"yyyy-MM",
                    textStyle:{
                        fontSize: 9,
                        color: "#8C8C8C"
                    },
                    gridlines:{ // 중간선
                        color: "#F6F6F6"
                    },
                    baselineColor:"black"
                },
                legend:{    // 항목(범례)
                    textStyle:{
                        fontSize: 9,
                        color: "#8C8C8C"
                    }
                }

            };

            var chart = new google.visualization.LineChart(document.getElementById('lineChart'));

            chart.draw(data, options);
            window.addEventListener('resize',drawlinechart,false);
        }

        // 모든 성별 사용패턴 분석(파이차트)
        function drawpiechart(){
            var data = google.visualization.arrayToDataTable([
                ['사용패턴', '총사용량'],
                <c:forEach items="${chart3}" var="chart3" varStatus="status">
                ['${chart3.category}', ${chart3.spend}]
                <c:if test="${not st.last}">,
                </c:if>
                </c:forEach>
            ]);

            var options = {
                title: '지역화폐 사용패턴',
                titleTextStyle:{
                    color: "black",
                    fontSize: 15
                },
                chartArea: {right: 0, left: 0, width: '70%', height:'70%'}
            };

            var chart4 = new google.visualization.PieChart(document.getElementById('piechart'));

            chart4.draw(data, options);
            window.addEventListener('resize',drawpiechart,false);
        }

    </script>


    <title>지역화폐 모둠전</title>

</head>
<body>
<div class="nav_container">
    <div class="menubar">
        <jsp:include page="navbar.jsp" />
    </div>
    <div class="sidenavbar">
        <jsp:include page="sidebar.jsp" />
    </div>
</div>

<section class="container">
    <div class="sub_container">
        <section class="sub_top_container">
            <div class="map_box">
                <div id="map" ></div>
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
                                <a class="homepage_button" id="home_Btn" href="#" target="_blank">
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
                    <div class="chart_box_div">
                        <div class="chart_div">
                            <div id="lineChart"></div>
                        </div>
                        <div class="chart_div">
                            <div id="piechart"></div>
                        </div>
                    </div>
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
                            <a href="/news/newslist" class="more">더보기</a>
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
<div id="chat">
    <script>
        function showchat() {
            var xPos = (document.body.offsetWidth) - 655;
            var yPos = (document.body.offsetHeight) - 1200;
            window.open("chat","실시간채팅창", "width=555, height=660, left="+xPos+", top="+yPos);
        }
    </script>
    <button type="button" class="chat_fixed" onclick="showchat()"/>
<%--        <img src="" class="idk"/>--%>
    </button>
</div>
<footer>
    <jsp:include page="footer.jsp"/>
</footer>

</body>
</html>
