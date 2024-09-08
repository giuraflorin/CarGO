package Servlets;

import java.io.IOException;
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

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String dbUrl = "jdbc:mysql://localhost:56148/cargo";
        String dbUsername = "root";
        String dbPassword = "password";
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection(dbUrl, dbUsername, dbPassword);
            PreparedStatement statement = connection.prepareStatement("SELECT * FROM users WHERE email = ?");
            statement.setString(1, email);
            ResultSet rs = statement.executeQuery();

            if (rs.next()) {
                String dbStoredPassword = rs.getString("password");
                if (password.equals(dbStoredPassword)) {
                    String username = rs.getString("username");
                    HttpSession session = request.getSession();
                    session.setAttribute("username", username);
                    response.sendRedirect("home.jsp");
                } else {
                    request.setAttribute("error", "Invalid credentials");
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                }
            } else {
                request.setAttribute("error", "Email does not exist");
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }

            rs.close();
            statement.close();
            connection.close();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            response.sendRedirect("index.jsp?error=database-error");
        }
    }
}
