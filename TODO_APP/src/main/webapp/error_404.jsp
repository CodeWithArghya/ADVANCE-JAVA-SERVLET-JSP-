<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page isErrorPage="true" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>404 Not Found</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<style>
#tex{
	font-size: 30px;
}
</style>
</head>
<body>
	<div class="container m-auto">
	<img  src="images/404.jpg" height=500 width=1200/>
	</div>
	<p id="tex" class="text-danger"><marquee><b>Sorry!! The Page/Resource you are looking for, does not exist...</b></marquee></p>
	<div class="container m-auto">
	<a href="index.jsp" class="btn btn-success">Go to Home Page</a>
	</div>
	
</body>
</html>