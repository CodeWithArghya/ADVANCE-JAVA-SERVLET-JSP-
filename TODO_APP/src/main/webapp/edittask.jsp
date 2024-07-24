<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import = "jakarta.servlet.*, jakarta.servlet.http.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %> 
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta charset="ISO-8859-1">
<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="0" />
<title>Edit Task</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
</head>
</head>
<body class="bg-dark">
	<%
	response.setHeader("Cache-Control", "no-cache no-store must-revalidate");
	response.setHeader("Pragma","no-cache");
	response.setHeader("Expires", "0");
	if (session.getAttribute("id") == null) {
  	response.sendRedirect("login.jsp");
  	return;
	}
	%>
	<%
		//var
		String todoname = "null";
		String tododate = "null";
		String status = "null";
		int uid = (Integer) session.getAttribute("id");
		int todoid = Integer.parseInt(request.getParameter("todoid")); //taking this param from viewtodolist
		
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/todo", "root", "Arghya@2002");
		String sql = "select * from todolist where todoid=? AND id=?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, todoid);
		pstmt.setInt(2, uid);
		ResultSet rs = pstmt.executeQuery();
		
		if(rs.next()){
			todoname = rs.getString("todoname");
			tododate = rs.getString("date");
			status = rs.getString("status");
			
		}
	
	%>
	
	<div class="container">
        <h2 class="mt-4 text-center text-warning"><b>Edit Task</b></h2>
        <form id="todoEditForm" action="updateTodo" method="post">
            <input type="text" name="todoid" value="<%=todoid %>" hidden />
            <div class="row">
                <label class="text-primary">Name:</label>
                <div class="col-3">
                    <input type="text" class="form-control col-12" name="todoname" value="<%=todoname %>" required/>
                </div>
                <label class="text-light">Date:</label>
                <div class="col-3">
                    <input type="date" class="form-control col-12" name="tododate" value="<%=tododate %>" />
                </div>
                
                <div class="col-3">
                    <label class="text-warning">Status:</label>
                    <select class="form-control" name="status">
                    <option value="Pending" <%= status.equals("Pending") ? "selected" : "" %>>Pending</option>
                    <option value="Save for Later" <%= status.equals("Save for Later") ? "selected" : "" %>>Save for Later</option>
                    <option value="Task Completed" <%= status.equals("Task Completed") ? "selected" : "" %>>Task Completed</option>
                </select>
                </div>
            </div>
            <br>

            <button type="submit" class="btn btn-success col-6" onclick="confirmEdited()">Update task <i class='fas fa-pencil-alt'></i></button>
            <a href="addTodo.jsp" class="btn btn-danger ml-4">Cancel</a>
        </form>
    </div>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.js"></script>
<script>


function confirmEdited() {
    alert("Your Task Status is Updated Successfully.....");
}


</script>

</body>
</html>