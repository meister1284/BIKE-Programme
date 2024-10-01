<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="common.JDBConnect" %>  

<%
    String postIdStr = request.getParameter("postId");
    String content = request.getParameter("content");
    Integer m_no = (Integer) session.getAttribute("m_no");

    if (postIdStr != null && content != null && m_no != null) {
        int postId = Integer.parseInt(postIdStr);
        JDBConnect db = new JDBConnect();
        Connection conn = db.con;
        PreparedStatement pstmt = null;

        try {
            pstmt = conn.prepareStatement("INSERT INTO TBL_COMMENTS (POST_ID, M_NO, CONTENT) VALUES (?, ?, ?)");
            pstmt.setInt(1, postId);
            pstmt.setInt(2, m_no);;
            pstmt.setString(3, content);
            pstmt.executeUpdate();

            response.sendRedirect("viewPost.jsp?postId=" + postId); // 댓글 작성 후 게시글 보기로 리디렉션
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            db.close();
        }
    } else {
        out.println("<p>잘못된 요청입니다.</p>");
    }
%>