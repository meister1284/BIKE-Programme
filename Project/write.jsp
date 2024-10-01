<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    </style>
</head>
<body>
    <jsp:include page="header.jsp"></jsp:include>
    <section class="main-section">
    <div id="writebox">
        <form action="writeAction.jsp" method="post" id="form">
            <!-- 작성자 ID와 이메일을 숨겨진 필드로 추가 -->
            <input type="hidden" name="m_no" value="<%= session.getAttribute("m_no") %>" />
            <input type="hidden" name="m_mail" value="<%= session.getAttribute("m_mail") %>" />

            제목: <input type="text" name="title" id="wstitle" required /><br/>
            내용:<br/> <textarea name="content" required></textarea><br/>
            이미지: <input type="file" name="image" id="wsimage" /><br/>
            <input type="submit" value="저장" id="wrsave" />
        </form>
        <br>
        <a href="community.jsp" id="cma">목록으로</a>
    </div>
    </section>
    <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>