<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="common.JDBConnect" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
        .main-section {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh; /* 전체 높이를 사용하여 수직 중앙 정렬 */
            background-color: #f4f4f4;
        }
        footer{
        	position: fixed;
        }
</style>
<title>자전거 여행</title>
</head>
<body>
	<jsp:include page ="header.jsp"></jsp:include>
    <section class="main-section">
    <div id="communitybox">
    	<h1 id="cmbox">글 목록</h1>
    	<table id="community-table">
        	<tr>
            	<th>글 번호</th>
        	    <th>제목</th>
    	        <th>회원번호</th>
	            <th>작성일</th>
        	</tr>
        	<%
            	JDBConnect db = new JDBConnect();
            	Connection conn = db.con;
            	PreparedStatement pstmt = null;
            	ResultSet rs = null;

            	try {
                	pstmt = conn.prepareStatement("SELECT POST_ID, TITLE, M_NO, POST_DATE FROM TBL_COMMUNITY ORDER BY POST_ID DESC");
                	rs = pstmt.executeQuery();

                	while (rs.next()) {
                    	int postId = rs.getInt("POST_ID");
                    	String title = rs.getString("TITLE");
                	    int userNumber = rs.getInt("M_NO");
            	        Timestamp postDate = rs.getTimestamp("POST_DATE");
        	%>
        	<tr>
            	<td><%= postId %></td>
            	<td><a href="viewPost.jsp?postId=<%= postId %>"><%= title %></a></td>
            	<td><%= userNumber %></td>
        	    <td><%= postDate %></td>
    	    </tr>
	        <%
                	}
            	} catch (Exception e) {
                	e.printStackTrace();
            	} finally {
                	db.close(); // 자원 해제
            	}
        	%>
    	</table>
	    <br>
<%
    String userEmail = (String) session.getAttribute("m_mail");
%>
<% if (userEmail != null) { %>
    <a href="write.jsp" id="cma">글쓰기</a>
<% } else { %>
    <p>로그인 후 글을 작성할 수 있습니다.</p>
<% } %>
	</div>
    </section>
    <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>