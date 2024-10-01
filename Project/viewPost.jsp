<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    </style>
    <title>게시글 보기</title>
</head>
<body>
    <jsp:include page="header.jsp"></jsp:include>
    <section class="main-section">
        <div id="postbox">
            <%
                String postIdStr = request.getParameter("postId");
                if (postIdStr != null) {
                    int postId = Integer.parseInt(postIdStr);
                    JDBConnect db = new JDBConnect();
                    Connection conn = db.con;
                    PreparedStatement pstmt = null;
                    ResultSet rs = null;

                    try {
                        // 게시글 조회
                        pstmt = conn.prepareStatement("SELECT TITLE, CONTENT, M_NO, POST_DATE FROM TBL_COMMUNITY WHERE POST_ID = ?");
                        pstmt.setInt(1, postId);
                        rs = pstmt.executeQuery();

                        if (rs.next()) {
                            String title = rs.getString("TITLE");
                            String content = rs.getString("CONTENT");
                            String m_no = rs.getString("M_NO");
                            Timestamp postDate = rs.getTimestamp("POST_DATE");
            %>
            <h1 id="viewtitle"><%= title %></h1>
            <p id="viewtext">작성자: <%= m_no %></p>
            <p id="viewtext">작성일: <%= postDate %></p>
            <p><%= content %></p>
            <%
                        } else {
                            out.println("<p>해당 게시글을 찾을 수 없습니다.</p>");
                        }

                        // 댓글 조회
                        pstmt = conn.prepareStatement("SELECT M_NO, CONTENT, COMMENT_DATE FROM TBL_COMMENTS WHERE POST_ID = ? ORDER BY COMMENT_DATE DESC");
                        pstmt.setInt(1, postId);
                        rs = pstmt.executeQuery();

                        while (rs.next()) {
                            String commentMNo = rs.getString("M_NO");
                            String commentContent = rs.getString("CONTENT");
                            Timestamp commentDate = rs.getTimestamp("COMMENT_DATE");
            %>
            <div class="comment">
                <p class="commentp"><strong><%= commentMNo %></strong> <%= commentDate %></p>
                <p><%= commentContent %></p>
            </div>
            <%
                        }

                        // 댓글 작성 폼
                        if (session.getAttribute("m_mail") != null) { // 로그인 여부 확인
            %>
            <div id="commentbox">
                <form action="addComment.jsp" method="post">
                    <input type="hidden" name="postId" value="<%= postId %>">
                    <textarea name="content" rows="4" cols="50" required></textarea><br>
                    <input class="commentbt" type="submit" value="댓글 달기">
                </form>
            </div>
            <%
                        } else {
                            out.println("<p>로그인 후 댓글을 달 수 있습니다.</p>");
                        }
                    } catch (SQLException e) {
                        e.printStackTrace();
                    } finally {
                        db.close();
                    }
                } else {
                    out.println("<p>잘못된 요청입니다.</p>");
                }
            %>
            <br>
            <div class="button-container">
                <a href="community.jsp" id="viewreturn">목록으로 돌아가기</a>
            </div>
        </div>
    </section>
    <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
