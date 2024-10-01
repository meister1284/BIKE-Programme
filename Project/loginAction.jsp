<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="common.HashUtil"%>
<%@page import="java.sql.*"%>
<%@ page import="common.JDBConnect" %>

<%
    String mMail = request.getParameter("m_mail");
    String mPwd = request.getParameter("m_pwd");
    
    String hashedPwd = HashUtil.hashPassword(mPwd);

    JDBConnect db = new JDBConnect();  // JDBConnect 객체 생성
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        // SQL 쿼리 작성
        String sql = "SELECT m_no FROM tbl_bike_member WHERE m_mail = ? AND m_pwd = ?";
        pstmt = db.con.prepareStatement(sql);
        pstmt.setString(1, mMail);
        pstmt.setString(2, hashedPwd); // 비밀번호는 해시 처리 후 사용해야 함

        rs = pstmt.executeQuery();

        if (rs.next()) {
            // 로그인 성공
            int mNo = rs.getInt("m_no");
            session.setAttribute("m_no", mNo);
            session.setAttribute("m_mail", mMail);
            response.sendRedirect("index.jsp"); // 로그인 성공 후 리다이렉트할 페이지
        } else {
            // 로그인 실패
            response.sendRedirect("login.jsp?error=1"); // 로그인 실패 시 다시 로그인 페이지로 리다이렉트
        }
    } catch (SQLException e) {
        out.println("<p>SQL 오류: " + e.getMessage() + "</p>");
    } catch (Exception e) {
        out.println("<p>오류: " + e.getMessage() + "</p>");
    } finally {
        // 자원 해제
        if (rs != null) {
            try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
        }
        if (pstmt != null) {
            try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
        }
        db.close();  // JDBConnect 자원 해제
    }
%>
