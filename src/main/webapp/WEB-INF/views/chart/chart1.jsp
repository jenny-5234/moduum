<%--
  Created by IntelliJ IDEA.
  User: bit
  Date: 2020-07-22
  Time: 오후 4:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>chart1</title>
    <script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script>
        google.load('visualization', '1', {
            'packages' : ['corechart']
        });

        google.setOnLoadCallback(drawChart);
        function drawChart() {
            var jsonData = $.ajax({
                url : "${path}/chartt/chartlist.do",
                dataType : "json",
                async : false
            }).responseText;
            console.log(jsonData);

            var data = new google.visualization.DataTable(jsonData);

            var chart = new google.visualization.LineChart(
                document.getElementById('lineChart')
            );

            chart.draw(data, {
                title : "test",
                curveType : "function",
                width : 600,
                height : 400
            });
        }
    </script>
</head>
<body>
<div id="lineChart">

</div>
</body>
</html>
