package com.todo.login.userController;

import com.todo.login.model.User;

import jakarta.servlet.RequestDispatcher;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class userController
 */
public class userController extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter out = resp.getWriter();
        resp.setContentType("text/html");

        // Create User object and set email and password from request parameters
        User u = new User();
        u.setEmailid(req.getParameter("email"));
        u.setPassword(req.getParameter("password"));

        String query = "SELECT * FROM user WHERE email = ? AND password = ?";

        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/todo", "root", "Arghya@2002");
            pstmt = con.prepareStatement(query);

            // Set parameters using User object
            pstmt.setString(1, u.getEmailid());
            pstmt.setString(2, u.getPassword());
            rs = pstmt.executeQuery();

            if (rs.next()) {
            	HttpSession session = req.getSession();
            	session.setAttribute("id", rs.getInt("id"));
                session.setAttribute("fullname", rs.getString("name"));
                
                resp.sendRedirect("dashboard.jsp");
                
            } else {
                out.println("Invalid email or password");
                RequestDispatcher rd = req.getRequestDispatcher("login.jsp");
                rd.include(req, resp);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (con != null) con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
