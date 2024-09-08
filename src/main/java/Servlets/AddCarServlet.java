package Servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/AddCarServlet")
public class AddCarServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String brand = request.getParameter("brand");
        String model = request.getParameter("model");
        String engine = request.getParameter("engine");
        String carType = request.getParameter("carType");
        String fuelType = request.getParameter("fuelType");
        int seats = Integer.parseInt(request.getParameter("seats"));
        String transmission = request.getParameter("transmission");
        double dailyPrice = Double.parseDouble(request.getParameter("dailyPrice"));
        String imageUrl = request.getParameter("imageUrl");

        String dbUrl = "jdbc:mysql://localhost:56148/cargo";
        String dbUsername = "root";
        String dbPassword = "password";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection connection = DriverManager.getConnection(dbUrl, dbUsername, dbPassword)) {
                String insertQuery = "INSERT INTO cars (brand, model, engine, carType, fuelType, seats, transmission, dailyPrice, imageUrl) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
                try (PreparedStatement insertStatement = connection.prepareStatement(insertQuery)) {
                    insertStatement.setString(1, brand);
                    insertStatement.setString(2, model);
                    insertStatement.setString(3, engine);
                    insertStatement.setString(4, carType);
                    insertStatement.setString(5, fuelType);
                    insertStatement.setInt(6, seats);
                    insertStatement.setString(7, transmission);
                    insertStatement.setDouble(8, dailyPrice);
                    insertStatement.setString(9, imageUrl);

                    insertStatement.executeUpdate();
                }

                response.sendRedirect("manage-cars.jsp"); 
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error adding car: " + e.getMessage());
        }
    }
}
