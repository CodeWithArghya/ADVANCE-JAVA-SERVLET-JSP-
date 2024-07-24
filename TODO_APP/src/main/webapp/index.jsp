<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>TODO || Home</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Ga+Maamli&family=Lobster&display=swap" rel="stylesheet">
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
 <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
 <script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.js"></script>
<style>
  .increase-font-size {
    font-size: 22px;
    font-weight:70%;
  }
  .font-c {
  	font-size: 20px;
  }
</style>
<style>
#abc{
	display:flex;
	margin:auto;
	width: 500px;
}
#demo1{
	display:flex;
	margin:auto;
}
#ga-maamli-regular {
  font-family: "Ga Maamli", sans-serif;
  font-weight: 400;
  font-style: normal;
}
#lobster-regular {
  font-family: "Lobster", sans-serif;
  font-weight: 400;
  font-style: normal;
}

</style>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" integrity="sha384-2CRDyp+szmoBI8J/8rQwNzoKVkYy7ynuA8C+9ryK48wqzpx+iyS+l95R+zD2Kdkf" crossorigin="anonymous">
</head>
<body>
<h1 id="lobster-regular" class="text-light fs-2 fw-bolder bg-dark m-3 p-4  text-center">ToDo App
<br><span> <a class="btn btn-warning" href="signup.jsp">Signup</a>
    <a class="btn btn-info" href="login.jsp">Login</a>
 </span>
</h1>

   

<img id="abc" src="images/indx.jpg">
	<div class="container py-10 px-5 flex  justify-center items-center">
	<form action="search" method="GET">
	
	<hr>
	<p class="text-success text-justify font-20 increase-font-size">This is a Simple ToDo Web Application where User can Create a Free Account
	& Use this to do app to add, update, search & delete their daily tasks. This is Version 1.0.0. More Features will be comming soon.<br>
	<span class="text-danger text-justify fs-4 fw-bolder">Features of this App:-
	<ul class="bg-dark fs-4 p-5 fw-bolder font-c">
	<marquee><li class="text-info font-c">New Task Add along with details.</li></marquee>
	<marquee direction="right"><li class="font-c text-warning">Edit/Modify already added task</li></marquee>
	<marquee><li class="text-danger font-c"> View All Pending Tasks.</li></marquee>
	<marquee direction="right"><li class="text-light" >Delete Task list</li></marquee>
	
	</ul>
	</span>
	</p>
	<hr>
	</form>
<%@include file="footer.jsp" %>


</body>

</html>