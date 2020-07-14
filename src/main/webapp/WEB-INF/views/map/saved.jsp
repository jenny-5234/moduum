<%@ page import="org.json.simple.JSONArray" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="org.json.simple.JSONObject" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>Kakao 지도 시작하기</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

</head>
<%
    JSONArray jsonArray = new JSONArray();
    Connection conn = null;
    String connString =
            "jdbc:sqlserver://14.32.18.226:1433;database=YL;user=as;password=1234";
    conn = DriverManager.getConnection(connString);

    if (conn == null) {
        System.out.println("conneciton");
    }
    try {
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery("insert into cluster(clusterd) values(");

    } catch (Exception e) {
        System.out.println("아무거나");
    }
%>
<body>
</body>
</html>
