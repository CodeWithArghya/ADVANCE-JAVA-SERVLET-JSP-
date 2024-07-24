package com.todo.review.Feedback;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class feedback
 */
public class feedback extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		String email = request.getParameter("email");
		String fullname = request.getParameter("fullname");
		String gender = request.getParameter("gender");
		String country = request.getParameter("country");
		String message = request.getParameter("message");
		String userrole = request.getParameter("userrole");
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/todo", "root", "Arghya@2002");
			String sql = "INSERT INTO feedback(email,fullname,gender,country,feedback,user) VALUES(?,?,?,?,?,?)";
			PreparedStatement pstmt = con.prepareCall(sql);
			pstmt.setString(1, email);
			pstmt.setString(2, fullname);
			pstmt.setString(3, gender);
			pstmt.setString(4, country);
			pstmt.setString(5, message);
			pstmt.setString(6, userrole);
			int rs = pstmt.executeUpdate();
			
			if(rs > 0) {
				request.setAttribute("name", fullname);
				RequestDispatcher rd = request.getRequestDispatcher("success.jsp");
				rd.forward(request, response);
			}else {
				out.println("<h3 style='color:red'> Something Went Wrong.... </h3>");
			}
		}catch(Exception e) {
			out.println("Something went wrong..... " + e.getMessage());
			e.printStackTrace();
		}
		
	}

}
