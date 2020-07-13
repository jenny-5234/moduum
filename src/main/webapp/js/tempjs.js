// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
// var infowindow = new kakao.maps.InfoWindow({
//     zIndex: 1
// });

// 클릭시 좌표를 콘솔에 출력
kakao.maps.event.addListener(map, 'click', function(mouseEvent) {

    // 클릭한 위도, 경도 정보를 가져옵니다
    var latlng = mouseEvent.latLng;
    // var latlng = map.getCenter();

    console.log(latlng.getLat());
    console.log(latlng.getLng());

});

// 데이터를 넣을 때 콘솔에 json으로 출력함
var gunpo_str = "";
function makejson(places) {
    for (var i = 0; i < places.length; i++) {
        var gunpo = {
            SIGUN_NM: "군포시",
            place_name: places[i].place_name,
            INDUTYPE_NM: places[i].category_name,
            road_address_name: places[i].road_address_name,
            address_name: places[i].address_name,
            phone: places[i].phone,
            REFINE_ZIPNO: "",
            y: places[i].y,
            x: places[i].x,
            place_url: places[i].place_url,
            id: places[i].id,
        }

        gunpo_str += JSON.stringify(gunpo);


    }
    console.log(gunpo_str);
    gunpo_str = "";
}