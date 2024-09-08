package Servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/ReservationServlet")
public class ReservationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int userId = Integer.parseInt(request.getParameter("userId"));
        String userEmail = request.getParameter("userEmail");
        String carBrand = request.getParameter("carBrand");
        String carModel = request.getParameter("carModel");
        int carId = Integer.parseInt(request.getParameter("carId"));
        String airport = request.getParameter("airport");
        String dropOff = request.getParameter("dropOff");
        String validFrom = request.getParameter("validFrom");
        String validTo = request.getParameter("validTo");
        double totalAmount = Double.parseDouble(request.getParameter("totalAmount"));

        String dbUrl = "jdbc:mysql://localhost:56148/cargo";
        String dbUsername = "root";
        String dbPassword = "password";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            try (Connection connection = DriverManager.getConnection(dbUrl, dbUsername, dbPassword)) {
                String sql = "INSERT INTO reservations (userId, userEmail, carBrand, carModel, carId, airport, dropOff, VALID_FROM_DTTM, VALID_TO_DTTM, totalAmount) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
                try (PreparedStatement statement = connection.prepareStatement(sql)) {
                    statement.setInt(1, userId);
                    statement.setString(2, userEmail);
                    statement.setString(3, carBrand);
                    statement.setString(4, carModel);
                    statement.setInt(5, carId);
                    statement.setString(6, airport);
                    statement.setString(7, dropOff);
                    statement.setString(8, validFrom);
                    statement.setString(9, validTo);
                    statement.setDouble(10, totalAmount);

                    statement.executeUpdate();
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

        response.sendRedirect("profile.jsp"); 
    }
}