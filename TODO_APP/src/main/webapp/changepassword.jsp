<%@page import="jakarta.servlet.jsp.tagext.TryCatchFinally"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ page errorPage="error.jsp" %>
<%@ page import = "java.sql.*, jakarta.servlet.*, jakarta.servlet.http.*, java.io.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="0" />
<title>Change Password</title>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.js"></script>
</head>
<body >
	
	<h2 class="text-info text-center">Change Password</h2>
	<p class="text-success bg-warning"><marquee><b>Now User Can view & change his/her current password that was provided by him/her during signup</b></marquee> </p>
 	<div class="container m-auto">
		<img src="images/forget.jpg" height=300 width=600/>
	</div>
 <%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma","no-cache");
    response.setHeader("Expires", "0");
    if (session.getAttribute("id") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    %>
    
	<%
		int id = Integer.parseInt(request.getParameter("id"));
	%>
	<sql:setDataSource var="db" driver="com.mysql.cj.jdbc.Driver" url="jdbc:mysql://localhost:3306/todo" user="root" password="Arghya@2002"/>
	<sql:query var="rs" dataSource="${db}">
	SELECT * FROM user WHERE id=?
	<sql:param value="<%=id %>"></sql:param>
	</sql:query>
	
	<c:forEach var="rsAll" items="${rs.rows }">
	<div class="container m-auto">
	<button class="btn btn-success m-auto" type="button" data-toggle="collapse" data-target=".multi-collapse" aria-expanded="false" aria-controls="multiCollapseExample1 multiCollapseExample2">View & Change Current Password</button>
	
	<div class="row">
  <div class="col">
    <div class="collapse multi-collapse" id="multiCollapseExample1">
      <div class="card card-body bg-secondary">
        <p class="text-center text-warning"><b>Your Current Password based on your profile is ->> <span class="text-light"><c:out value="${rsAll.password}" /></span></p>
        
      </div>
    </div>
  </div>
  <div class="col">
    <div class="collapse multi-collapse" id="multiCollapseExample2">
      <div class="card card-body bg-primary">
        <h4 class="text-center text-warning"><b>Change Your Password & Set New Password</b></h4>
        <form class="form-control" action="changepassword.jsp" method="post" >
        	<input type="text" name="id" value="<%=id %>" hidden/>
        	<input class="form-control" type="text" name="pass" placeholder="Enter New Password here" required/><br>
        	<input class="form-control" type="text" name="cpass" placeholder="Re-Enter Password to Confirm " required /><br>
        	 <div class="col-8 m-auto">
        	 <button type="submit" class="btn btn-warning">Change & Save</button>
       
        	 </div>
        
        </form>
       
        
       
       
      </div>
    </div>
  </div>
  </div>
</div>
	</c:forEach> 	
	 <%
	 	String pass = request.getParameter("pass");
	 	String cpass = request.getParameter("cpass");
	 	if(pass!=null && cpass!=null && pass.equals(cpass)){
	 		try{
	 			Class.forName("com.mysql.cj.jdbc.Driver");
			 	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/todo", "root", "Arghya@2002"); 
			 	String sql = "UPDATE user SET password=? WHERE id=?";
			    PreparedStatement pstmt = con.prepareStatement(sql);
			    pstmt.setString(1, pass);
			    pstmt.setInt(2, id);
			    int rs = pstmt.executeUpdate();
			    if(rs > 0){
			    	out.println("<div class='alert alert-success' role='alert'>Password has been changed successfully...</div>");
			    }else{
			    	out.println("<div class='alert alert-danger' role='alert'>Something Went Wrong..Password has not changed...</div>");
			    }
	 		}catch(Exception e){
	 			e.printStackTrace();
	 		}
	 	}else{
	 		out.println("<div class='alert alert-warning alert-dismissible fade show' role='alert'>Password and Confirm Password must be same...</div>");
	 	}
	 %>
	<a class="btn btn-danger" href="dashboard.jsp">Back to Dashboard</a>
</body>
</html>