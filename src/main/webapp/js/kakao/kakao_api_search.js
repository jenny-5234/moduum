// 마커를 담을 배열입니다
var markers = [];

// 장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places();

// 페이지 itemElement 배열 생성
var itemE = [];

// 클러스터 체크박스 체크상태
var clusterchecked = false;

// 폴리곤을 클릭했을 때 똑같은걸 다시 클릭했는지 체크하기 위한 변수 및 선택한 폴리곤에서 검색을 위함
var polygonSelectCheck = "";

// 키워드 검색을 요청하는 함수입니다
function searchPlaces() {
    closeOverlay();     // 검색을 했을 때 마커의 정보 오버레이가 열려있는걸 닫는다.
    var keyword = document.getElementById('keyword').value;     // 검색 텍스트 박스에 입력된 값을 keyword에 저장한다.
    console.clear(); // 데이터 넣을 때 필요한 콘솔 초기화
    // 키워드 앞뒤가 공백인 경우
    if (!keyword.replace(/^\s+|\s+$/g, '')) {
        alert('키워드를 입력해주세요!');
        return false;
    }
    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
    // 폴리곤을 선택한 경우 그 지역을 기준으로 검색
    if (polygonSelectCheck) {
        ps.keywordSearch(polygonSelectCheck + keyword + "긴급재난지원금", placesSearchCB, {});
    } else {
        deletePolygon(polygons);        // 지도에 표시한 폴리곤을 제거한다
        polygons = [];       // 폴리곤 초기화
        ps.keywordSearch(keyword, placesSearchCB, {});
    }

}

// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
function placesSearchCB(data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {
        // 정상적으로 검색이 완료됐으면
        // 검색 목록과 마커를 표출합니다
        displayPlaces(data);
        // 페이지 번호를 표출합니다
        displayPagination(pagination);

    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {
        alert('검색 결과가 존재하지 않습니다.');
        return;

    } else if (status === kakao.maps.services.Status.ERROR) {
        alert('검색 결과 중 오류가 발생했습니다.');
        return;

    }
}

// 검색 결과 목록과 마커를 표출하는 함수입니다
function displayPlaces(places) {

    var listEl = document.getElementById('placesList'),     // placesList id에 있는 정보를 listEl에 저장
        menuEl = document.getElementById('menu_wrap'),      // menu_wrap id에 있는 정보를 menuEl에 저장
        fragment = document.createDocumentFragment(),           // fragment를 생성
        bounds = new kakao.maps.LatLngBounds(),         // 지도 위치 재설정할 객체
        listStr = '';

    // 검색 결과 목록에 추가된 항목들을 제거합니다
    removeAllChildNods(listEl);

    // 지도에 표시되고 있는 마커를 제거합니다
    removeMarker();
    // 클러스터 ㅔㅈ거
    clusterer.clear();
    // makejson(places);
    for (var i = 0; i < places.length; i++) {
        // 마커를 생성하고 지도에 표시합니다
        var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),        // 검색한 결과에서 위도 경도를 placePosition에 저장
            marker = addMarker(placePosition, i),       // 위도 경도에 마커를 찍는다.
            itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다
        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        bounds.extend(placePosition);
        // 마커와 검색결과 항목에 mouseover 했을때
        (function (marker, place_name, road_address_name, address_name, phone, place_url, id, x, y) {
            kakao.maps.event.addListener(marker, 'mouseover', function () {
            });

            kakao.maps.event.addListener(marker, 'mouseout', function () {
            });

            // 마커를 클릭 했을 때 상호명, 도로명 주소, 지번 주소, 전화번호, url을 displayInfowindow에 전달
            kakao.maps.event.addListener(marker, 'click', function () {
                displayInfowindow(marker, place_name, road_address_name, address_name, phone, place_url, id, x, y);
            });
            // Element를 클릭 했을 때 상호명, 도로명 주소, 지번 주소, 전화번호, url을 displayInfowindow에 전달
            itemEl.onclick = function () {
                displayInfowindow(marker, place_name, road_address_name, address_name, phone, place_url, id, x, y);
                map.setBounds(bounds);      // 선택한 위치로 지도를 이동
            };

            itemEl.onmouseover = function () {
                /*if (!clustercheck) {
                    console.log()
                    map.setCenter(new kakao.maps.LatLng(y, x));
                    map.setLevel(3);
                    displayInfowindow(marker, place_name, road_address_name, address_name, phone, place_url, id, x, y);
                }*/
            };

            itemEl.onmouseout = function () {
            };
        })(marker, places[i].place_name, places[i].road_address_name, places[i].address_name, places[i].phone, places[i].place_url, places[i].id, places[i].x, places[i].y);

        fragment.appendChild(itemEl);   // Element를 fragment에 넣는다
    }

    // 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
    listEl.appendChild(fragment);
    menuEl.scrollTop = 0;       // 스크롤을 맨 위로 이동

    map.setBounds(bounds);
}

// 검색결과 항목을 Element로 반환하는 함수입니다
function getListItem(index, places) {
    var el = document.createElement('li'),
        itemStr = '<span class="markerbg marker_' + (index + 1) + '"></span>' +
            '<div class="info">' +
            '   <h5>' + places.place_name + '</h5>';
    // 도로명 주소가 있을 경우
    if (places.road_address_name) {
        itemStr += '    <span>' + places.road_address_name + '</span>' +
            '   <span class="jibun gray">' + places.address_name + '</span>';
    } else {
        itemStr += '    <span>' + places.address_name + '</span>';
    }
    // 전화번호가 있을 경우
    if (places.phone) {
        itemStr += '  <span class="tel">' + places.phone + '</span>' +
            '</div>';
    }

    el.innerHTML = itemStr;
    el.className = 'item';

    return el;
}

// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
function addMarker(position, idx) {
    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
        imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
        imgOptions = {
            spriteSize: new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
            spriteOrigin: new kakao.maps.Point(0, (idx * 46) + 10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
            offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
        },
        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
        marker = new kakao.maps.Marker({
            position: position, // 마커의 위치
            image: markerImage  // 마커의 이미지
        });

    marker.setMap(map); // 지도 위에 마커를 표출합니다
    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

    return marker;
}

// 지도 위에 표시되고 있는 마커를 모두 제거합니다
function removeMarker() {
    for (var i = 0; i < markers.length; i++) {
        markers[i].setMap(null);
    }
    markers = [];   // 초기화
}

// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
function displayPagination(pagination) {
    var paginationEl = document.getElementById('pagination'),
        fragment = document.createDocumentFragment(),
        i;

    // 기존에 추가된 페이지번호를 삭제합니다
    while (paginationEl.hasChildNodes()) {
        paginationEl.removeChild(paginationEl.lastChild);
    }
    for (i = 1; i <= pagination.last; i++) {
        var el = document.createElement('a');
        el.href = "#";
        el.innerHTML = i;

        // 현재 페이지일 경우 페이지 번호 className을 on으로 설정
        if (i === pagination.current) {
            el.className = 'on';
        } else {
            // 페이지를 클릭하면 클릭한 페이지로 이동
            el.onclick = (function (i) {
                return function () {
                    pagination.gotoPage(i);
                }
            })(i);
        }

        fragment.appendChild(el);
    }
    paginationEl.appendChild(fragment);
}

// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
// 인포윈도우에 상호명, 도로명 주소, 지번 주소, 전화번호, url을 표시
function displayInfowindow(marker, place_name, road_address_name, address_name, phone, place_url, id, x, y) {
    // 전화번호나 url이 있는 경우
    if (phone && place_url) {
        var content = '<div class="infowindowwrap">' +
            '               <div class="infowindow">' +
            '                   <div class="title">' +
            place_name +
            '                       <div class="close" onclick="closeOverlay()" title="닫기"></div>' +
            '                   </div>' +
            '               <div class="infowindowbody">' +
            '                   <div class="infowindowdesc">' +
            '                       <div class="ellipsis">' + road_address_name + '</div>' +
            '                       <div class="jibun">' + address_name + '</div>' +
            '                           <div class="contact">' + phone + '</div>' +
            '                           <span class="ICON-middot"></span>' +
            '                           <div class="detail"><a href="' + place_url + '" target="_blank" class="link">상세보기</a></div>' +
            '                           <span class="ICON-middot"></span>' +
            '                           <div class="searchdirections"><a href="https://map.kakao.com/link/to/' + place_name + ',' + y + ',' + x + '" target="_blank" class="link">길찾기</a></div>' +
            '                       </div>' +
            '                   </div>' +
            '               </div>' +
            '       </div>';
    } else if (phone && !place_url) {
        var content = '<div class="infowindowwrap">' +
            '               <div class="infowindow">' +
            '                   <div class="title">' +
            place_name +
            '                       <div class="close" onclick="closeOverlay()" title="닫기"></div>' +
            '                   </div>' +
            '               <div class="infowindowbody">' +
            '                   <div class="infowindowdesc">' +
            '                       <div class="ellipsis">' + road_address_name + '</div>' +
            '                       <div class="jibun">' + address_name + '</div>' +
            '                           <div class="contact">' + phone + '</div>' +
            // '                           <span class="ICON-middot"></span>' +
            // '                           <div class="detail"><a href="#" onclick="ps.keywordSearch(\'' + place_name + '\', placesSearchCB);" class="link">상세보기</a></div>' +
            '                           <span class="ICON-middot"></span>' +
            '                           <div class="searchdirections"><a href="https://map.kakao.com/link/to/' + place_name + ',' + y + ',' + x + '" target="_blank" class="link">길찾기</a></div>' +
            '                       </div>' +
            '                   </div>' +
            '               </div>' +
            '       </div>';
    }
    // 전화번호나 url이 없는 경우
    else {
        var content = '<div class="infowindowwrap">' +
            '    <div class="infowindow">' +
            '        <div class="title">' +
            place_name +
            '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' +
            '        </div>' +
            '        <div class="infowindowbody">' +
            '            <div class="infowindowdesc">' +
            '                <div class="ellipsis">' + road_address_name + '</div>' +
            '                <div class="jibun">' + address_name + '</div>' +
            '                <div class="contact">' + phone + '</div>' +
            '                   <div class="searchdirections"><a href="https://map.kakao.com/link/to/' + place_name + ',' + y + ',' + x + '" target="_blank" class="link">길찾기</a></div>' +
            '                </div>' +
            '            </div>' +
            '        </div>' +
            '    </div>' +
            '</div>';
    }

    infowindow.setContent(content);     // infowindow에 content 정보 전달
    infowindow.open(map, marker);       // 선택한 마커에 해당 인포윈도우를 띄운다
}

// 검색결과 목록의 자식 Element를 제거하는 함수입니다
function removeAllChildNods(el) {
    while (el.hasChildNodes()) {
        el.removeChild(el.lastChild);
    }
}

// 커스텀 오버레이를 닫기 위해 호출되는 함수입니다
function closeOverlay() {
    infowindow.setMap(null);
}

// 초기화 함수입니다.
function initialization() {
    // 오버레이 닫기
    closeOverlay();
    // 폴리곤 지우기
    deletePolygon(polygons);
    polygons = [];
    // 전에 있던 Element와 페이지를 지운다
    var listEl = document.getElementById('placesList');
    displayPagination({first: 0, last: 0, totalCount: 0});
    // 검색 결과 Element를 제거
    removeAllChildNods(listEl);
    // 페이지 초기화
    pagegroup = 1;
    lastPage = 5;
    // 지도에 표시된 마커를 제거
    removeMarker();
    // 지도에 표시한 클러스터를 제거한다
    clusterer.clear();
    // 클러스터 체크 유무 초기화
    checkedClusterPolygonEvent = false;
    // 선택한 폴리곤 초기화
    polygonSelectCheck = "";
}