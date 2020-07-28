<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>Kakao 지도 시작하기</title>
    <%-- 반응형 웹 --%>
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <%-- 카카오맵 API 사용을 위한 키 및 라이브러리 --%>
    <script type="text/javascript"
            src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4f389b62ab24856e4ae992dfc8a85562&libraries=services,clusterer"></script>
    <%-- json 파일을 자바스크립트에서 불러오기 위한 jquery 사용 --%>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <link rel="stylesheet" type="text/css" href="css/kakao_api_polygon.css">
    <link rel="stylesheet" type="text/css" href="css/kakao_api_search.css">
</head>
<script>
    $(document).ready(function () {
        $("#area").change(function () {
            regionSelection($("#area").val());
            console.log("테스트 성공" + $("#area").val());
            if ($("#area option:selected").val() != "경기도") {
                $("#clustercleared").prop("checked", false);
                clusterchecked = false;
            }
        });
    });
    function regionSelection() {
        console.log("테스트 성공");
    }
</script>
<body>
<form onsubmit="regionSelection(); return false;">
    <select id="area" class="custom-select">
        <option value="none" selected>지역선택</option>
        <option value="서울">서울</option>
        <option value="경기도">경기도</option>
        <option value="인천">인천</option>
        <option value="대전">대전</option>
        <option value="대구">대구</option>
        <option value="세종특별자치시">세종특별자치시</option>
        <option value="강원도">강원도</option>
        <option value="충청북도">충청북도</option>
        <option value="충청남도">충청남도</option>
        <option value="경상북도">경상북도</option>
        <option value="경상남도">경상남도</option>
        <option value="부산광역시">부산광역시</option>
        <option value="울산광역시">울산광역시</option>
        <option value="전라북도">전라북도</option>
        <option value="광주광역시">광주광역시</option>
        <option value="전라남도">전라남도</option>
        <option value="제주도">제주도</option>
        <option value="울릉군">울릉군</option>
    </select>
    <%--                        <button type="submit" class="">선택</button>--%>
    <%--                        <input type="button" onclick="clus();" value="테스트"/>--%>
    <%--<div class="custom-control custom-switch">
    <label for="clustercleared" class="custom-control-label"><input type="checkbox" id="clustercleared"
                                                              class="custom-control-input" />클러스터</label>
    </div>--%>
</form>
</body>
</html>
