package Servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/HomeServlet")
public class HomeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String userId = (String) session.getAttribute("userId");
        String username = (String) session.getAttribute("username");
        String email = (String) session.getAttribute("email");

        if (userId == null || username == null || email == null) {
            getUserInfoFromDatabase(request);
        }

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        out.println("<html><head><title>Hello Servlet</title></head><body>");
        out.println("<h2>Hello, " + username + "!</h2>");
        out.println("</body></html>");
    }

    private void getUserInfoFromDatabase(HttpServletRequest request) {
        HttpSession session = request.getSession();
        String userId = (String) session.getAttribute("userId");
        String username = (String) session.getAttribute("username");
        String email = (String) session.getAttribute("email");

        if (userId == null || username == null || email == null) {
            String dbUrl = "jdbc:mysql://localhost:56148/cargo";
            String dbUsername = "root";
            String dbPassword = "password";

            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection connection = DriverManager.getConnection(dbUrl, dbUsername, dbPassword);
                PreparedStatement statement = connection.prepareStatement("SELECT id, username, email FROM users WHERE email = ?");
                statement.setString(1, (String) session.getAttribute("email"));

                ResultSet rs = statement.executeQuery();
                if (rs.next()) {
                    userId = rs.getString("id");
                    username = rs.getString("username");
                    email = rs.getString("email");

                    session.setAttribute("userId", userId);
                    session.setAttribute("username", username);
                    session.setAttribute("email", email);
                }

                rs.close();
                statement.close();
                connection.close();
            } catch (ClassNotFoundException | SQLException e) {
                e.printStackTrace();
                userId = "Guest";
                username = "Guest";
                email = "guest@example.com";
            }
        }
    }
}
