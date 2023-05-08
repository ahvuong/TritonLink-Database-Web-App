<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student home page</title>
</head>
<body>
<%-- Set the scripting language to Java and --%>
			<%@ page language="java" import="java.sql.*" %>
			
			<%-- -------- Open Connection Code -------- --%>
			<%
			
				// Load Oracle Driver class file
				DriverManager.registerDriver (new org.postgresql.Driver());
				String GET_STUDENT_QUERY = "Select * from student";
				
				// Make a connection to the Oracle datasource
				Connection connection = DriverManager.getConnection
				("jdbc:postgresql:milestone2?user=postgres&password=ahvuong");
				// Create the statement
				Statement stmt = connection.createStatement();
				
				// Use the statement to SELECT the student attributes
				// FROM the Student table.
				ResultSet rs = stmt.executeQuery(GET_STUDENT_QUERY);
				while (rs.next()) {
				
				%>
				<span>Student id is <%= rs.getInt(1) %></span><br/>
				<span>Age is <%= rs.getInt(2) %></span><br/>
				<span>Email is <%= rs.getString(3) %></span><br/>
				<span>Name is <%= rs.getString(4) %></span><br/>
				<br/><br/><br/>
				
			<% } %>
</body>
</html>