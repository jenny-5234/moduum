<%--
  Created by IntelliJ IDEA.
  User: bit
  Date: 2020-07-20
  Time: 오후 2:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>--%>
<%--<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>--%>
<%--<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>--%>
<%--<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>--%>
<html>
<head>
    <title>muchinchart</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <!-- google chart script-->
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <%--    <script type="text/javascript" src="ajax-sample.js"></script>--%>
    <link rel="stylesheet" href="/css/chart.css">
    <link rel="stylesheet" type="text/css" href="/css/sidenavbar.css">
    <script type="text/javascript">
        google.charts.load('current', {'packages': ['corechart', 'bar', 'line']});
        google.setOnLoadCallback(drawlinechart);
        google.setOnLoadCallback(drawlinechart2);
        google.charts.setOnLoadCallback(drawcolumnchart);
        google.charts.setOnLoadCallback(drawpiechart);
        google.charts.setOnLoadCallback(drawpiechart2);
        google.charts.setOnLoadCallback(drawcolumnchart2);

        // 사용량, 충전량 예측 및 분석 (선그래프)
        function drawlinechart() {
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
                pointSize: 3,
                backgroundColor: 'white',
                chartArea: {width: '75%', height: '80%'},
                animation: {startup: true, duration: 1000, easing: 'in'},   // 그래프 에니메이션
                titleTextStyle: {
                    color: "black",
                    fontSize: 20
                },
                series: {    // 선 색상
                    0: {
                        color: '#FFBB00'
                    }
                },
                vAxis: { // 세로
                    title: "사용량(1,000원단위)",
                    titleTextStyle: {color: "#8C8C8C", fontSize: 10},
                    textStyle: {
                        fontSize: 12,
                        color: "#8C8C8C"
                    },
                    gridlines: { // 중간선
                        color: "#F6F6F6"
                    },
                    baselineColor: "black" // 하단선
                },
                hAxis: { // 가로
                    format: "yyyy-MM",
                    textStyle: {
                        fontSize: 12,
                        color: "#8C8C8C"
                    },
                    gridlines: { // 중간선
                        color: "#F6F6F6"
                    },
                    baselineColor: "black"
                },
                legend: {    // 항목(범례)
                    textStyle: {
                        fontSize: 11,
                        color: "#8C8C8C"
                    }
                }

            };

            var chart = new google.visualization.LineChart(document.getElementById('lineChart'));

            chart.draw(data, options);
            // window.addEventListener('resize', drawlinechart, false);
        }

        // 연령별 사용빈도 예측 및 분석 (선그래프)
        function drawlinechart2() {
            var data = google.visualization.arrayToDataTable([
                ['날짜', '10대', '20대', '30대', '40대', '50대'],
                <c:forEach items="${chart2}" var="chart2" varStatus="status">
                ['${chart2.date}', ${chart2.age_20}, ${chart2.age_30}, ${chart2.age_40}, ${chart2.age_50}, ${chart2.age_60}]
                <c:if test="${not st.last}">,
                </c:if>
                </c:forEach>
            ]);

            var date_format = new google.visualization.DateFormat('yyyy-MM');
            date_format.format(data, 0);

            var options = {
                title: '연령별 사용빈도',
                pointSize: 3,
                backgroundColor: 'white',
                chartArea: {width: '75%', height: '80%'},
                titleTextStyle: {
                    color: "black",
                    fontSize: 20
                },
                animation: {startup: true, duration: 1000, easing: 'in'},
                series: {    // 선 색상
                    0: {
                        color: '#FFBB00'
                    },
                    1: {
                        color: '#FF0000'
                    },
                    2: {
                        color: '#1DDB16'
                    },
                    3: {
                        color: '#0054FF'
                    },
                    4: {
                        color: '#5F00FF'
                    }
                },
                vAxis: { // 세로
                    title: "사용빈도",
                    titleTextStyle: {color: "#8C8C8C", fontSize: 10},
                    textStyle: {
                        fontSize: 12,
                        color: "#8C8C8C"
                    },
                    gridlines: { // 중간선
                        color: "#F6F6F6"
                    },
                    baselineColor: "black" // 하단선
                },
                hAxis: { // 가로
                    format: "yyyy-MM",
                    textStyle: {
                        fontSize: 12,
                        color: "#8C8C8C"
                    },
                    viewWindow: {min: 0, max: 10},
                    gridlines: { // 중간선
                        color: "#F6F6F6"
                    },
                    baselineColor: "black"
                },
                legend: {    // 항목(범례)
                    textStyle: {
                        fontSize: 11,
                        color: "#8C8C8C"
                    }
                }

            };

            var prevButton = document.getElementById('b4');
            var nextButton = document.getElementById('b5');
            var changeZoomButton = document.getElementById('b6');
            var MAX = 29;

            var chart = new google.visualization.LineChart(document.getElementById('lineChart2'));

            chart.draw(data, google.charts.Line.convertOptions(options));

            drawChart();

            function drawChart() {
                // 버튼 사용 이벤트
                prevButton.disabled = true;
                nextButton.disabled = true;
                changeZoomButton.disabled = true;

                // 버튼사용시 그래프의 변화
                google.visualization.events.addListener(chart, 'ready',
                    function () {
                        prevButton.disabled = options.hAxis.viewWindow.min <= 0;
                        nextButton.disabled = options.hAxis.viewWindow.max >= MAX;
                        changeZoomButton.disabled = false;
                    });
                chart.draw(data, options);
                // window.addEventListener('resize', drawlinechart2, false);
            }

            // 버튼 클릭시 칼럼이 3개씩 넘어감
            prevButton.onclick = function () {
                options.hAxis.viewWindow.min -= 6;
                options.hAxis.viewWindow.max -= 6;
                drawChart();
            }

            nextButton.onclick = function () {
                options.hAxis.viewWindow.min += 6;
                options.hAxis.viewWindow.max += 6;
                drawChart();
            }

            // 확대 및 축소 이벤트
            var zoomed = false;
            changeZoomButton.onclick = function () {
                if (zoomed) {
                    options.hAxis.viewWindow.min = 0;
                    options.hAxis.viewWindow.max = 10;
                } else {
                    options.hAxis.viewWindow.min = 0;
                    options.hAxis.viewWindow.max = MAX;
                }
                zoomed = !zoomed;
                drawChart();
            }
        }

        // 연령별 사용빈도 예측 및 분석 (막대그래프)
        function drawcolumnchart() {
            var data = google.visualization.arrayToDataTable([
                ['날짜', '10대', '20대', '30대', '40대', '50대'],
                <c:forEach items="${chart2}" var="chart2" varStatus="status">
                ['${chart2.date}', ${chart2.age_20}, ${chart2.age_30}, ${chart2.age_40}, ${chart2.age_50}, ${chart2.age_60}]
                <c:if test="${not st.last}">,
                </c:if>
                </c:forEach>
            ]);

            var date_format = new google.visualization.DateFormat('yyyy-MM');
            date_format.format(data, 0);

            var options = {
                title: '연령별 사용빈도',
                pointSize: 3,
                backgroundColor: 'white',
                chartArea: {width: '75%', height: '80%'},
                animation: {startup: true, duration: 1000, easing: 'in'},
                bar: {
                    groupWidth: '70%'
                },
                titleTextStyle: {
                    color: "black",
                    fontSize: 20
                },
                series: {    // 선 색상
                    0: {
                        color: '#FFBB00'
                    },
                    1: {
                        color: '#FF0000'
                    },
                    2: {
                        color: '#1DDB16'
                    },
                    3: {
                        color: '#0054FF'
                    },
                    4: {
                        color: '#5F00FF'
                    }
                },
                vAxis: { // 세로
                    title: "사용빈도",
                    titleTextStyle: {color: "#8C8C8C", fontSize: 10},
                    // viewWindow: {
                    //     min: 0,
                    //     max: 1800000
                    // },
                    textStyle: {
                        fontSize: 12,
                        color: "#8C8C8C"
                    },
                    gridlines: { // 중간선
                        color: "#F6F6F6"
                    },
                    baselineColor: "black" // 하단선
                },
                hAxis: { // 가로
                    format: "yyyy-MM",
                    textStyle: {
                        fontSize: 12,
                        color: "#8C8C8C"
                    },
                    gridlines: { // 중간선
                        color: "#F6F6F6"
                    },
                    baselineColor: "black",
                    viewWindow: {min: 0, max: 7}
                },
                legend: {    // 항목
                    textStyle: {
                        fontSize: 11,
                        color: "#8C8C8C"
                    }
                }

            };

            var prevButton = document.getElementById('b1');
            var nextButton = document.getElementById('b2');
            var changeZoomButton = document.getElementById('b3');
            var MAX = 29;

            var chart = new google.visualization.ColumnChart(document.getElementById('ColumnChart1'));

            drawChart();

            function drawChart() {
                // 버튼 사용 이벤트
                prevButton.disabled = true;
                nextButton.disabled = true;
                changeZoomButton.disabled = true;

                // 버튼사용시 그래프의 변화
                google.visualization.events.addListener(chart, 'ready',
                    function () {
                        prevButton.disabled = options.hAxis.viewWindow.min <= 0;
                        nextButton.disabled = options.hAxis.viewWindow.max >= MAX;
                        changeZoomButton.disabled = false;
                    });
                chart.draw(data, options);
                // window.addEventListener('resize', drawChart, false);
            }

            // 버튼 클릭시 칼럼이 3개씩 넘어감
            prevButton.onclick = function () {
                options.hAxis.viewWindow.min -= 3;
                options.hAxis.viewWindow.max -= 3;
                drawChart();
            }

            nextButton.onclick = function () {
                options.hAxis.viewWindow.min += 3;
                options.hAxis.viewWindow.max += 3;
                drawChart();
            }

            // 확대 및 축소 이벤트
            var zoomed = false;
            changeZoomButton.onclick = function () {
                if (zoomed) {
                    options.hAxis.viewWindow.min = 0;
                    options.hAxis.viewWindow.max = 7;
                } else {
                    options.hAxis.viewWindow.min = 0;
                    options.hAxis.viewWindow.max = MAX;
                }
                zoomed = !zoomed;
                drawChart();
            }
        }

        // 남성 사용패턴 분석 (파이차트)
        function drawpiechart() {
            var data = google.visualization.arrayToDataTable([
                ['사용패턴', '총사용량'],
                <c:forEach items="${chart3}" var="chart3" varStatus="status">
                ['${chart3.category}', ${chart3.spend}]
                <c:if test="${not st.last}">,
                </c:if>
                </c:forEach>
            ]);

            var options = {
                title: '남성 지역화폐 사용패턴',
                titleTextStyle: {
                    color: "black",
                    fontSize: 20
                }
            };

            var chart4 = new google.visualization.PieChart(document.getElementById('piechart'));

            chart4.draw(data, options);
            // window.addEventListener('resize', drawpiechart, false);
        }

        // 여성 사용패턴 분석 (파이차트)
        function drawpiechart2() {
            var data = google.visualization.arrayToDataTable([
                ['사용패턴', '총사용량'],
                <c:forEach items="${chart4}" var="chart4" varStatus="status">
                ['${chart4.category}', ${chart4.spend}]
                <c:if test="${not st.last}">,
                </c:if>
                </c:forEach>
            ]);

            var options = {
                title: '여성 지역화폐 사용패턴',
                titleTextStyle: {
                    color: "black",
                    fontSize: 20
                }
            };

            var chart5 = new google.visualization.PieChart(document.getElementById('piechart2'));

            chart5.draw(data, options);
            // window.addEventListener('resize', drawpiechart2, false);
        }

        // 모든 성별 사용패턴 분석 (막대그래프)
        function drawcolumnchart2() {
            var data = google.visualization.arrayToDataTable([
                ['사용패턴', '총사용량'],
                <c:forEach items="${chart5}" var="chart5" varStatus="status">
                ['${chart5.category}', ${chart5.spend}]
                <c:if test="${not st.last}">,
                </c:if>
                </c:forEach>
            ]);

            var options = {
                title: '패턴별 사용빈도',
                backgroundColor: 'white',
                chartArea: {width: '75%', height: '80%'},
                animation: {startup: true, duration: 1000, easing: 'in'},
                bar: {
                    groupWidth: '35%'
                },
                titleTextStyle: {
                    color: "black",
                    fontSize: 20
                },
                series: {
                    0: {
                        color: '#f18f18'
                    }
                },
                vAxis: { // 세로
                    title: "사용량",
                    titleTextStyle: {color: "#8C8C8C", fontSize: 10},
                    textStyle: {
                        fontSize: 12,
                        color: "#8C8C8C"
                    },
                    gridlines: { // 중간선
                        color: "#F6F6F6"
                    },
                    baselineColor: "black" // 하단선
                },
                hAxis: { // 가로
                    textStyle: {
                        fontSize: 12,
                        color: "#8C8C8C"
                    },
                    gridlines: { // 중간선
                        color: "#F6F6F6"
                    },
                    baselineColor: "black",
                },
                legend: {    // 항목
                    position: 'none'    // 범례안보임
                }

            };

            var chart = new google.visualization.ColumnChart(document.getElementById('ColumnChart2'));

            chart.draw(data, options);
            // window.addEventListener('resize', drawcolumnchart2, false);
        }

        // 페이지 내에 div이동
        function fnMove(seq) {
            var offset = $("#div" + seq).offset();
            $('html, body').animate({scrollTop: offset.top}, 400);
        }

        $(window).resize(function(){
            drawcolumnchart();
            drawcolumnchart2();
            drawlinechart();
            drawlinechart2();
            drawpiechart();
            drawpiechart2();
        });
    </script>
</head>
<body>

<%--네비게이션 불러오기--%>
<div class="menubar">
    <%@include file="/WEB-INF/views/navbar.jsp" %>
</div>

<div class="description_chart">
    <div class="GFD">
        <nav class="side_nav" img src="/image/introImages/side_navbar.png">
            <h2 class="side_nav_img">
                <p>현황</p>
            </h2>
            <ul class="nav_ul">
                <li class="nav_li" onclick="fnMove('1')">
                    분석 및 예측
                </li>
                <li class="nav_li" onclick="fnMove('2')">
                    현황
                </li>
            </ul>
        </nav>
        <div class="chart_div">
            <div class="predictDiv" id="div1">
                <section id="chart1">
                    <h4 style="font-size: 1.5rem; font-weight: 500;">분석 및 예측</h4>
                    <hr style="margin: 10px 0px 10px 0px;">
                    <div class="lineChartDiv">
                        <div id="lineChart"></div>
                    </div>
                    <div class="lineChartDiv2">
                        <div id="lineChart2"></div>
                        <div class="charts_button">
                            <button id="b4" class="ColumnChart_button" disabled>prev</button>
                            <button id="b5" class="ColumnChart_button">next</button>
                            <button id="b6" class="ColumnChart_button">zoom</button>
                        </div>
                    </div>
                    <div class="columnchartDiv">
                        <div id="ColumnChart1"></div>
                        <div class="charts_button">
                            <button id="b1" class="ColumnChart_button" disabled>prev</button>
                            <button id="b2" class="ColumnChart_button">next</button>
                            <button id="b3" class="ColumnChart_button">zoom</button>
                        </div>
                    </div>
                </section>
            </div>

            <div class="AnalysisDiv">
                <section id="chart2">
                    <h4 style="font-size: 1.5rem; font-weight: 500;">현황</h4>
                    <hr style="margin: 10px 0px 10px 0px;">
                    <div class="piechartDiv" id="div2">
                        <div id="piechart"></div>
                    </div>
                    <div class="piechart2Div">
                        <div id="piechart2"></div>
                    </div>
                    <div class="columnchart2Div">
                        <div id="ColumnChart2"></div>
                    </div>
                </section>
            </div>
        </div>
    </div>
</div>
<footer>
    <jsp:include page="../footer.jsp"/>
</footer>
</body>
</html>
