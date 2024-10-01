<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>header</title>
    <link rel="stylesheet" href="style.css" />
    <script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e7c99540b75455350da7b2b5f32321d3&libraries=services,clusterer,drawing"></script>
    <script src="myProjectAPI.js"></script>
    <script src="jQuery3.7.1.js"></script>
</head>
<body>
    <header>
    <div class="logo" >
        <img src="img/logo.png" alt="로고"/>
    </div>
        <a href="index.jsp" class="underline">HOME</a>
        <a href="search.jsp" class="underline">SEARCH</a>
        <a href="community.jsp" class="underline">COMMUNITY</a>
        <a href="route.jsp" class="underline">ROUTE</a>
	<div id="headerbt">
        <% if (session.getAttribute("m_no") != null) { %>
            <!-- 로그인된 상태 -->
            <button onclick="location.href='logout.jsp'" class="registerbt">로그아웃</button>
        <% } else { %>
            <!-- 로그인되지 않은 상태 -->
            <button class="registerbt" onclick="location.href='register.jsp'">회원가입</button>
            <button onclick="location.href='login.jsp'" class="loginbt">로그인</button>
        <% } %>
	</div>
    </header>
</body>
</html>
