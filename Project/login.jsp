<%@page import="common.HashUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@ page import="common.JDBConnect" %>  

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>자전거 여행</title>
    <style>
        .main-section {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh; /* 전체 높이를 사용하여 수직 중앙 정렬 */
            background-color: #f4f4f4;
        }

        p {
            text-align: center;
            color: #ff0000; /* 오류 메시지 색상 */
        }
    </style>
</head>
<body>
    <jsp:include page="header.jsp"></jsp:include>
    <section class="main-section">
        <div id="loginbox">
            <h1 class="logname">로그인</h1>
            <form action="loginAction.jsp" method="post">
                <label id="loglabel" for="m_mail">이메일:</label>
                <input class="logmail" type="email" id="m_mail" name="m_mail" required>
                <br>
                <label id="loglabel" for="m_pwd">비밀번호:</label>
                <input class="logpwd" type="password" id="m_pwd" name="m_pwd" required>
                <br>
                <input id="loglabel1" class="logsubmit" type="submit" value="로그인">
            </form>
        </div>
    </section>
    <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
