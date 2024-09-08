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

@WebServlet("/AddReservationServlet")
public class AddReservationServlet extends HttpServlet {
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
                String insertQuery = "INSERT INTO reservations (userId, userEmail, carBrand, carModel, carId, airport, dropOff, VALID_FROM_DTTM, VALID_TO_DTTM, totalAmount) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
                try (PreparedStatement insertStatement = connection.prepareStatement(insertQuery)) {
                    insertStatement.setInt(1, userId);
                    insertStatement.setString(2, userEmail);
                    insertStatement.setString(3, carBrand);
                    insertStatement.setString(4, carModel);
                    insertStatement.setInt(5, carId);
                    insertStatement.setString(6, airport);
                    insertStatement.setString(7, dropOff);
                    insertStatement.setString(8, validFrom);
                    insertStatement.setString(9, validTo);
                    insertStatement.setDouble(10, totalAmount);
                    insertStatement.executeUpdate();
                }

                response.sendRedirect("manage-reservations.jsp");
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error adding reservation: " + e.getMessage());
        }
    }
}
