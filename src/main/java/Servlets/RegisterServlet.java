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

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        String email = request.getParameter("email");

        if (!password.equals(confirmPassword)) {
            String passwordMismatchError = "Passwords do not match.";
            request.setAttribute("passwordMismatchError", passwordMismatchError);
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }

        String dbUrl = "jdbc:mysql://localhost:56148/cargo";
        String dbUsername = "root";
        String dbPassword = "password";

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection(dbUrl, dbUsername, dbPassword);

            PreparedStatement checkEmailStatement = connection.prepareStatement("SELECT * FROM users WHERE email = ?");
            checkEmailStatement.setString(1, email);
            ResultSet resultSet = checkEmailStatement.executeQuery();
            if (resultSet.next()) {
                String emailError = "This email is already in use.";
                request.setAttribute("emailError", emailError);
                request.getRequestDispatcher("register.jsp").forward(request, response);
                return;
            }

            PreparedStatement insertStatement = connection.prepareStatement("INSERT INTO users (username, email, password) VALUES (?, ?, ?)");
            insertStatement.setString(1, username);
            insertStatement.setString(2, email);
            insertStatement.setString(3, password);
            insertStatement.executeUpdate();

            response.sendRedirect("index.jsp");

            insertStatement.close();
            connection.close();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            response.sendRedirect("register.jsp?error=database-error");
        }
    }
}