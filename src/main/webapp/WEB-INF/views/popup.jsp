<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>needPopup demo</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="/css/popup.css">
</head>
<body>
<!-- 1. The <iframe> (and video player) will replace this <div> tag. -->
<%--<div id="player"></div>--%>

<%--<script>
    // 2. This code loads the IFrame Player API code asynchronously.
    var tag = document.createElement('script');

    tag.src = "https://www.youtube.com/iframe_api";
    var firstScriptTag = document.getElementsByTagName('script')[0];
    firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

    // 3. This function creates an <iframe> (and YouTube player)
    //    after the API code downloads.
    var player;
    function onYouTubeIframeAPIReady() {
        player = new YT.Player('player', {
            height: '250',
            width: '400',
            videoId: 'yIezazDM1QY',
            playerVars : {
                'controls': 0, //플레이어 컨드롤러 표시여부
                'rel': 0, //연관동영상 표시여부
                'playsinline': 1, //ios환경에서 전체화면으로 재생하지 않게하는 옵션
                'autoplay': 1, //자동재생 여부(모바일에서 작동하지 않습니다. mute설정을 하면 작동합니다.)
                'loop': 1,
                'playlist': 'yIezazDM1QY'
            },
            events: {
                'onReady': onPlayerReady,
                'onStateChange': onPlayerStateChange
            }
        });
    }

    // 4. The API will call this function when the video player is ready.
    function onPlayerReady(event) {
        event.target.playVideo();
    }

    // 5. The API calls this function when the player's state changes.
    //    The function indicates that when playing a video (state=1),
    //    the player should play for six seconds and then stop.
    var done = false;
    function onPlayerStateChange(event) {
        if (event.data == YT.PlayerState.PLAYING && !done) {
            setTimeout(stopVideo, 6000);
            done = true;
        }
    }
    function stopVideo() {
        player.stopVideo();
    }
</script>--%>
<%--<img id="video" src="/image/homeImages/video.png"/>--%>

<!-- The Modal -->
<%--<div id="myModal" class="modal">--%>

<!-- Modal content -->
<%--    <div class="modal-content">--%>
<%--        <span class="close">&times;</span>--%>
<%--        <div class="youtube">--%>
<div class="video_wrap">
    <iframe id="ytplayer" type="text/html" width="426" height="240"
            src="https://www.youtube.com/embed/yIezazDM1QY"
            frameborder="0" allowfullscreen></iframe>
</div>
<%--        </div>--%>
<%--    </div>--%>

<%--</div>--%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<%--<script src="js/popup.js"></script>--%>

</body>
</html>