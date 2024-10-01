document.addEventListener('DOMContentLoaded', function() {
    const mapContainer = document.getElementById('map');
    const mapOptions = {
        center: new kakao.maps.LatLng(35.15972, 126.85306), // 초기 위치
        level: 3 // 초기 확대 수준
    };

    const map = new kakao.maps.Map(mapContainer, mapOptions);
    const markers = [];

    document.getElementById('searchButton').onclick = function () {
        const keyword = document.getElementById('search').value;
        searchPlaces(keyword);
    };

    function searchPlaces(keyword) {
        const ps = new kakao.maps.services.Places(); // 장소 검색 객체
        ps.keywordSearch(keyword, placesSearchCB);
    }

    function placesSearchCB(data, status, pagination) {
        if (status === kakao.maps.services.Status.OK) {
            clearMarkers(); // 이전 마커 지우기
            for (let i = 0; i < data.length; i++) {
                const place = data[i];
                displayMarker(place);
            }
        } else {
            alert('장소를 찾을 수 없습니다.');
        }
    }

    function displayMarker(place) {
        const position = new kakao.maps.LatLng(place.y, place.x);
        const marker = new kakao.maps.Marker({
            map: map,
            position: position
        });

        markers.push(marker); // 마커 배열에 추가

        // 클릭 시 인포윈도우 표시
        kakao.maps.event.addListener(marker, 'click', function () {
            const infowindow = new kakao.maps.InfoWindow({
                content: `<div>${place.place_name}</div>`
            });
            infowindow.open(map, marker);
        });

        map.setCenter(position); // 마커 위치로 맵 이동
    }

    function clearMarkers() {
        for (let i = 0; i < markers.length; i++) {
            markers[i].setMap(null); // 마커 제거
        }
        markers.length = 0; // 마커 배열 초기화
    }
});
