<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>

<%
    List<String> coordinates = new ArrayList<>();
    Connection conn = null;
    Statement stmt = null;

    try {
        // DB 연결
        Class.forName("oracle.jdbc.OracleDriver");
        conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "musthave", "1234");

        stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT B_X AS latitude, B_Y AS longitude FROM bike_route WHERE B_Road = 7 ORDER BY B_Order");

        while (rs.next()) {
            String lat = rs.getString("latitude");
            String lon = rs.getString("longitude");
            coordinates.add(lat + "," + lon);
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        // 자원 해제
        if (stmt != null) stmt.close();
        if (conn != null) conn.close();
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>영산강자전거길</title>
    <script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=e7c99540b75455350da7b2b5f32321d3"></script>
    <script>
        function initMap() {
            // 좌표 목록
            var coordinates = [
                <% for (String coord : coordinates) { %>
                    { lat: <%= coord.split(",")[0] %>, lng: <%= coord.split(",")[1] %> },
                <% } %>
            ];

            // 지도 중심 계산
            var centerLat = (coordinates[0].lat + coordinates[coordinates.length - 1].lat) / 2;
            var centerLng = (coordinates[0].lng + coordinates[coordinates.length - 1].lng) / 2;

            var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
                mapOption = {
                    center: new kakao.maps.LatLng(centerLat, centerLng), // 지도의 중심좌표
                    level: 10 // 지도의 확대 레벨
                };

            var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

            // 경로 그리기
            var path = coordinates.map(function(coord) {
                return new kakao.maps.LatLng(coord.lat, coord.lng);
            });

            var polyline = new kakao.maps.Polyline({
                path: path,
                strokeWeight: 5, // 선의 두께
                strokeColor: '#FF0000', // 선의 색깔
                strokeOpacity: 1, // 선의 불투명도
                strokeStyle: 'solid' // 선의 스타일
            });

            polyline.setMap(map); // 지도에 선을 표시합니다
        }
    </script>
</head>
<body onload="initMap()">
    <div id="map" style="width: 100%; height: 500px;"></div>
</body>
</html>