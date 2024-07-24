<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="0" />
<title>Insert title here</title>
</head>
<body>
	<%
		response.setHeader("Cache-Control", "no-cache no-store must-revalidate");
		response.setHeader("Pragma","no-cache");
		response.setHeader("Expires", "0");
		session.removeAttribute("id");
		session.invalidate();
		
		response.sendRedirect("logoutpage.jsp");
	%>
</body>
</html>