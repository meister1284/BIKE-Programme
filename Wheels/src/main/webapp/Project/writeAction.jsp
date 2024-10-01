<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="common.JDBConnect" %>  

<%
    String title = request.getParameter("title");
    String content = request.getParameter("content");
    String userEmail = (String) session.getAttribute("m_mail"); // m_mail로 변경
    Integer m_no = (Integer) session.getAttribute("m_no");
    
    JDBConnect db = new JDBConnect();
    Connection conn = db.con;
    PreparedStatement pstmt = null;

    try {
    	pstmt = conn.prepareStatement("INSERT INTO TBL_COMMUNITY (POST_ID, TITLE, CONTENT, M_NO, M_MAIL) VALUES (POST_SEQ.NEXTVAL, ?, ?, ?, ?)");
        pstmt.setString(1, title);
        pstmt.setString(1, title);
        pstmt.setString(2, content);
        pstmt.setInt(3, m_no);
        pstmt.setString(4, userEmail);
        pstmt.executeUpdate();

        response.sendRedirect("community.jsp"); // 작성 후 목록 페이지로 리다이렉트
    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        db.close();
    }
%>
