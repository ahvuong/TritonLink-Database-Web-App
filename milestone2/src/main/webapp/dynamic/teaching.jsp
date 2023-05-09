<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Teaching Home Page</title>
</head>
<body>
<%-- Set the scripting language to Java and --%>
			<%@ page language="java" import="java.sql.*" %>
			
			<%-- -------- Open Connection Code -------- --%>
			<%
			try {
				// Load Oracle Driver Teaching file
				DriverManager.registerDriver (new org.postgresql.Driver());
				String GET_TEACHING_QUERY = "Select * from teaching";
				
				// Make a connection to the Oracle datasource
				Connection connection = DriverManager.getConnection
				("jdbc:postgresql:tables?user=postgres&password=ahvuong");
				%>
				<%-- Check if an insertion is requested --%> 
				<% String action = request.getParameter("action");
				if (action != null && action.equals("insert")) {
					connection.setAutoCommit(false); %>
					<%-- Create the prepared statement and use it to --%>
					<%-- INSERT the teaching attrs INTO the teaching table. --%>
					<% 
					PreparedStatement pstmt = connection.prepareStatement(
							("INSERT INTO teaching VALUES (?, ?)"));
					
					pstmt.setInt(1,Integer.parseInt(request.getParameter("section_id")));
					pstmt.setString(2, request.getParameter("faculty_name"));
					
					pstmt.executeUpdate();
					//connection.commit();
					connection.setAutoCommit(false);
					connection.setAutoCommit(true);
					}
				%>
				
				<%-- Update Info --%> 
				<% 
				if (action != null && action.equals("update")) {
					connection.setAutoCommit(false);%>
					<%-- Create the prepared statement and use it to --%>
					<%-- UPDATE the teaching attributes in the teaching table. --%>
					<% 
					
					PreparedStatement pstmt = connection.prepareStatement(
							"UPDATE teaching SET faculty_name = ? WHERE section_id = ?");
					
					pstmt.setString(1,request.getParameter("faculty_name"));
					pstmt.setInt(2,Integer.parseInt(request.getParameter("section_id")));
					
	                  
	                pstmt.executeUpdate();
	                
	              	//connection.commit();
					connection.setAutoCommit(false);
					connection.setAutoCommit(true);
					}
				%>
				
				<%-- Delete --%> 
				<% 
				if (action != null && action.equals("delete")) {
					connection.setAutoCommit(false);%>
					<%-- Create the prepared statement and use it to --%>
					<%-- DELETE the courses FROM the courses table. --%>
					<% 
					
					PreparedStatement pstmt = connection.prepareStatement(
							"DELETE FROM teaching WHERE section_id = ?");
					
					pstmt.setInt(1, Integer.parseInt(request.getParameter("section_id")));
	                  
	                pstmt.executeUpdate();
	                
	              	//connection.commit();
					connection.setAutoCommit(false);
					connection.setAutoCommit(true);
					}
				%>
				
				<%
				// Create the statement
				Statement stmt = connection.createStatement();
				
				// Use the statement to SELECT the courses attributes
				// FROM the courses table.
				ResultSet rs = stmt.executeQuery(GET_TEACHING_QUERY);
				
				%>
				<%-- Entry Form --%>
				<table>
					<tr>
						<th>section_id</th>
						<th>faculty_name</th>
					</tr>
					
					<%-- Insert Form Code --%>
					<tr>
						<form action="teaching.jsp" method="get">
							<input type="hidden" value="insert" name="action">
							<th><input value="" name="section_id" size="10"></th>
							<th><input value="" name="faculty_name" size="10"></th>
							
							<th><input type="submit" value="Insert"></th>
						</form>
					</tr>
				
				<%
				//System.out.print("hello1\n");
				// Iterate over the ResultSet
				while ( rs.next() ) {
					//System.out.print("hello\n");
				%>
				<%-- Update Form Code --%>
				<tr>
					<form action="teaching.jsp" method="get">
				        <input type="hidden" value="update" name="action">
				        <td><input value="<%= rs.getInt("section_id")%>" name="section_id"></td>
				        <td><input value="<%= rs.getString("faculty_name")%>" name="faculty_name"></td>
				        
				        <td>
				            <input type="submit" value="Update">
				        </td>
			    	</form>
					
					<form action="teaching.jsp" method="get">
						<input type="hidden" value="delete" name="action">
						<input type="hidden" value="<%= rs.getInt("section_id") %>" name="section_id">
                    	<td><input type="submit" value="Delete"></td>
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