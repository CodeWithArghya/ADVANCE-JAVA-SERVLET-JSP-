-<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.*" %>
<%@ page import="jakarta.servlet.*, jakarta.servlet.http.*, java.util.*, java.io.*, java.time.*, java.time.format.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ page errorPage="error.jsp" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="0" />

<title>Dashboard || ToDo</title>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.js"></script>
<style>

#abc{
	display:flex;
	margin:auto;
	width: 1000px;
}
#new{
	display:flex;
	float:right;
}
#old{
	display:flex;
	float:left;
	font-size:20px;
	color:red;
	
}
#card1:hover{
	transform: rotateY(360deg);
	transition: 3s;
}
#card2:hover{
	transform: rotateY(-360deg);
	transition: 3s;
}
#card3:hover{
	transform: rotateY(360deg);
	transition: 3s;
}
#card4:hover{
	transform: rotateY(-360deg);
	transition: 3s;
}
#text1:hover{
	color:yellow;
	background-color:black;
	transition: 1s;
}
#text2:hover{
	color:cyan;
	background-color:black;
	transition: 1s;
}
#text3:hover{
	color:white;
	background-color:black;
	transition: 1s;
}
#text4:hover{
	color:red;
	background-color:black;
	transition: 1s;
}

</style>
</head>
<body>
<%
	LocalDateTime obj1 = LocalDateTime.now();
	DateTimeFormatter obj2 = DateTimeFormatter.ofPattern("dd-MM-yyyy  HH:mm");
	String fdate = obj1.format(obj2);
%>
<span class="text-left text-dark"><b>Current Date & Time->> <%=fdate %></b></span>

<div class="text-right">
	<a href="#main" id="content" class="text-dark"><b>Skip to Main Content</b></a>
</div>
	<%
	response.setHeader("Cache-Control", "no-cache no-store must-revalidate");
	response.setHeader("Pragma","no-cache");
	response.setHeader("Expires", "0");
		if ((Integer)session.getAttribute("id") == null) {
  			response.sendRedirect("login.jsp");
  			return;
			}
		%>
   <%
	 int id = (Integer) session.getAttribute("id");
   	String uname = (String)session.getAttribute("fullname");
	%>
<h1 class="text-info fs-2 fw-bolder bg-dark m-3 p-4  text-center">ToDo User Dashboard
<span id="old">Welcome->> <span class="text-light"><%=uname %></span></span>
<span id="new"> <a class="btn btn-warning m-2" data-toggle="modal" data-target="#exampleModal1">User Profile</a>
	<a href="javascript:void(0);" class="btn btn-danger" onclick="confirmLogout()">Logout</a>
    
    
 </span>
</h1>
<img id="abc" src="main.jpg">
	<div class="container py-10 px-5 flex  justify-center items-center">
	
	
	<hr>
	<p class="text-success text-justify fs-5 fw-bolder">Add New task with Date & Time. View All added Task, Edit those taks and if completed then delete the taks from list.<br>
	<span class="text-danger text-justify fs-4 fw-bolder">Features of this system:-
	<ul class="bg-dark fs-4 p-5 fw-bolder" id="main">
	<marquee><li class="text-info">New Task can be added with details.</li></marquee>
	<marquee direction="right"><li class="text-warning">Edit/Modify of added Taks.</li></marquee>
	<marquee><li class="text-danger">Search Task to check status</li></marquee>
	<marquee direction="right"><li class="text-light">Delete Tasks</li></marquee>
	</ul>
	</span>
	</p>
	<hr>
	
	
	<form>
	<div class="container">
	<div class="row">
	<div class="col-md-3">
	<div class="card" style="width: 14rem;height: 30rem;">
  <img id="card1" class="card-img-top" src="images/add.jpg" alt="Card image cap">
  <div id="text1" class="card-body">
    <h5 class="card-title">Add New Task</h5>
    <p class="card-text">Add New Task Details. Like Task name, Task Description, Deadline, Status</p>
    <a href="javascript:void(0);" class="btn btn-success" onclick="confirmAdd()">Click Here to Add</a>
  </div>
  <p>
</div>
	</div>
	<div class="col-md-3">
	<div  class="card" style="width: 14rem;height: 30rem;">
  <img id="card2" class="card-img-top" src="images/edit.png" alt="Card image cap">
  <div id="text2" class="card-body">
    <h5 class="card-title">View/Edit Task</h5>
    <p class="card-text">View & Modify already added task Details. Like Task name, Task Description, Deadline, Status</p>
    <a href="javascript:void(0);" class="btn btn-info" onclick="confirmEdit()">Edit/View Tasks</a>
  </div>
</div>
	</div>
	<div class="col-md-3">
	<div  class="card" style="width: 14rem;height: 30rem;">
  <img id="card3" class="card-img-top" src="images/search.jpg" alt="Card image cap">
  <div id="text3" class="card-body">
    <h5 class="card-title">View Pending Tasks</h5>
    <p class="card-text">View all Pending tasks that are to be completed..</p>
    <a href="javascript:void(0);" class="btn btn-warning" onclick="confirmSearch()">View Pending Tasks</a>
  </div>
</div>
	</div>
	<div class="col-md-3">
	<div  class="card" style="width: 14rem;height: 30rem;">
  <img id="card4" class="card-img-top" src="images/delete.png" alt="Card image cap">
  <div id="text4" class="card-body">
    <h5 class="card-title">Delete Task</h5>
    <p class="card-text">Delete Task from the list that are already completed.</p>
    <a href="javascript:void(0);" class="btn btn-danger" onclick="confirmDelete()">Delete Task</a>
  </div>
</div>
	<div class="modal fade" id="exampleModal1" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title text-success" id="exampleModalLabel">User Profile</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      	<!-- Modal Content -->
      	<img src="images/prof.jpg" />
      	
      	<sql:setDataSource var="db" driver="com.mysql.cj.jdbc.Driver" url="jdbc:mysql://localhost:3306/todo" user="root" password="Arghya@2002"/>
      	<sql:query dataSource="${db }" var="rs">
      	select * from user where id=?;
      	<sql:param value="<%=id %>" /> 
      	</sql:query>
      	
      		<c:forEach var="table" items="${rs.rows}">
      			<div class="ml-4">
      				<h5 class="text-danger text-center"><b>Hello ,<span class="text-success"><c:out value="${table.name}"/> </span>this is your profile details...</b></h5>
      				<p class="text-info"><span class="text-dark"><b>User Name-></b></span> <b><c:out value="${table.name}"/></b></p>
      				<p class="text-success"><span class="text-dark"><b>Email-></b></span> <b> <c:out value="${table.email}"/></b></p>
      				<p class="text-warning"><span class="text-dark"><b>Gender-></b></span> <b><c:out value="${table.gender}"/></b></p>
      				<p class="text-danger"><span class="text-dark"><b>Country-></b></span> <b><c:out value="${table.country}"/></b></p>
      				<a class="btn btn-info" href="changepassword.jsp?id=<%=id %>" >Change Password</a>
      			</div>
      		
      		</c:forEach>
      	</table>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        
      </div>
    </div>
  </div>
</div>
	</div>
	</div>

	
	</div>
	</div>
<%@include file="footer.jsp" %>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.js"></script>
<script>
function confirmLogout() {
    Swal.fire({
        title: 'Are you sure?',
        text: "You are about to logout!",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Yes, Logout!'
    }).then((result) => {
        if (result.isConfirmed) {
            window.location.href = 'logout.jsp';
        }
    });
}
function confirmAdd() {
    Swal.fire({
        title: 'Are you sure?',
        text: "You are about to add new tasks!",
        icon: 'info',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Yes, Sure!'
    }).then((result) => {
        if (result.isConfirmed) {
            window.location.href = 'addTodo.jsp';
        }
    });
}

function confirmEdit() {
    Swal.fire({
        title: 'Are you sure?',
        text: "You are about to view/edit tasks!",
        icon: 'info',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Yes, Sure!'
    }).then((result) => {
        if (result.isConfirmed) {
            window.location.href = 'viewtodolist.jsp';
        }
    });
}

function confirmDelete() {
    Swal.fire({
        title: 'Are you sure?',
        text: "You are about to delete tasks!",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Yes, Sure!'
    }).then((result) => {
        if (result.isConfirmed) {
            window.location.href = 'viewtodolist.jsp';
        }
    });
}

function confirmSearch() {
    Swal.fire({
        title: 'Are you sure?',
        text: "You are about to view Pending Tasks!",
        icon: 'info',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Yes, View Now!'
    }).then((result) => {
        if (result.isConfirmed) {
            window.location.href = 'searchtask.jsp';
        }
    });
}
</script>

<script type="text/javascript">
    window.onpageshow = function(event) {
        if (event.persisted) {
            window.location.reload();
        }
    };
</script>

</body>
</html>