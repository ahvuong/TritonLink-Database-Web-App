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
			try {
				// Load Oracle Driver class file
				DriverManager.registerDriver (new org.postgresql.Driver());
				String GET_STUDENT_QUERY = "Select * from student";
				
				// Make a connection to the Oracle datasource
				Connection connection = DriverManager.getConnection
				("jdbc:postgresql:milestone2?user=postgres&password=ahvuong");
				%>
				<%-- Check if an insertion is requested --%> 
				<% String action = request.getParameter("action");
				if (action != null && action.equals("insert")) {
					connection.setAutoCommit(false); %>
					<%-- Create the prepared statement and use it to --%>
					<%-- INSERT the student attrs INTO the Student table. --%>
					<% 
					PreparedStatement pstmt = connection.prepareStatement(
							("INSERT INTO student VALUES (?, ?, ?, ?)"));
					//pstmt.setInt(1, Integer.parseInt(request.getParameter("id")));
					pstmt.setInt(1,Integer.parseInt(request.getParameter("id")));
					pstmt.setInt(2,Integer.parseInt(request.getParameter("age")));
					pstmt.setString(3, request.getParameter("email"));
					pstmt.setString(4, request.getParameter("name"));
					
					pstmt.executeUpdate();
					connection.commit();
					connection.setAutoCommit(true);
					}
				%>
				
				<%-- Update Info --%> 
				<% 
				if (action != null && action.equals("update")) {
					connection.setAutoCommit(false);%>
					<%-- Create the prepared statement and use it to --%>
					<%-- UPDATE the student attributes in the Student table. --%>
					<% 
					
					PreparedStatement pstmt = connection.prepareStatement(
							"UPDATE student SET age = ?, " +
		                      "email = ?, name = ? WHERE id = ?");
					
					pstmt.setInt(1,Integer.parseInt(request.getParameter("age")));
					pstmt.setString(2, request.getParameter("email"));
					pstmt.setString(3, request.getParameter("name"));
					pstmt.setInt(4,Integer.parseInt(request.getParameter("id")));
	                  
	                int rowCount = pstmt.executeUpdate();
	                
					connection.commit();
					connection.setAutoCommit(true);
					}
				%>
				
				<%-- Delete --%> 
				<% 
				if (action != null && action.equals("delete")) {
					connection.setAutoCommit(false);%>
					<%-- Create the prepared statement and use it to --%>
					<%-- DELETE the student FROM the Student table. --%>
					<% 
					
					PreparedStatement pstmt = connection.prepareStatement(
							"DELETE FROM student WHERE id = ?");
					
					pstmt.setInt(1 ,Integer.parseInt(request.getParameter("id")));
	                  
	                pstmt.executeUpdate();
	                
					connection.commit();
					connection.setAutoCommit(true);
					}
				%>
				
				<%
				// Create the statement
				Statement stmt = connection.createStatement();
				
				// Use the statement to SELECT the student attributes
				// FROM the Student table.
				ResultSet rs = stmt.executeQuery(GET_STUDENT_QUERY);
				
				%>
				<%-- Entry Form --%>
				<table>
					<tr>
						<th>id</th>
						<th>age</th>
						<th>email</th>
						<th>name</th>
					</tr>
				<%-- Insert Form Code --%>
					<tr>
						<form action="students.jsp" method="get">
							<input type="hidden" value="insert" name="action">
							<th><input value="" name="id" size="10"></th>
							<th><input value="" name="age" size="15"></th>
							<th><input value="" name="email" size="15"></th>
							<th><input value="" name="name" size="15"></th>
							<th><input type="submit" value="Insert"></th>
						</form>
					</tr>
				
				<%
				// Iterate over the ResultSet
				while ( rs.next() ) {
				%>
				<%-- Update Form Code --%>
				<tr>
				
					<form action="students.jsp" method="get">
						<input type="hidden" value="update" name="action">
						<th><input value="<%= rs.getInt("id") %>" name="id" size="10"></th>
						<th><input value="<%= rs.getInt("age") %>" name="age" size="15"></th>
						<th><input value="<%= rs.getString("email") %>" name="email" size="15"></th>
						<th><input value="<%= rs.getString("name") %>" name="name" size="15"></th>
						<th><input type="submit" value="Update"></th>
					</form>
					
					<form action="students.jsp" method="get">
						<input type="hidden" value="delete" name="action">
						<input type="hidden" value="<%= rs.getString("id") %>" name="id">
                    	<th><input type="submit" value="Delete"></th>
					</form>
				</tr>
				<%
				}
				%>
				</table>
				
			<%
				// Close the ResultSet
				rs.close();
				// Close the Statement
				stmt.close();
				// Close the Connection
				connection.close();
			} catch (SQLException sqle) {
				out.println(sqle.getMessage());
			} catch (Exception e) {
				out.println(e.getMessage());
			}
			%>
</body>
</html>