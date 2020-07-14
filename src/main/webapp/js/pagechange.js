// 시작하는 페이지
var pagegroup = 1;
// 마지막 페이지
var lastPage = 5;

// 검색 결과 목록과 마커를 표출하는 함수입니다
function displayPlaces2(places) {
    var listEl = document.getElementById('placesList'),     // id가 placeList인 것을 가져와서 저장
        menuEl = document.getElementById('menu_wrap'),      // id가 menu_wrap인 것을 가져와서 저장
        fragment = document.createDocumentFragment(),           // fragment를 생성
        bounds = new kakao.maps.LatLngBounds(),         // 지도 위치 재설정할 객체
        listStr = '';
    // 검색 결과 목록에 추가된 항목들을 제거합니다
    removeAllChildNods(listEl);

    // 지도에 표시되고 있는 마커를 제거합니다
    removeMarker();

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
                if (clustercheck) {
                    LoadingWithMask();
                }
                setTimeout(function () {
                    // x좌표나 y좌표가 없을 때때
                    if (x && y) {
                        displayInfowindow(marker, place_name, road_address_name, address_name, phone, place_url, id, x, y);
                        // map.setBounds(bounds);      // 선택한 위치로 지도를 이동
                        map.setCenter(new kakao.maps.LatLng(y, x));
                        map.setLevel(3);
                    } else {
                        console.log("없어");
                    }
                    closeLoadingWithMask();
                }, 1);
            };

            itemEl.onmouseover = function () {
                /*if (!clustercheck) {
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
    // itmeE에 push 했던 데이터를 초기화
    for (var i = 0; i < 15; i++) {
        itemE.pop(i);
    }
}

// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
function displayPagination2(pagination, totalPage, current, data) {
    console.log("페이지:" + current);
    console.log("totalPage:" + totalPage);
    var paginationEl = document.getElementById('pagination'),
        // fragment 생성
        firstPagefragment = document.createDocumentFragment(),
        prevPagefragment = document.createDocumentFragment(),
        elementfragment = document.createDocumentFragment(),
        nextfragment = document.createDocumentFragment(),
        endPagefragment5 = document.createDocumentFragment(),
        dotfragment = document.createDocumentFragment(),
        i;

    // 기존에 추가된 페이지번호를 삭제합니다
    while (paginationEl.hasChildNodes()) {
        paginationEl.removeChild(paginationEl.lastChild);
    }
    // 첫 페이지
    var firstPage = document.createElement('a');
    firstPage.href = "#";
    firstPage.innerHTML = "<<";
    // 이전 페이지
    var prevPage = document.createElement('a');
    prevPage.href = "#";
    prevPage.innerHTML = "<";
    // ..
    var dot = document.createElement('a');
    dot.innerHTML = "..";
    // 마지막 페이지
    var endPage = document.createElement('a');
    endPage.href = "#";
    endPage.innerHTML = totalPage;
    // 다음 페이지
    var nextPage = document.createElement('a');
    nextPage.href = "#";
    nextPage.innerHTML = ">";

    // pagegroup 부터 lastPage 까지 페이지 생성
    for (i = pagegroup; i <= lastPage; i++) {
        // 페이지 번호 생성
        var el = document.createElement('a');
        el.href = "#";
        el.innerHTML = i;

        // 현재 페이지일 경우 페이지 번호 className을 on으로 설정
        if (i === current) {
            el.className = 'on';
        }
        // 첫페이지를 클릭했을 때
        firstPage.onclick = (function () {
            console.log("첫페이지로 이동");
            pagegroup = 1;
            current = 1;
            lastPage = 5;
            SelectedDataPaging(data, current, pagination);
        });
        // 이전 페이지를 눌렀을 때
        prevPage.onclick = (function () {
            // 현재 페이지가 5보다 크면
            if (current > 5) {
                // endPage가 5의 배수일 때
                if (lastPage % 5 == 0) {
                    lastPage -= 5;
                }
                // endPage에서 페이지가 5개가 안될때 lastPage의 결과가 5의 배수가 되게 함
                else {
                    lastPage = totalPage - (totalPage % 5);
                }
                pagegroup -= 5;
                console.log("이전");
                current = pagegroup;
                SelectedDataPaging(data, current, pagination);
            } else {
                console.log("이전 페이지 없음");
            }
        });
        // 다음 페이지를 눌렀을 때
        nextPage.onclick = (function () {
            console.log(pagegroup);
            // lastPage에 5를 더했을 때 총 페이지보다 작은 경우
            if (lastPage + 5 < totalPage) {
                console.log("다음" + pagegroup);
                pagegroup += 5;
                lastPage += 5;
            } else {
                switch (totalPage % 5) {
                    case(2):
                    case(3):
                    case(4):
                        pagegroup = totalPage - (totalPage % 5) + 1;
                        lastPage = totalPage;
                        break;
                    case(1):
                        pagegroup += 5;
                        lastPage = totalPage;
                        break;
                    case(0):
                        pagegroup = totalPage - 4;
                        lastPage = totalPage;
                        break;
                }
                console.log("다음페이지 없음");
            }
            current = pagegroup;
            SelectedDataPaging(data, current, pagination);
        });
        // 마지막 페이지를 눌렀을 때
        endPage.onclick = (function () {
            switch (totalPage % 5) {
                // 총 페이지수가 5의 배수가 아니면
                case(1):
                case(2):
                case(3):
                case(4):
                    pagegroup = totalPage - (totalPage % 5) + 1;
                    lastPage = totalPage;
                    break;
                // 총 페이지수가 5의 배수일 때
                case(0):
                    pagegroup = totalPage - 4;
                    lastPage = totalPage;
                    break;
            }
            current = pagegroup;
            console.log(lastPage);
            // pagegroup + 4 가 총 페이지보다 작은 경우
            if (pagegroup + 4 < totalPage) {
                console.log("마지막");
                SelectedDataPaging(data, current, pagination);
            } else {
                lastPage = totalPage;
                current = totalPage;
                console.log("걸렸네");
                SelectedDataPaging(data, current, pagination);
            }
        });
        // 페이지를 클릭하면 클릭한 페이지로 이동
        el.onclick = (function (i) {
            return function () {
                current = i;
                SelectedDataPaging(data, current, pagination);
            }
        })(i);
        elementfragment.appendChild(el);
    }
    // 마지막 페이지그룹일 경우 다음 페이지와 마지막 페이지 버튼을 없앰
    if (pagegroup != 1) {
        firstPagefragment.appendChild(firstPage);
        prevPagefragment.appendChild(prevPage);
        paginationEl.appendChild(firstPagefragment);
        paginationEl.appendChild(prevPagefragment);
        paginationEl.appendChild(dotfragment);
        paginationEl.appendChild(elementfragment);
    }
    // 첫 번째 페이지그룹일 경우 이전 페이지와 첫 번째 페이지 버튼을 없앰
    if (lastPage != totalPage) {
        dotfragment.appendChild(dot);
        endPagefragment5.appendChild(endPage);
        nextfragment.appendChild(nextPage);
        paginationEl.appendChild(elementfragment);
        paginationEl.appendChild(dotfragment);
        paginationEl.appendChild(endPagefragment5);
        paginationEl.appendChild(nextfragment);
    }
}

function SelectedDataPaging(data, current, jsonPath) {
    // 페이지를 바꾸기전 열려있는 오버레이를 닫음
    closeOverlay();
    // json 데이터 불러오기
    for (var i = current * 15 - 15; i < current * 15; i++) {
        // data에 값이 존재하면 itemE에 push 함
        if (data[i] != null) {
            itemE.push(data[i]);
        } else {
            console.log("없음");
        }
    }
    displayPlaces2(itemE);
    displayPagination2(jsonPath, Math.ceil(data.length / 15), current, data);
}