<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="0" />
<title>Logout</title>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
</head>
</head>
<body>
<%
	response.setHeader("Cache-Control", "no-cache no-store must-revalidate");
	response.setHeader("Pragma","no-cache");
	response.setHeader("Expires", "0");
		
		%>
	<div class="container m-auto">
	<img  src="images/log.png" width=1400 height=200/>
	</div>
	<p id="re" class="text-danger text-center"><b><span class="text-success">Logout Successfully.</span> Click below button to go back to the Home Page or else  You will be redirect automatically  to HomePage after 10 seconds</b></p>
	
	<a href="index.jsp" class="btn btn-success"><i class="fas fa-arrow-left"></i> Back to Home Page</a>
	<script>
		setTimeout(() => {
			window.location.href="index.jsp";
		}, 10000);
	
	</script>
</body>
</html>