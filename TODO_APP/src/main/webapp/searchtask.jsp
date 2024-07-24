<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Pending Task</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
</head>
<body class="bg-dark">
<%
if (session.getAttribute("id") == null) {
  response.sendRedirect("login.jsp");
  return;
}
%>
<div class="container m-auto">
    <h1 class="text-center text-warning mt-4">Your all Pending Task List </h1>
    <p class="text-center text-light"><b>These all task are pending right now...</b></p>
    <table class="table table-hover table-warning">
        <thead>
            <tr>
                
                <th scope="col"class="text-center text-success">Task Name</th>
                <th scope="col"class="text-center text-warning">Target Date</th>
                <th scope="col"class="text-center text-info">Current Status</th>
                
            </tr>
        </thead>
        <tbody>
            <%
                Connection con = null;
                PreparedStatement pstmt = null;
                ResultSet rs = null;
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/todo", "root", "Arghya@2002");
                    String query = "SELECT * FROM todolist WHERE id = ? AND status='pending'";
                    int id = (Integer) session.getAttribute("id");
                    pstmt = con.prepareStatement(query);
                    pstmt.setInt(1, id);
                    rs = pstmt.executeQuery();
                    while (rs.next()) {
                        int todoid = rs.getInt("todoid");
                        String todoname = rs.getString("todoname");
                        String date = rs.getString("date");
                        String status = rs.getString("status");
                        
            %>
            <tr>
                
                <td class="text-center text-dark"><b><%= todoname %></b></td>
                <td class="text-center text-info"><b><%= date %></b></td>
                <td id="sts" class="<%= status.equals("Pending") ? "text-danger" : "text-warning" %> text-center"><b><%= status %></b></td>
                
            </tr>
            <%
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    try {
                        if (rs != null) rs.close();
                        if (pstmt != null) pstmt.close();
                        if (con != null) con.close();
                    } catch (SQLException se) {
                        se.printStackTrace();
                    }
                }
            %>
        </tbody>
    </table>
    
    <a href="dashboard.jsp" class="btn btn-success">Back to Dashboard</a>
</div>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.js"></script>

</body>
</html>
