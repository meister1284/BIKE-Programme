<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>자전거 여행</title>
  <script>
        function handleMouseOver(image) {
            image.src = image.src.replace('-off.png', '-on.png');
        }

        function handleMouseOut(image) {
            image.src = image.src.replace('-on.png', '-off.png');
        }

        function showMap(page) {
            var mapElement = document.getElementById('map');
            mapElement.innerHTML = ""; // 이전 내용 지우기

            // iframe을 생성하여 지도 로드
            var iframe = document.createElement('iframe');
            iframe.src = page;
            iframe.style.width = '100%';
            iframe.style.height = '600px'; // 원하는 높이 설정
            iframe.frameBorder = '0';
            mapElement.appendChild(iframe);
        }
    </script>
</head>
<body>
    <jsp:include page ="header.jsp"></jsp:include>
    <section class="main-section">
    <div class="containerbt">
        <div class="bt_box">
        
            <button class="bt_view" onclick="showMap('araPath.jsp')">
                <img alt="아라자전거길" src="img/icons8-bicycle-off.png" 
                     onmouseover="handleMouseOver(this)" onmouseout="handleMouseOut(this)">아라자전거길
            </button>
            <button class="bt_view" onclick="showMap('saejaePath.jsp')">
                <img alt="새재자전거길" src="img/icons8-bicycle-off.png" 
                     onmouseover="handleMouseOver(this)" onmouseout="handleMouseOut(this)">새재자전거길
            </button>
            <button class="bt_view" onclick="showMap('nakdongPath.jsp')">
                <img alt="낙동강자전거길" src="img/icons8-bicycle-off.png" 
                     onmouseover="handleMouseOver(this)" onmouseout="handleMouseOut(this)">낙동강자전거길
            </button>
            <button class="bt_view" onclick="showMap('geumPath.jsp')">
                <img alt="금강자전거길" src="img/icons8-bicycle-off.png" 
                     onmouseover="handleMouseOver(this)" onmouseout="handleMouseOut(this)">금강자전거길
            </button>
            <button class="bt_view" onclick="showMap('yeongsanPath.jsp')">
                <img alt="영산강자전거길" src="img/icons8-bicycle-off.png" 
                     onmouseover="handleMouseOver(this)" onmouseout="handleMouseOut(this)">영산강자전거길
            </button>
            <button class="bt_view" onclick="showMap('seomjinPath.jsp')">
                <img alt="섬진강자전거길" src="img/icons8-bicycle-off.png" 
                     onmouseover="handleMouseOver(this)" onmouseout="handleMouseOut(this)">섬진강자전거길
            </button>
            <button class="bt_view" onclick="showMap('gyeongbukPath.jsp')">
                <img alt="동해안(경북)자전거길" src="img/icons8-bicycle-off.png" 
                     onmouseover="handleMouseOver(this)" onmouseout="handleMouseOut(this)">동해안(경북)자전거길
            </button>
            <button class="bt_view" onclick="showMap('fantasyPath.jsp')">
                <img alt="환상자전거길" src="img/icons8-bicycle-off.png" 
                     onmouseover="handleMouseOver(this)" onmouseout="handleMouseOut(this)">환상자전거길
            </button>
        </div>
       
                <div id="map"></div> <!-- 지도를 표시할 영역 -->
                 </div>
    </section>
    <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
