package Servlets;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String fullName = request.getParameter("full_name");
        String dob = request.getParameter("dob");
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirm_password");
        
       
        if (!password.equals(confirmPassword)) {
            response.sendRedirect("register.html?error=Passwords do not match");
            return;
        }

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/noteskeeper", "root", "root");
            PreparedStatement ps = con.prepareStatement("INSERT INTO users (full_name, dob, username, email, password) VALUES (?, ?, ?, ?, ?)");
            ps.setString(1, fullName);
            ps.setString(2, dob);
            ps.setString(3, username);
            ps.setString(4, email);
            ps.setString(5, password);
            int result = ps.executeUpdate();

            if (result > 0) {
                response.sendRedirect("login.html");
            } else {
                response.sendRedirect("register.html?error=Registration failed");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("register.html?error=An error occurred");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

 }
