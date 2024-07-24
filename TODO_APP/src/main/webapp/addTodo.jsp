<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %> 
<%@ page errorPage="error.jsp" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="0" />
<title>Add Task</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
</head>
<%
response.setHeader("Cache-Control", "no-cache no-store must-revalidate");
response.setHeader("Pragma","no-cache");
response.setHeader("Expires", "0");
if (session.getAttribute("id") == null) {
  response.sendRedirect("login.jsp");
  return;
}
%>
<body id="all" class="bg-dark">
	<h1 class="text-center text-warning mt-4">Add a task </h1>
	<p class="text-center text-light"><marquee><b>Now add task in the list, Edit the task name, data and update the current status when it is completed. Also delete the task when required..</b></marquee></p>
	
	<div class="container m-auto">
	<form id="todoform" action="addTodo" method="post">
	
	<div class="row">
	<label class="text-primary" >Name:</label> 
	<div class="col-3">
	<input type="text" class="form-control col-12" placeholder="Enter Task Name" name="todoname" required/>
	</div>
	<label class="text-light" >Date:</label> 
	<div class="col-3">
	<input type="date" class="form-control col-12"  name="tododate" />
	</div>
	
	<div class="col-3">
	<label class="text-warning" >Status:</label> 
	<select class="form control" name="status">
	<option value="Pending">Pending</option>
	<option value="Save for Later">Save for Later</option>
	
	</select>
	</div>
	</div>
	<br>

        <button type="submit" class="btn btn-success col-6"  onclick="confirmAdded()" >Add task <i class='fas fa-pencil-alt'></i></button>
        <a href="dashboard.jsp" class="btn btn-danger ml-4">Back to dashboard</a>
    </form>
</div>
<hr>
<div class="container">
	<%@ include  file="viewtodolist.jsp" %>
</div>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.all.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script>
function confirmAdded() {
    alert("Task is Addedd Successfully...");
}
</script>

</body>
</html>
