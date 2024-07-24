<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*, java.io.*, jakarta.servlet.*, jakarta.servlet.http.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ page isELIgnored="false" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="0" />
<title>Delete Task</title>
</head>
<body>
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
    int todoid = Integer.parseInt(request.getParameter("todoid")); //taking this param from viewtodolist.jsp
    %>
    
    <sql:setDataSource var="db" driver="com.mysql.cj.jdbc.Driver" url="jdbc:mysql://localhost:3306/todo" user="root" password="Arghya@2002"/>
    <sql:update dataSource="${db}">
        DELETE FROM todolist WHERE todoid=?
        <sql:param value="<%= todoid %>"/>
    </sql:update>
    
    <c:redirect url="addTodo.jsp"/>
</body>
</html>
