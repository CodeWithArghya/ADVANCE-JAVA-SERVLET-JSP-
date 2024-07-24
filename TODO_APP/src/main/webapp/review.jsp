<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page errorPage="error.jsp" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Feedback || SignuTodoApp</title>
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
        <a class="nav-link text-danger" href="signup.jsp"><b>Signup</b></a>
      </li>
      <li class="nav-item active">
        <a class="btn btn-warning" href="login.jsp">Login</a>
      </li>
      
  </div>
</nav>
	<div class="container">
	<h1 class="text-center text-dark">User Feedback || TODO App</h1>
	<div class="row">
	<div class=" m-auto">
		<img src="images/feedback.jpg" height=400 width=800 />
	</div>
	<br>
	<div class="col-12 bg-secondary">
		<form action="feedback" method="post">
		<label class="text-warning" ><b> Enter Email-Id : </b></label>
		<input class="form-control" type="email" name="email" placeholder="Enter a Valid Email" />
		<label class="text-warning"><b>Enter Full Name</b></label>
		<input class="form-control" type="text" name="fullname" placeholder="Enter FirstName, Middle name(if any) LastName" />
		<label class="text-light" > <b>Select Gender: </b></label>
		<b class="text-warning">Male</b><input type="radio" name="gender" value="male" />
		<b class="text-warning">Female</b><input type="radio" name="gender" value="female" />
		<b class="text-warning">Others</b><input type="radio" name="gender" value="other" /><p>
		<label class="text-warning"><b>Select Country :</b></label>
		<select name="country" class="form-control">
		<option value="select">Select Country</option>
		<option value="India">India</option>
		<option value="Bangladesh">Bangladesh</option>
		<option value="nepal">Nepal</option>
		<option value="chaina">Chaina</option>
		<option value="Pakistan">Pakistan</option>
		<option value="Afganisthan">Afganisthan</option>
		<option value="Russia">Russia</option>
		<option value="USA">USA</option>
		<option value="UK">UK</option>
		<option value="UAE">UAE</option>
		<option value="Others">Others</option>
		</select><br>
		<label class="text-warning"><b>Your Feedback & Suggesstion</b></label>
		<textarea class="from-control" name="message" rows="10" cols="148" placeholder="Writer your Message / Feedback or Any Suggesstions Here"></textarea><br>
		<label class="text-warning"><b>Select User Type :</b></label>
		<select name="userrole" class="form-control">
		<option value="select">Select User Type</option>
		<option value="Registered">Registered User</option>
		<option value="Non-Register">Non-Registered User</option>
		<option value="None of Them">Others</option>
		
		</select><br>
		<p>
		<div class="col-1 m-auto p-6">
		<button class="btn btn-warning p-6">Submit</button>
		</div>
		<p>
		</form>
	</div>
	,</div>	
	
</div>

<%@include file="footer.jsp" %>
</body>
</html>