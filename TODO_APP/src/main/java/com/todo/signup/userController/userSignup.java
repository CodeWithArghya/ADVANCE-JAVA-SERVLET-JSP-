package com.todo.signup.userController;
import com.todo.login.model.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class userSignup
 */
public class userSignup extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		User u = new User();
		u.setEmailid(request.getParameter("email"));
		u.setPassword(request.getParameter("password"));
		u.setFullname(request.getParameter("fullname"));
		u.setGender(request.getParameter("gender"));
		u.setCountry(request.getParameter("country"));
		
		String query = "INSERT INTO user(email,password,name,gender,country)values(?,?,?,?,?)";
		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/todo", "root", "Arghya@2002");
			PreparedStatement pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, u.getEmailid());
			pstmt.setString(2, u.getPassword());
			pstmt.setString(3, u.getFullname());
			pstmt.setString(4, u.getGender());
			pstmt.setString(5, u.getCountry());
			
			int status = pstmt.executeUpdate();
			
			if(status!=0) {
				response.sendRedirect("login.jsp");
				
			}else {
				out.println("<h2>Something went wrong... Try Again</h1>");
				response.sendRedirect("signup.jsp");
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}

}
