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

<img id="video" src="/image/homeImages/video.png"/>

<!-- The Modal -->
<div id="myModal" class="modal">

    <!-- Modal content -->
    <div class="modal-content">
        <span class="close">&times;</span>
        <div class="youtube">
            <iframe src="http://www.youtube.com/embed/yIezazDM1QY" frameborder="0"
                    allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
                    allowfullscreen=""></iframe>
        </div>
    </div>

</div>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="js/popup.js"></script>

</body>
</html>