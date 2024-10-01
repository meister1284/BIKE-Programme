<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자전거 여행</title>
<style>
    body {
        margin: 0; /* 기본 여백 제거 */
    }

    .main-section {
        display: flex;
        justify-content: center; /* 수평 중앙 정렬 */
        padding: 20px; /* 상하 여백 */
    }

    #container-index {
        max-width: 1200px; /* 최대 너비 설정 */
        width: 100%; /* 너비를 100%로 설정 */
        margin: 0 auto; /* 좌우 중앙 정렬 */
    }
</style>
</head>
<body>
	<jsp:include page ="header.jsp"></jsp:include>
    <section class="main-section">
    <div id="container-index">
    	<div id="notices-and-events">
	    	<div id="noticesbox">
				<h2 class="notices-title">공지사항</h2>
				<ul id="notices">
    		        <li>20XX년 XX월 XX일: 자전거 여행 프로그램 신청 안내</li>
	    	        <li>20XX년 XX월 XX일: 자전거 도로 보수작업 안내</li>
            		<li>20XX년 XX월 XX일: 자전거 안전 장비 착용 안내</li>
        	    	<li>20XX년 XX월 XX일: 전기 자전거 제한 속도 안내</li>
    	        	<li>20XX년 XX월 XX일: 인증센터 생수 보급 안내</li>
		        </ul>
	    	</div>
    		<div id="eventbox">
    			<h2 class="event-title">이벤트</h2>
    			<ul id="event">
    				<li>20XX년 XX월 XX일: 하루 40km 타면 커피 한 잔!</li>
	    			<li>20XX년 XX월 XX일: 평균 속도 15km/h 유지하고 시원한 음료도 받고!</li>
    				<li>20XX년 XX월 XX일: ○○자전거 길 옆 □□호텔 숙박비 할인 이벤트!</li>
    				<li>20XX년 XX월 XX일: 종주 첫 완주 인증하고 ◇◇아이스크림 기프티콘까지!</li>
    				<li>20XX년 XX월 XX일: 체크포인트 이벤트! (종료된 이벤트입니다.)</li>
	    		</ul>
    		</div>
	    </div>
	    <div id="galarybox">
    		<h2 class="galary-title">자전거 여행 갤러리</h2>
    		<ul id="galary">
    			<li><img src="img/sub010203_img01.jpg" alt="남한강 자전거길"></li>
	        	<li><img src="img/sub010205_img06.jpg" alt="새재 자전거길"></li>
    	    	<li><img src="img/sub010206_img03.jpg" alt="낙동강 자전거길"></li>
        		<li><img src="img/sub010208_img01.jpg" alt="영산강 자전거길"></li>
	    	</ul>
    	</div>
	    <div id="inquirebox">
    		<h2 class="inquire-title">자주 묻는 질문</h2>
        	    <ul id="inquire">
            	    <li>
                	    자전거 여행 프로그램 신청은 어떻게 하나요?
                    	<div class="answer">&#x25B6; 자전거 여행 프로그램 신청은 홈페이지의 신청 페이지에서 가능합니다.</div>
	                </li>
    	            <li>
        	            자전거 대여는 어떻게 이루어지나요?
            	        <div class="answer">&#x25B6; 자전거 대여는 미리 예약 후 현장에서 수령하시면 됩니다.</div>
                	</li>
	                <li>
    	                자전거 안전 교육은 언제 하나요?
        	            <div class="answer">&#x25B6; 자전거 안전 교육은 매월 첫째 주 토요일에 진행됩니다.</div>
            	    </li>
                	<li>
                    	프로그램 참가비는 얼마인가요?
	                    <div class="answer">&#x25B6; 프로그램 참가비는 각 프로그램에 따라 다르며, 홈페이지에서 확인하실 수 있습니다.</div>
    	            </li>
        	    </ul>
	    </div>	
	</div>
    </section>
    <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>