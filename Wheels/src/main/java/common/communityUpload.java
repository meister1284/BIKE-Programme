package common;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;

@WebServlet("/communityUpload") // URL 매핑
@MultipartConfig // 멀티파트 설정
public class communityUpload extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String m_no = request.getParameter("m_no");
        String m_mail = request.getParameter("m_mail");
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        Part imagePart = request.getPart("image");

        JDBConnect db = new JDBConnect();
        Connection conn = db.con;
        PreparedStatement pstmt = null;
        InputStream imageStream = null;

        try {
            if (imagePart != null && imagePart.getSize() > 0) {
                imageStream = imagePart.getInputStream();
            }

            int mNoInt = Integer.parseInt(m_no);
            
            pstmt = conn.prepareStatement("INSERT INTO TBL_COMMUNITY (POST_ID, M_NO, M_MAIL, TITLE, CONTENT, IMAGE) VALUES (POST_SEQ.NEXTVAL, ?, ?, ?, ?, ?)");
            pstmt.setInt(1, mNoInt);
            pstmt.setString(2, m_mail);
            pstmt.setString(3, title);
            pstmt.setString(4, content);
            pstmt.setBlob(5, imageStream);
            pstmt.executeUpdate();

            response.sendRedirect(request.getContextPath() + "/Project/community.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (imageStream != null) try { imageStream.close(); } catch (IOException e) {}
            db.close(); // 자원 해제
        }
    }
}
