var mapContainer = document.getElementById('map'), // 지도를 표시할 div
    mapOption = {
        center: new kakao.maps.LatLng(37.49461890613009, 127.02760319558533), // 지도의 중심좌표 37.49461890613009, 127.02760319558533
        level: 12 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption),
    // 커스텀 오버레이 객체 생성
    customOverlay = new kakao.maps.CustomOverlay({}),
    // 닫을 수 있는 인포윈도우 객체 생성
    infowindow = new kakao.maps.InfoWindow({zIndex: 1});

// map.setDraggable(false);
// map.setZoomable(false);

// 지도에 마커와 인포윈도우를 표시하는 함수입니다
function displayMarker(locPosition, message) {

    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
        map: map,
        position: locPosition
    });

    var iwContent = message // 인포윈도우에 표시할 내용

    // 인포윈도우를 생성합니다
    // var infowindow2 = new kakao.maps.InfoWindow({
    //     content : iwContent
    // });
    infowindow.setContent(iwContent);

    // 인포윈도우를 마커위에 표시합니다
    infowindow.open(map, marker);

    // 지도 중심좌표를 접속위치로 변경합니다
    map.setCenter(locPosition);

    $.getJSON('../../../location/allv3.json', function (geojson) {
        var data = geojson.features;
        var coordinates = [];    // 좌표 저장할 배열
        var name = '';            // 행정 구 이름
        // 폴리곤 length 만큼 반복
        $.each(data, function (index, val) {
            coordinates = val.geometry.coordinates;     // coordinates 에 좌표 저장
            name = val.properties.SIG_KOR_NM;
            displayArea2(coordinates, name);       // displayArea 에 좌표, 시 이름, 도시 이름, 다음 시 이름을 전달
        });
    });
}
var locPosition = '';
var message = '';

function getGeoLocation() {
    // HTML5의 geolocation으로 사용할 수 있는지 확인합니다
    if (navigator.geolocation) {

        // GeoLocation을 이용해서 접속 위치를 얻어옵니다
        navigator.geolocation.getCurrentPosition(function (position) {

            var lat = position.coords.latitude, // 위도
                lon = position.coords.longitude; // 경도

            locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
                message = '<div style="padding:0px 0px 0px 13px;">여기에 계신가요?!</div>'; // 인포윈도우에 표시될 내용입니다

            // 마커와 인포윈도우를 표시합니다
            displayMarker(locPosition, message);

        });

    } else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다

        locPosition = new kakao.maps.LatLng(37.49461890613009, 127.02760319558533),
            message = 'geolocation을 사용할수 없어요..'

        displayMarker(locPosition, message);
    }
}

var polygons = [];
var tempPath = [];          // 임시로 폴리곤을 넣어둘 변수(다중 폴리곤)
var path = [];            // 폴리곤 그려줄 path
var toto = [];

function displayArea2(coordinates, name) {
    $.each(coordinates[0], function (index, coordinate) {        // console.log(coordinates)를 확인해보면 보면 [0]번째에 배열이 주로 저장이 됨.  그래서 [0]번째 배열에서 꺼내줌.
        tempPath.push(new kakao.maps.LatLng(coordinate[1], coordinate[0]));            // new kakao.maps.LatLng가 없으면 인식을 못해서 path 배열에 추가

    });
    if (name === '광주광역시') {
        toto = tempPath;
        console.log(tempPath);
        console.log(toto);
    }
    // path에 광주광역시랑 전라남도가 포함 되어야 함
    else if (name === '전라남도') {
        path.push(toto);
    }
    path.push(tempPath);
    // 다각형을 생성합니다
    var polygon = new kakao.maps.Polygon({
        map: map, // 다각형을 표시할 지도 객체
        path: path,
        strokeWeight: 2,
        strokeColor: '#004c80',
        strokeOpacity: 0.8,
        fillColor: '#fff',
        fillOpacity: 0.7
    });
    path = [];
    tempPath = [];

    polygons.push(polygon);     // polygon 정보를 polygons 에 푸쉬한다(나중에 폴리곤을 지우기 위해 푸쉬)
    // 다각형에 mouseover 이벤트를 등록하고 이벤트가 발생하면 폴리곤의 채움색을 변경합니다
    // 지역명을 표시하는 커스텀오버레이를 지도위에 표시합니다

    kakao.maps.event.addListener(polygon, 'mouseover', function (mouseEvent) {
        polygon.setOptions({fillColor: '#09f'});

        customOverlay.setContent('<div class="area">' + name + '</div>');       // 폴리곤에 마우스 포인터를 올리면 지역명 표시

        customOverlay.setPosition(mouseEvent.latLng);       // 클릭한 위치를 저장
        customOverlay.setMap(map);      // 커스텀 오버레이를 지도에 표시한다
    });

    // 다각형에 mousemove 이벤트를 등록하고 이벤트가 발생하면 커스텀 오버레이의 위치를 변경합니다
    kakao.maps.event.addListener(polygon, 'mousemove', function (mouseEvent) {

        customOverlay.setPosition(mouseEvent.latLng);
    });

    // 다각형에 mouseout 이벤트를 등록하고 이벤트가 발생하면 폴리곤의 채움색을 원래색으로 변경합니다
    // 커스텀 오버레이를 지도에서 제거합니다
    kakao.maps.event.addListener(polygon, 'mouseout', function () {
        polygon.setOptions({fillColor: '#fff'});
        customOverlay.setMap(null);     // 커스텀 오버레이를 지도에서 제거합니다
    });

    // 다각형에 click 이벤트를 등록하고 이벤트가 발생하면 다각형의 이름과 면적을 인포윈도우에 표시합니다
    kakao.maps.event.addListener(polygon, 'click', function (mouseEvent) {
        console.log(name);
    });
}

window.addEventListener("load", getGeoLocation);
// window.addEventListener("resize", getGeoLocation);
window.onresize = function (event) {
    if (locPosition) {
        displayMarker(locPosition, message);
    }
}