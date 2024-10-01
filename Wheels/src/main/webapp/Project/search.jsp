<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자전거 여행</title>
	<jsp:include page ="header.jsp"></jsp:include>
<style>
	.main-section {
            display: flex;
            align-items: center; /* 세로 정렬 */
            padding: 20px;
        }
        #map{
        	margin-top: 461px;
        	margin-right: 10px;
        	border: 1px solid black;
        }
</style>
</head>
<body>
    <section class="main-section">
        <div id="searchContainer">
            <input type="text" id="search" placeholder="장소 검색..." />
            <button id="searchButton">검색</button>
        </div>
        <div id="map"></div>
    </section>
    <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>