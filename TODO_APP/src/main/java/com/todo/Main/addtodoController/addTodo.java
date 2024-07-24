package com.todo.Main.addtodoController;

import com.todo.Main.TodoModel.Todo;
import com.todo.login.model.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Types;
import java.text.SimpleDateFormat;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


public class addTodo extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        
        
        Todo todo = new Todo();
 
        todo.setTodoname(request.getParameter("todoname"));
        String dateStr = request.getParameter("tododate");
        if (dateStr != null && !dateStr.isEmpty()) {
            todo.setDate(dateStr);
        }
        todo.setStatus(request.getParameter("status"));
        
        String query = "INSERT INTO todolist(todoid, todoname,date,status,id) VALUES (?, ?, ?, ?,?)";

        try {
        	Class.forName("com.mysql.cj.jdbc.Driver");
        
        	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/todo", "root", "Arghya@2002");
             PreparedStatement pstmt = con.prepareStatement(query);
        	pstmt.setInt(1, todo.getId());
            pstmt.setString(2, todo.getTodoname());
            String dateStr1 = request.getParameter("tododate");
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			java.util.Date date = sdf.parse(dateStr1);
			todo.setDate(date);
			pstmt.setString(3, dateStr1);
            pstmt.setString(4, todo.getStatus());
            int id = (Integer)session.getAttribute("id");
            pstmt.setInt(5, id);
            
            int status = pstmt.executeUpdate();

            if (status != 0) {
            	response.sendRedirect("addTodo.jsp");
            } else {
                out.println("Something went wrong...");
                response.sendRedirect("addTodo.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
            out.println("Exception: " + e.getMessage());
        }
    }
}
