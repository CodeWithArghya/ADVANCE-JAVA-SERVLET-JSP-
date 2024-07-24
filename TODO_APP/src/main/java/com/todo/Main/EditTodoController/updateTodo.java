package com.todo.Main.EditTodoController;

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
 * Servlet implementation class updateTodo
 */
public class updateTodo extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String todoname = request.getParameter("todoname");
		String tododate = request.getParameter("tododate");
		String status = request.getParameter("status");
		int todoid = Integer.parseInt(request.getParameter("todoid"));
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/todo", "root", "Arghya@2002");
			String sql = "UPDATE todolist SET todoname=?,date=?,status=? WHERE todoid=?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, todoname);
			pstmt.setString(2, tododate);
			pstmt.setString(3, status);
			pstmt.setInt(4, todoid);
			int rs = pstmt.executeUpdate();
			
			if(rs !=0) {
				response.sendRedirect("addTodo.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
			out.println("Something Went Wrong..... " + e.getMessage());
			
		}
	}

}
