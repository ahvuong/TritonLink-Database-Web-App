<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>Thesis_committee home page</title>
</head>

<body>
	<%-- Set the scripting language to Java and --%>
	<%@ page language="java" import="java.sql.*" %>

	<%-- -------- Open Connection Code -------- --%>
	<%
			try {
				// Load Oracle Driver class file
				DriverManager.registerDriver (new org.postgresql.Driver());
				String GET_THESIS_COMMITTEE_QUERY = "Select * from thesis_committee";
				
				// Make a connection to the Oracle datasource
				Connection connection = DriverManager.getConnection
				("jdbc:postgresql:tables?user=postgres&password=trungtinvo");
				%>
	<%-- Check if an insertion is requested --%>
	<% String action = request.getParameter("action");
				if (action != null && action.equals("insert")) {
					connection.setAutoCommit(false); %>
	<%-- Create the prepared statement and use it to --%>
	<%-- INSERT the thesis_committee attrs INTO the thesis_committee table. --%>
	<% 
					PreparedStatement pstmt = connection.prepareStatement(
							("INSERT INTO thesis_committee VALUES (?, ?, ?)"));
					
					pstmt.setString(1,request.getParameter("department"));
					pstmt.setInt(2, Integer.parseInt(request.getParameter("student_id")));
					pstmt.setString(3,request.getParameter("instructor_name"));
					
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
	<%-- UPDATE the thesis_committee attributes in the thesis_committee table. --%>
	<% 
					
					PreparedStatement pstmt = connection.prepareStatement(
							"UPDATE thesis_committee SET student_id = ?, instructor_name = ? " +
		                      "WHERE department = ?");
					
					pstmt.setInt(1, Integer.parseInt(request.getParameter("student_id")));
					pstmt.setString(2, request.getParameter("instructor_name"));
					pstmt.setString(3, request.getParameter("department"));
	                  
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
	<%-- DELETE the thesis_committee FROM the thesis_committee table. --%>
	<% 
					
					PreparedStatement pstmt = connection.prepareStatement(
							"DELETE FROM thesis_committee WHERE department = ?");
					
					pstmt.setString(1, request.getParameter("department"));
	                  
	                pstmt.executeUpdate();
	                
	              	//connection.commit();
					connection.setAutoCommit(false);
					connection.setAutoCommit(true);
					}
				%>

	<%
				// Create the statement
				Statement stmt = connection.createStatement();
				
				// Use the statement to SELECT the thesis_committee attributes
				// FROM the thesis_committee table.
				ResultSet rs = stmt.executeQuery(GET_THESIS_COMMITTEE_QUERY);
				
				%>
	<%-- Entry Form --%>
	<table>
		<tr>
			<th>department</th>
			<th>student_id</th>
			<th>instructor_name</th>
		</tr>

		<%-- Insert Form Code --%>
		<tr>
			<form action="thesis_committee.jsp" method="get">
				<input type="hidden" value="insert" name="action">
				<th><input value="" name="department" size="10"></th>
				<th><input value="" name="student_id" size="10"></th>
				<th><input value="" name="instructor_name" size="10"></th>

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
			<form action="thesis_committee.jsp" method="get">
				<input type="hidden" value="update" name="action">
				<td><input value="<%= rs.getString("department")%>" name="department"></td>
				<td><input value="<%= rs.getInt("student_id")%>" name="student_id"></td>
				<td><input value="<%= rs.getString("instructor_name")%>" name="instructor_name"></td>

				<td>
					<input type="submit" value="Update">
				</td>
			</form>

			<form action="thesis_committee.jsp" method="get">
				<input type="hidden" value="delete" name="action">
				<input type="hidden" value="<%= rs.getInt("department") %>" name="department">
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