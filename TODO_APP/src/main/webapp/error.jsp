<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page isErrorPage="true" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Error || TodoApp</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
<style>
#im{
	margin:auto;
	display:flex;
}
</style>
</head>

<body>
	<div class="container">
	<div class="row">
	<div class="col-12">
		<img id="im" src="images/error.png" height=600 width=1200/>
	
	</div>
	</div>
		
	</div>
	<p class="text-danger text-center"><b>Exception is ->><%= exception.getMessage() %></b></p> 
</body>
</html>