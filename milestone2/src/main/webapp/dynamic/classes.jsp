<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Class Home Page</title>
</head>
<body>
<%-- Set the scripting language to Java and --%>
			<%@ page language="java" import="java.sql.*" %>
			
			<%-- -------- Open Connection Code -------- --%>
			<%
			try {
				// Load Oracle Driver class file
				DriverManager.registerDriver (new org.postgresql.Driver());
				String GET_CLASS_QUERY = "Select * from classes";
				
				// Make a connection to the Oracle datasource
				Connection connection = DriverManager.getConnection
				("jdbc:postgresql:tables?user=postgres&password=ahvuong");
				%>
				<%-- Check if an insertion is requested --%> 
				<% String action = request.getParameter("action");
				if (action != null && action.equals("insert")) {
					connection.setAutoCommit(false); %>
					<%-- Create the prepared statement and use it to --%>
					<%-- INSERT the classes attrs INTO the classes table. --%>
					<% 
					PreparedStatement pstmt = connection.prepareStatement(
							("INSERT INTO classes VALUES (?, ?, ?, ?, ?, ?, ?)"));
					
					pstmt.setInt(1,Integer.parseInt(request.getParameter("section_id")));
					pstmt.setString(2,request.getParameter("new_number"));
					pstmt.setString(3,request.getParameter("title"));
					pstmt.setInt(4, Integer.parseInt(request.getParameter("year")));
					pstmt.setString(5, request.getParameter("quarter"));
					pstmt.setString(6, request.getParameter("instructor_name"));
					pstmt.setInt(7, Integer.parseInt(request.getParameter("enrollment_limit")));
					
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
					<%-- UPDATE the classes attributes in the classes table. --%>
					<% 
					
					PreparedStatement pstmt = connection.prepareStatement(
							"UPDATE classes SET title = ?, year = ?, " +
		                      "quarter = ?, instructor_name = ?, " +
								"enrollment_limit = ? WHERE section_id = ? AND new_number = ?");
					
					pstmt.setString(1,request.getParameter("title"));
					pstmt.setInt(2, Integer.parseInt(request.getParameter("year")));
					pstmt.setString(3, request.getParameter("quarter"));
					pstmt.setString(4, request.getParameter("instructor_name"));
					pstmt.setInt(5, Integer.parseInt(request.getParameter("enrollment_limit")));
					pstmt.setInt(6,Integer.parseInt(request.getParameter("section_id")));
					pstmt.setString(7,request.getParameter("new_number"));
	                  
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
					<%-- DELETE the classes FROM the classes table. --%>
					<% 
					
					PreparedStatement pstmt = connection.prepareStatement(
							"DELETE FROM classes WHERE section_id = ?");
					
					pstmt.setInt(1,Integer.parseInt(request.getParameter("section_id")));
	                  
	                pstmt.executeUpdate();%>
	                
	                <%-- DELETE the entries related to classes. --%>
	                <%					
					PreparedStatement meeting = connection.prepareStatement(
							"DELETE FROM meeting_sections WHERE section_id = ? AND new_number = ?");
					
					PreparedStatement weekly = connection.prepareStatement(
							"DELETE FROM weekly WHERE section_id = ? AND new_number = ?");
					
					PreparedStatement review = connection.prepareStatement(
							"DELETE FROM review WHERE section_id = ? AND new_number = ?");
					
					PreparedStatement teaching = connection.prepareStatement(
							"DELETE FROM teaching WHERE section_id = ?");
					
					meeting.setInt(1,Integer.parseInt(request.getParameter("section_id")));
					meeting.setString(2,request.getParameter("new_number"));
					weekly.setInt(1,Integer.parseInt(request.getParameter("section_id")));
					weekly.setString(2,request.getParameter("new_number"));
					review.setInt(1,Integer.parseInt(request.getParameter("section_id")));
					review.setString(2,request.getParameter("new_number"));
					teaching.setInt(1,Integer.parseInt(request.getParameter("section_id")));
	                
					meeting.executeUpdate();
					weekly.executeUpdate();
					review.executeUpdate();
					teaching.executeUpdate();
	                
	              	//connection.commit();
					connection.setAutoCommit(false);
					connection.setAutoCommit(true);
					}
				%>
				
				<%
				// Create the statement
				Statement stmt = connection.createStatement();
				
				// Use the statement to SELECT the classes attributes
				// FROM the classes table.
				ResultSet rs = stmt.executeQuery(GET_CLASS_QUERY);
				
				%>
				<%-- Entry Form --%>
				<table>
					<tr>
						<th>section_id</th>
						<th>new_number</th>
						<th>title</th>
                      	<th>year</th>
                      	<th>quarter</th>
                      	<th>instructor_name</th>
                      	<th>enrollment_limit</th>
					</tr>
					
					<%-- Insert Form Code --%>
					<tr>
						<form action="classes.jsp" method="get">
							<input type="hidden" value="insert" name="action">
							
							<th><input value="" name="section_id" size="15"></th>
							<th><input value="" name="new_number" size="15"></th>
							<th><input value="" name="title" size="10"></th>
							<th><input value="" name="year" size="10"></th>
							<th><input value="" name="quarter" size="3"></th>
							<th><input value="" name="instructor_name" size="15"></th>
							<th><input value="" name="enrollment_limit" size="15"></th>
							
							<th><input type="submit" value="Insert"></th>
						</form>
					</tr>
				
				<%
				
				// Iterate over the ResultSet
				while ( rs.next() ) {
				%>
				<%-- Update Form Code --%>
				<tr>
					<form action="classes.jsp" method="get">
				        <input type="hidden" value="update" name="action">
				        <td><input value="<%= rs.getInt("section_id")%>" name="section_id"></td>
				        <td><input value="<%= rs.getInt("new_number")%>" name="new_number"></td>
				        <td><input value="<%= rs.getString("title")%>" name="title"></td>
				        <td><input value="<%= rs.getInt("year")%>" name="year"></td>
				        <td><input value="<%= rs.getString("quarter")%>" name="quarter"></td>
				        <td><input value="<%= rs.getString("instructor_name")%>" name="instructor_name"></td>
				        <td><input value="<%= rs.getInt("enrollment_limit")%>" name="enrollment_limit"></td>
				        
				        <td>
				            <input type="submit" value="Update">
				        </td>
			    	</form>
					
					<form action="classes.jsp" method="get">
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