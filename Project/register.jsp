<%@page import="common.HashUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@ page import="common.JDBConnect" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자전거 여행</title>
</head>
<body>
	<jsp:include page ="header.jsp"></jsp:include>
    <section class="main-section">
    	<div id=registerbox>
    		
			<form method="post" action="register.jsp" class="register-form">
    			<label for="m_name">이름:</label>
    			<input type="text" name="m_name" id="m_name" class="register-input" required><br>
    
    			<label for="m_mail">이메일:</label>
    			<input type="email" name="m_mail" id="m_mail" class="register-input" required><br>
    
			    <label for="m_phone">전화번호:</label>
    			<input type="text" name="m_phone" id="m_phone" class="register-input" required><br>

			    <label for="m_pwd">비밀번호:</label>
    			<input type="password" name="m_pwd" id="m_pwd" class="register-input" required><br>
    
    			<input type="submit" value="가입" class="register-button">
			</form>

    		 <%
                if (request.getMethod().equalsIgnoreCase("POST")) {
                    String mName = request.getParameter("m_name");
                    String mMail = request.getParameter("m_mail");
                    String mPhone = request.getParameter("m_phone");
                    String mPwd = request.getParameter("m_pwd");
                    
                    String hashedPwd = HashUtil.hashPassword(mPwd);

                    JDBConnect db = new JDBConnect();  // JDBConnect 객체 생성
                    PreparedStatement pstmt = null;
                    Statement stmt = null;
                    ResultSet rs = null;

                    try {
                        // 시퀀스에서 다음 값을 가져오기
                        String sql = "SELECT MEMBER_NUMBER.NEXTVAL FROM dual";
                        stmt = db.con.createStatement();
                        rs = stmt.executeQuery(sql);
                        int memberNo = 0;

                        if (rs.next()) {
                            memberNo = rs.getInt(1); // 시퀀스 값
                        }

                        // 6자리 형식으로 변환
                        String formattedMemberNo = String.format("%06d", memberNo);

                        // SQL 쿼리 작성
                        String insertSql = "INSERT INTO TBL_BIKE_MEMBER (M_NO, M_NAME, M_MAIL, M_PHONE, M_PWD) VALUES (?, ?, ?, ?, ?)";
                        pstmt = db.con.prepareStatement(insertSql);
                        pstmt.setString(1, formattedMemberNo); // 형식화된 회원 번호 사용
                        pstmt.setString(2, mName);
                        pstmt.setString(3, mMail);
                        pstmt.setString(4, mPhone);
                        pstmt.setString(5, hashedPwd);

                        int rowsAffected = pstmt.executeUpdate();
                        if (rowsAffected > 0) {
                            out.println("<p>회원 가입이 완료되었습니다!</p>");
                        } else {
                            out.println("<p>회원 가입에 실패했습니다.</p>");
                        }
                    } catch (Exception e) {
                        out.println("<p>오류: " + e.getMessage() + "</p>");
                    } finally {
                        if (rs != null) {
                            try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
                        }
                        if (stmt != null) {
                            try { stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
                        }
                        if (pstmt != null) {
                            try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
                        }
                        db.close();  // 자원 해제
                    }
                }
            %>
    	</div>
    </section>
    <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>