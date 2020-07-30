<%--
  Created by IntelliJ IDEA.
  User: bit
  Date: 2020-07-20
  Time: 오후 2:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>muchinchart</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <!-- google chart script-->
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<%--    <script type="text/javascript" src="ajax-sample.js"></script>--%>
    <script type="text/javascript">
        // google.load("visualization", "1", {packages:["corechart"]});
        // google.charts.load('current',{'packages':['corechart']});
        google.charts.load('current',{'packages':['corechart','bar','line']});
        google.setOnLoadCallback(drawChart);
        google.setOnLoadCallback(drawChart2);
        google.charts.setOnLoadCallback(drawChart3);

        function drawChart(){
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
                title: '지역화폐 사용량',
                pointSize: 3,
                backgroundColor: 'white',
                width: 800,
                height: 600,
                animation: {startup: true, duration: 1000, easing: 'in'},
                titleTextStyle:{
                    color: "#BDBDBD"
                },
                series:{    // 선 색상
                    0:{
                        color: '#FFBB00'
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
                legend:{    // 항목
                    textStyle:{
                        fontSize: 11,
                        color: "#8C8C8C"
                    }
                }

            };

            var chart = new google.visualization.LineChart(document.getElementById('lineChart'));

            chart.draw(data, options);
        }

        function drawChart2(){
            var data2 = google.visualization.arrayToDataTable([
                ['날짜', '10대 사용','20대 사용', '30대사용', '40대사용', '50대 사용'],
                <c:forEach items="${chart2}" var="chart2" varStatus="status">
                ['${chart2.date}', ${chart2.age_20}, ${chart2.age_30}, ${chart2.age_40}, ${chart2.age_50}, ${chart2.age_60}]
                <c:if test="${not st.last}">,
                </c:if>
                </c:forEach>
            ]);

            var date_format = new google.visualization.DateFormat('yyyy-MM');
            date_format.format(data2, 0);

            var options2 = {
                title: '연령별 사용빈도',
                pointSize: 3,
                backgroundColor: 'white',
                // width: 800,
                // height: 900,
                titleTextStyle:{
                    color: "#BDBDBD"
                },
                animation: {startup: true,duration: 1000,easing: 'in' },
                series:{    // 선 색상
                    0:{
                        color: '#FFBB00'
                    },
                    1:{
                        color: '#FF0000'
                    },
                    2:{
                        color: '#1DDB16'
                    },
                    3:{
                        color: '#0054FF'
                    },
                    4:{
                        color: '#5F00FF'
                    }
                },
                vAxis:{ // 세로
                    title: "사용빈도",
                    titleTextStyle: {color:"#8C8C8C", fontSize:10},
                    viewWindow:{
                        min: 0,
                        max: 1800000
                    },
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
                legend:{    // 항목
                    textStyle:{
                        fontSize: 11,
                        color: "#8C8C8C"
                    }
                }

            };

            var chart2 = new google.visualization.LineChart(document.getElementById('lineChart2'));

            chart2.draw(data2, google.charts.Line.convertOptions(options2));
        }

        $(document).ready(function(){
            drawChart3();
        });
        function drawChart3(){
            var data3 = google.visualization.arrayToDataTable([
                ['날짜', '10대 사용','20대 사용', '30대사용', '40대사용', '50대 사용'],
                <c:forEach items="${chart2}" var="chart2" varStatus="status">
                ['${chart2.date}', ${chart2.age_20}, ${chart2.age_30}, ${chart2.age_40}, ${chart2.age_50}, ${chart2.age_60}]
                <c:if test="${not st.last}">,
                </c:if>
                </c:forEach>
            ]);

            var date_format = new google.visualization.DateFormat('yyyy-MM');
            date_format.format(data3, 0);

            var options3 = {
                title: '연령별 사용빈도',
                pointSize: 3,
                backgroundColor: 'white',
                width: 1800,
                height: 900,
                animation: {startup: true,duration: 1000,easing: 'in' },
                bar:{
                    groupWidth: '70%'
                },
                titleTextStyle:{
                    color: "#BDBDBD"
                },
                series:{    // 선 색상
                    0:{
                        color: '#FFBB00'
                    },
                    1:{
                        color: '#FF0000'
                    },
                    2:{
                        color: '#1DDB16'
                    },
                    3:{
                        color: '#0054FF'
                    },
                    4:{
                        color: '#5F00FF'
                    }
                },
                vAxis:{ // 세로
                    title: "사용빈도",
                    titleTextStyle: {color:"#8C8C8C", fontSize:10},
                    viewWindow:{
                        min: 0,
                        max: 1800000
                    },
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
                    baselineColor:"black",
                    viewWindow: {min:0, max:7}
                },
                legend:{    // 항목
                    textStyle:{
                        fontSize: 11,
                        color: "#8C8C8C"
                    }
                }

            };

            var prevButton = document.getElementById('b1');
            var nextButton = document.getElementById('b2');
            var changeZoomButton = document.getElementById('b3');
            var MAX = 29;

            var chart3 = new google.visualization.ColumnChart(document.getElementById('ColumnChart1'));

            drawChart4();

            function drawChart4(){
                prevButton.disabled = true;
                nextButton.disabled = true;
                changeZoomButton.disabled = true;

                google.visualization.events.addListener(chart3, 'ready',
                    function() {
                        prevButton.disabled = options3.hAxis.viewWindow.min <= 0;
                        nextButton.disabled = options3.hAxis.viewWindow.max >= MAX;
                        changeZoomButton.disabled = false;
                    });
                chart3.draw(data3, options3);
            }

            prevButton.onclick = function(){
                options3.hAxis.viewWindow.min -= 3;
                options3.hAxis.viewWindow.max -= 3;
                drawChart4();
            }

            nextButton.onclick = function(){
                options3.hAxis.viewWindow.min += 3;
                options3.hAxis.viewWindow.max += 3;
                drawChart4();
            }

            var zoomed = false;
            changeZoomButton.onclick = function(){
                if(zoomed){
                    options3.hAxis.viewWindow.min = 0;
                    options3.hAxis.viewWindow.max = 7;
                }else{
                    options3.hAxis.viewWindow.min = 0;
                    options3.hAxis.viewWindow.max = MAX;
                }
                zoomed = !zoomed;
                drawChart4();
            }
        }


    </script>
</head>
<body>
<table>
    <tr>
        <td><div id="lineChart" style="width:800px; height:600px;"></div></td>
        <td><div id="lineChart2" style="width:800px; height:600px;"></div></td>
    </tr>

    <tr>
        <td colspan="2"><div id="ColumnChart1"></div></td>
    </tr>
    <tr>
        <td><button id="b1" disabled>prev</button><button id="b2">next</button><button id="b3">zoom</button></td>
    </tr>

</table>
</body>
</html>
