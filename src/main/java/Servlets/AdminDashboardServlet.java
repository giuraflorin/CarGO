package Servlets;

import java.io.IOException;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/AdminDashboardServlet")
public class AdminDashboardServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if (action != null) {
            switch (action) {
                case "viewUsers":
                    response.sendRedirect("view-users.jsp");
                    break;
                case "manageUsers":
                    response.sendRedirect("manage-users.jsp");
                    break;
                case "addCars":
                    response.sendRedirect("add-cars.jsp");
                    break;
                case "manageCars":
                    response.sendRedirect("manage-cars.jsp");
                    break;
                case "viewReservations":
                    response.sendRedirect("view-reservations.jsp");
                    break;
                case "manageReservations":
                    response.sendRedirect("manage-reservations.jsp");
                    break;
                
                default:
                 
                    response.sendRedirect("admin-home.jsp");
                    break;
            }
        } else {
            
            response.sendRedirect("admin-home.jsp");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }
}