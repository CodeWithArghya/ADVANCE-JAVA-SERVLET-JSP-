<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page errorPage="error.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Success</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

<style>
#aa{
	font-size: 25px;
}

</style>
</head>


<body class="bg-dark">

<%
	String name = (String)request.getAttribute("name");
%>
	<div class="container mt-6">
	<br>
		<p id="aa" class="text-center text-success"><b>Thanks <span class="text-light"><%=name %></span>  for Your Feedback.. It has been submitted successfully. </b>
			<span class="text-info"><marquee><b>Your each & Every Feedback & Suggestions will help me to improve this Web App further.</b></marquee></span>
		</p>
		
	</div>
	
	<br>
	<div class="container m-auto">
		<img src="images/thanks.jpg" />
		<img src="images/thanks.jpg" />
		
	</div>
	<p class="text-danger"><b>Click below button to go to Homepage else you will be automatically redirected to HomePage after 10 Seconds.</b></p>
	<a href="index.jsp" class="btn btn-success">Back to HomePage</a>
	
	<script>
		setTimeout(()=>{
			window.location.href="index.jsp";
		}, 10000);
		
	
	</script>
</body>
</html>