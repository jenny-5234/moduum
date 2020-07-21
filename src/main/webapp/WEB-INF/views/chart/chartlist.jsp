<%--
  Created by IntelliJ IDEA.
  User: bit
  Date: 2020-07-20
  Time: 오후 2:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>muchinchart</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <!-- google chart script-->
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <!-- Load the AJAX API -->
    <script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <script type="text/javascript" src="ajax-sample.js"></script>
    <script type="text/javascript">
        // 최신차트 버전 불러오기
        google.charts.load('current', {'packages':['annotationchart']});
        // 선언될 함수명 등록
        google.charts.setOnLoadCallback(drawChart1);

        // 데이터 셋팅
        function drawChart1() {
            // 값 불러오기
            // 선언(db -> json)
            <c:forEach var="dto" items="${chart}" varStatus="status">
            var jsonData = [
                ['date', 'spend'],
                [${dto.date}, ${dto.spend}]
            ]

            var data = new google.visualization.arrayToDataTable(jsonData);
            var options = {
                title: '월별 지역화폐 사용량',
                curveType: 'function', // 꺾은선을 곡선으로 표시함
                legend: {position: 'bottom'}
            };

            var objDiv = document.getElementById('line_chart_div1');
            // 선형차트 : LineChart
            var chart = new google.visualization.LineChart(objDiv);
            chart.draw(data, options);
            </c:forEach>
        };
    </script>
</head>
<body>
    <div id="line_chart_div1"  style="width: 900px; height: 500px;">
    </div>
</body>
</html>
