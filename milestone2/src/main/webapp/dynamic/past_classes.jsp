<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>Past Class Home Page</title>
</head>

<style>
table, th, td {
  border:1px solid black;
}
</style>

<body>
	<%-- Set the scripting language to Java and --%>
	<%@ page language="java" import="java.sql.*" %>

	<%-- -------- Open Connection Code -------- --%>
	<%
			try {
				// Load Oracle Driver class file
				DriverManager.registerDriver (new org.postgresql.Driver());
				String GET_PAST_CLASS_QUERY = "Select * from past_classes";
				
				// Make a connection to the Oracle datasource
				Connection connection = DriverManager.getConnection
				("jdbc:postgresql:tables?user=postgres&password=ahvuong");
				%>
	<%-- Check if an insertion is requested --%>
	<% String action = request.getParameter("action");
				if (action != null && action.equals("insert")) {
					connection.setAutoCommit(false); %>
	<%-- Create the prepared statement and use it to --%>
	<%-- INSERT the past_classes attrs INTO the past_classes table. --%>
	<% 
					PreparedStatement pstmt = connection.prepareStatement(
							("INSERT INTO past_classes VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)"));
					
					pstmt.setInt(1,Integer.parseInt(request.getParameter("student_id")));
					pstmt.setInt(2,Integer.parseInt(request.getParameter("section_id")));
					pstmt.setString(3,request.getParameter("title"));
					pstmt.setInt(4, Integer.parseInt(request.getParameter("year")));
					pstmt.setString(5, request.getParameter("quarter"));
					pstmt.setString(6, request.getParameter("instructor_name"));
					pstmt.setString(7, request.getParameter("grade"));
					pstmt.setInt(8, Integer.parseInt(request.getParameter("units")));
					pstmt.setInt(9, Integer.parseInt(request.getParameter("grade_conversion")));
					
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
	<%-- UPDATE the past_classes attributes in the past_classes table. --%>
	<% 
					
					PreparedStatement pstmt = connection.prepareStatement(
							"UPDATE past_classes SET section_id = ?, title = ?, " +
		                      "year = ?, quarter = ?, instructor_name = ?, grade = ? , " +
								"units = ?, grade_conversion = ? WHERE section_id = ?");
					
					pstmt.setInt(1,Integer.parseInt(request.getParameter("section_id")));
					pstmt.setString(2,request.getParameter("title"));
					pstmt.setInt(3, Integer.parseInt(request.getParameter("year")));
					pstmt.setString(4, request.getParameter("quarter"));
					pstmt.setString(5, request.getParameter("instructor_name"));
					pstmt.setString(6, request.getParameter("grade"));
					pstmt.setInt(7, Integer.parseInt(request.getParameter("units")));
					pstmt.setInt(8, Integer.parseInt(request.getParameter("grade_conversion")));
					pstmt.setInt(9,Integer.parseInt(request.getParameter("student_id")));
	                  
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
	<%-- DELETE the past_classes FROM the past_classes table. --%>
	<% 
					
					PreparedStatement pstmt = connection.prepareStatement(
							"DELETE FROM past_classes WHERE section_id = ?");
					
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
				
				// Use the statement to SELECT the past_classes attributes
				// FROM the past_classes table.
				ResultSet rs = stmt.executeQuery(GET_PAST_CLASS_QUERY);
				
				%>
	<%-- Entry Form --%>
	<table style="width:100%">
		<tr>
			<th>student_id</th>
			<th>section_id</th>
			<th>title</th>
			<th>year</th>
			<th>quarter</th>
			<th>instructor_name</th>
			<th>grade</th>
			<th>units</th>
			<th>grade_conversion</th>
		</tr>

		<%-- Insert Form Code --%>
		<tr>
			<form action="past_classes.jsp" method="get">
				<input type="hidden" value="insert" name="action">
	
				<th><input value="" name="student_id"></th>
				<th><input value="" name="section_id"></th>
				<th><input value="" name="title"></th>
				<th><input value="" name="year"></th>
				<th><input value="" name="quarter" ></th>
				<th><input value="" name="instructor_name" ></th>
				<th>
					<select name="grade">
						<option value="A+">A+</option>
						<option value="A">A</option>
						<option value="A-">A-</option>
						<option value="B+">B+</option>
						<option value="B">B</option>
						<option value="B-">B-</option>
						<option value="C+">C+</option>
						<option value="C">C</option>
						<option value="C-">C-</option>
						<option value="D">D</option>
						<option value="F">F</option>
						<option value="S" >S</option>
						<option value="U" >U</option>
					</select>
				</th>
				<th><input value="" name="units" ></th>
				
				<th><input value="Do Not Fill" name="grade_conversion" ></th>

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
			<form action="past_classes.jsp" method="get">
				<input type="hidden" value="update" name="action">
				<td><input value="<%= rs.getInt("student_id")%>" name="student_id"></td>
				<td><input value="<%= rs.getInt("section_id")%>" name="section_id"></td>
				<td><input value="<%= rs.getString("title")%>" name="title"></td>
				<td><input value="<%= rs.getInt("year")%>" name="year"></td>
				<td><input value="<%= rs.getString("quarter")%>" name="quarter"></td>
				<td><input value="<%= rs.getString("instructor_name")%>" name="instructor_name"></td>
				<td>
					<select name="grade" required>
	                    <% String s = rs.getString("grade"); %>
	                    <option value="A+" <%= s.equals("A+") ? "selected":"" %>>A+</option>
	                    <option value="A" <%= s.equals("A") ? "selected":"" %>>A</option>
	                    <option value="A-" <%= s.equals("A-") ? "selected":"" %>>A-</option>
	                    <option value="B+" <%= s.equals("B+") ? "selected":"" %>>B+</option>
	                    <option value="B" <%= s.equals("B") ? "selected":"" %>>B</option>
	                    <option value="B-" <%= s.equals("B-") ? "selected":"" %>>B-</option>
	                    <option value="C+" <%= s.equals("C+") ? "selected":"" %>>C+</option>
	                    <option value="C" <%= s.equals("C") ? "selected":"" %>>C</option>
	                    <option value="C-" <%= s.equals("C-") ? "selected":"" %>>C-</option>
	                    <option value="D" <%= s.equals("D") ? "selected":"" %>>D</option>
	                    <option value="F" <%= s.equals("F") ? "selected":"" %>>F</option>
	                    <option value="S" <%= s.equals("S") ? "selected":"" %>>S</option>
	                    <option value="U" <%= s.equals("U") ? "selected":"" %>>U</option>
                	</select></td>
				<td>
				<td><input value="<%= rs.getInt("units")%>"  name="units"></td>
				
				<%
				double grade = 0;
				String gradeSU = "";
				if(s.equals("S") || s.equals("U"))
				{
					gradeSU = s;
				%>
				<td><input value="<%=gradeSU %>" name="grade_conversion"></td>
				<%
				}
				else 
				{
					if (s.equals("A+"))
						grade = 4.0;
					else if (s.equals("A"))
						grade = 4.0;
					else if (s.equals("A-"))
						grade = 3.7;
					else if (s.equals("B+"))
						grade = 3.3;
					else if (s.equals("B"))
						grade = 3.0;
					else if (s.equals("B-"))
						grade = 2.7;
					else if (s.equals("C+"))
						grade = 2.3;
					else if (s.equals("C"))
						grade = 2.0;
					else if (s.equals("C-"))
						grade = 1.7;
					else if (s.equals("D"))
						grade = 1.0;
					else
						grade = 0.0;
					
					System.out.println(s);
					System.out.println(grade);
					System.out.println(gradeSU);
					%>
					<td><input value="<%=grade %>" name="grade_conversion" size="10"></td>
					<%
				}
				%>
				
				<td>
					<input type="submit" value="Update">
				</td>
			</form>

			<form action="past_classes.jsp" method="get">
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