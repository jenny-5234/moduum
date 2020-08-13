<%--
  Created by IntelliJ IDEA.
  User: bit
  Date: 2020-07-14
  Time: 오후 3:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>실시간 채팅창</title>

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link rel="stylesheet" href="/css/chatting.css">
</head>
<body>

<%--node.js 서버 포트 열고 난후 실행--%>

<div class="chatting_size">
    <div id="chatLog" class="chat_log" readonly>
        <!-- 채팅 메시지 영역 -->
    </div>
    <form id="chat">
        <input id="name" class="name" type="text"/>  <!--nickname 영역 -->
        <input id="message" class="message" type="text" placeholder="메세지를 입력해주세요."/>    <!--message입력 영역 -->
    <%--    <input type="submit" class="chat_button" value="전송"/>    <!--전송 영역 -->--%>
        <input type="submit" class="chat_button" value="전송"/>
    </form>
</div>

<script src="http://14.32.18.180:3000/socket.io/socket.io.js"></script>
<script>
    $(document).ready(function () {
        var socket = io("http://14.32.18.180:3000");

        $('#chat').on('submit', function(e){
            socket.emit('send message', $('#name').val(), $('#message').val());
            $('#message').val("");
            $("#message").focus();
            e.preventDefault();
        });

        // message 수신, 송신 함수
        socket.on('receive message', function (msg) {
            $('#chatLog').append($('<div class="receive">').text(msg));
            $('#chatLog').scrollTop($('#chatLog')[0].scrollHeight);
        });

        // nickname 변경 함수
        socket.on('change name', function(name){
            $('#name').val(name);
        });
    })
</script>
</body>
</html>
