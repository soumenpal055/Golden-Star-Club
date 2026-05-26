package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/feedback")
public class FeedbackServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        String name = request.getParameter("name");
        String mobile = request.getParameter("mobile");
        String email = request.getParameter("email");
        String message = request.getParameter("message");
        PrintWriter out = response.getWriter();

        if (name == null || name.trim().isEmpty() || 
            mobile == null || !mobile.matches("\\d{10,12}") ||
            email == null || !email.matches("^[A-Za-z0-9+_.-]+@(.+)$") ||
            message == null || message.trim().isEmpty()) {
            
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            out.print("{\"status\":\"error\", \"message\":\"Invalid input data.\"}");
            out.flush();
            return;
        }

        String sql = "INSERT INTO feedback_goldenstarclub_page(name, mobile, email, message) VALUES (?, ?, ?, ?)";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setString(1, name.trim());
            pstmt.setString(2, mobile.trim());
            pstmt.setString(3, email.trim());
            pstmt.setString(4, message.trim());
            
            int rowsAffected = pstmt.executeUpdate();
            
            if (rowsAffected > 0) {
                out.print("{\"status\":\"success\", \"message\":\"Feedback submitted successfully!\"}");
            } else {
                response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                out.print("{\"status\":\"error\", \"message\":\"Failed to submit feedback.\"}");
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            out.print("{\"status\":\"error\", \"message\":\"Database error occurred.\"}");
        } finally {
            out.flush();
            out.close();
        }
    }
}
