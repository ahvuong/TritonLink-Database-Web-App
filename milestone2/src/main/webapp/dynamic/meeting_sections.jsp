<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Meeting Sections Home Page</title>
</head>
<body>
<%-- Set the scripting language to Java and --%>
			<%@ page language="java" import="java.sql.*" %>
			
			<%-- -------- Open Connection Code -------- --%>
			<%
			try {
				// Load Oracle Driver meeting_sections file
				DriverManager.registerDriver (new org.postgresql.Driver());
				String GET_MEETING_QUERY = "Select * from meeting_sections";
				
				// Make a connection to the Oracle datasource
				Connection connection = DriverManager.getConnection
				("jdbc:postgresql:tables?user=postgres&password=ahvuong");
				%>
				<%-- Check if an insertion is requested --%> 
				<% String action = request.getParameter("action");
				if (action != null && action.equals("insert")) {
					connection.setAutoCommit(false); %>
					<%-- Create the prepared statement and use it to --%>
					<%-- INSERT the meeting_sections attrs INTO the meeting_sections table. --%>
					<% 
					PreparedStatement pstmt = connection.prepareStatement(
							("INSERT INTO meeting_sections VALUES (?, ?, ?, ?, ?, ?, ?)"));
					
					pstmt.setInt(1,Integer.parseInt(request.getParameter("section_id")));
					pstmt.setString(2,request.getParameter("new_number"));
					pstmt.setDate(3, java.sql.Date.valueOf(request.getParameter("date_time")));
					pstmt.setTime(4, java.sql.Time.valueOf(request.getParameter("begin_time")));
					pstmt.setTime(5, java.sql.Time.valueOf(request.getParameter("end_time")));
					pstmt.setString(6, request.getParameter("room"));
					pstmt.setString(7, request.getParameter("building"));

					
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
					<%-- UPDATE the meeting_sections attributes in the meeting_sections table. --%>
					<% 
					
					PreparedStatement pstmt = connection.prepareStatement(
							"UPDATE meeting_sections SET new_number = ?, date_time = ?, begin_time = ?, " +
		                      "end_time = ?, room = ?, " +
								"building = ? WHERE section_id = ?");
					
					pstmt.setString(1,request.getParameter("new_number"));
					pstmt.setDate(2,java.sql.Date.valueOf(request.getParameter("date_time")));
					pstmt.setTime(3, java.sql.Time.valueOf(request.getParameter("begin_time")));
					pstmt.setTime(4, java.sql.Time.valueOf(request.getParameter("end_time")));
					pstmt.setString(5, request.getParameter("room"));
					pstmt.setString(6, request.getParameter("building"));
					pstmt.setInt(7,Integer.parseInt(request.getParameter("section_id")));
	                  
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
					<%-- DELETE the meeting_sections FROM the meeting_sections table. --%>
					<% 
					
					PreparedStatement pstmt = connection.prepareStatement(
							"DELETE FROM meeting_sections WHERE section_id = ?");
					
					pstmt.setInt(1,Integer.parseInt(request.getParameter("section_id")));
	                  
	                pstmt.executeUpdate();
	                
	              	//connection.commit();
					connection.setAutoCommit(false);
					connection.setAutoCommit(true);
					}
				%>
				
				<%
				// Create the statement
				Statement stmt = connection.createStatement();
				
				// Use the statement to SELECT the meeting_sections attributes
				// FROM the meeting_sections table.
				ResultSet rs = stmt.executeQuery(GET_MEETING_QUERY);
				
				%>
				<%-- Entry Form --%>
				<table>
					<tr>
						<th>section_id</th>
						<th>new_number</th>
                      	<th>date_time</th>
                      	<th>begin_time</th>
                      	<th>end_time</th>
                      	<th>room</th>
                      	<th>building</th>
					</tr>
					
					<%-- Insert Form Code --%>
					<tr>
						<form action="meeting_sections.jsp" method="get">
							<input type="hidden" value="insert" name="action">
							
							<th><input value="" name="section_id" size="15"></th>
							<th><input value="" name="new_number" size="15"></th>
							<th><input value="" name="date_time" placeholder="yyyy-mm-dd" size="15" required></th>
							<th><input value="" name="begin_time" placeholder="hh:mm:ss" size="15" required></th>
							<th><input value="" name="end_time" placeholder="hh:mm:ss" size="15" required></th>
							<th><input value="" name="room" size="15"></th>
							<th><input value="" name="building" size="15"></th>
							
							<th><input type="submit" value="Insert"></th>
						</form>
					</tr>
				
				<%
				
				// Iterate over the ResultSet
				while ( rs.next() ) {
				%>
				<%-- Update Form Code --%>
				<tr>
					<form action="meeting_sections.jsp" method="get">
				        <input type="hidden" value="update" name="action">
				        <td><input value="<%= rs.getInt("section_id")%>" name="section_id"></td>
				        <td><input value="<%= rs.getInt("new_number")%>" name="new_number"></td>
				        <td><input value="<%= rs.getString("date_time")%>" name="date_time" placeholder="yyyy-mm-dd" required></td>
				        <td><input value="<%= rs.getString("begin_time")%>" name="begin_time" placeholder="hh:mm:ss" required></td>
				        <td><input value="<%= rs.getString("end_time")%>" name="end_time" placeholder="hh:mm:ss" required></td>
				        <td><input value="<%= rs.getString("room")%>" name="room"></td>
				        <td><input value="<%= rs.getString("building")%>" name="building"></td>
				        
				        <td>
				            <input type="submit" value="Update">
				        </td>
			    	</form>
					
					<form action="meeting_sections.jsp" method="get">
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