<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>TODO || Login</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>

<!-- Popper JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<nav class="navbar navbar-dark bg-dark">
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo03" aria-controls="navbarTogglerDemo03" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <a class="navbar-brand" href="index.jsp">ToDo App</a>

  <div class="collapse navbar-collapse" id="navbarTogglerDemo03">
    <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
      <li class="nav-item active">
        <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link text-danger" href="review.jsp"><b>Review & Feedback</b></a>
      </li>
      <li class="nav-item active">
        <a class="btn btn-success" href="signup.jsp">Sign Up</a>
      </li>
      
  </div>
</nav>
	<div class="container">
	<h1 class="text-center text-info">Login Page || TODO App</h1>
	<div class="row">
	<div class=" m-auto">
		<img src="images/admin-login.jpg" height=400 width=500 />
	</div>
	
	<div class="col-12 bg-secondary p-6">
		<form action="login" method="post">
		<label class="text-warning" ><b> Enter Email-Id : </b></label>
		<input class="form-control" type="email" name="email" placeholder="Enter Registered Email-Id" />
		<label class="text-warning" > <b>Enter Password: </b></label>
		<input class="form-control" type="password" name="password" placeholder="Enter Your Password" />
		
		<p>
		<div class="col-1 m-auto p-6">
		<button class="btn btn-success p-6">Login</button>
		</div>
		<p>
		</form>
	</div>
	,</div>	
</div>
<%@include file="footer.jsp" %>
</body>
</html>