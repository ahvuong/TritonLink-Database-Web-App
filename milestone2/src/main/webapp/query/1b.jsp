<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>Class Roster Report</title>
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
		//String GET_ADVISOR_QUERY = "Select * from advisor";
				
		// Make a connection to the Oracle datasource
		Connection connection = DriverManager.getConnection
		("jdbc:postgresql:tables?user=postgres&password=ahvuong");
	%>
	<%-- Check if an insertion is requested --%>
	<% 
		String action = request.getParameter("action");
		ResultSet class_info = null;
    	ResultSet student_info = null;
    
    	// Select all class's information
    	connection.setAutoCommit(false);
		PreparedStatement pstmt2 = connection.prepareStatement("SELECT * FROM classes");
	
		class_info = pstmt2.executeQuery();
		connection.commit();
		connection.setAutoCommit(true);
	
		
		if (action != null && action.equals("submit")) 
		{
			connection.setAutoCommit(false); %>
	<%-- Create the prepared statement and use it to --%>
	<%-- INSERT the advisor attrs INTO the advisor table. --%>
	<% 
			PreparedStatement pstmt = null;
	
			String[] info = request.getParameter("class_information").split(" ");
			
			/*if (info != null && info.length >= 4) {
			    String className = info[0];
			    int year = Integer.parseInt(info[1]);
			    String quarter = info[2];
			    int sectionId = Integer.parseInt(info[3]);

			    // Print or process the values in the info array
			    System.out.println("Class Name: " + className);
			    System.out.println("Year: " + year);
			    System.out.println("Quarter: " + quarter);
			    System.out.println("Section ID: " + sectionId);
			} else {
			    // Handle the case when the info array is not populated correctly
			    System.out.println("Invalid or incomplete class information provided.");
			}*/
			
			int year = Integer.parseInt(info[1]);
			String quarter = info[2];
			
			if(year == 2022 && quarter.equals("SP"))
			{
				pstmt = connection.prepareStatement(
						"SELECT * " +
						"FROM students " + 
						"NATURAL JOIN course_enrollment c " +
						"WHERE c.section_id = ? AND c.class_name = ?"
						);
			
				pstmt.setInt(1, Integer.parseInt(info[3]));
				pstmt.setString(2, info[0]);
			}
			else
			{
				pstmt = connection.prepareStatement(
						"SELECT * " +
						"FROM students " + 
						"NATURAL JOIN past_classes p " +
						"WHERE p.year = ? AND p.quarter = ? AND " + 
						"p.section_id = ? AND p.title = ?"
						);
				
				pstmt.setInt(1, year);
				pstmt.setString(2, quarter);
				pstmt.setInt(3, Integer.parseInt(info[3]));
				pstmt.setString(4, info[0]);
			}
			
			student_info = pstmt.executeQuery();
			
			/*System.out.println("pstmt " + (pstmt != null));
			System.out.println("student_info " + (student_info != null));
			// Test pstmt and student_info
	        if (pstmt != null && student_info != null) {
	            // Print some information from the student_info result set
	            System.out.println("student_info.next() " + (student_info.next()));
	            do {
	            	String student_information = student_info.getString("student_id") 
							+ " " +
							student_info.getString("ssn")
							+ " " +
							student_info.getString("first_name")
							+ " " +
							student_info.getString("middle_name")
							+ " " +
							student_info.getString("last_name")
							+ " " +
							student_info.getString("resident_status")
							+ " " +
							student_info.getString("units")
							+ " " +
							student_info.getString("grade");
                    System.out.println(student_information);
                } while (student_info.next());
	        }*/
			
			connection.commit();
			connection.setAutoCommit(true);
		}
	%>

	<%-- Form --%>
	<h2>Class Option</h2>
	<form action="1b.jsp" method="POST">
		<div>
			Class:
			<select name="class_information">
				<%
				if (class_info.isBeforeFirst())
				{
					while(class_info.next())
					{
						String class_information = class_info.getString("new_number") 
								+ " " +
								class_info.getString("year")
								+ " " +
								class_info.getString("quarter")
								+ " " +
								class_info.getString("section_id")
								+ " " +
								class_info.getString("title");
						
						
						%>
						<option value="<%=class_information%>"><%=class_information%></option>
						<%
					}
				}
				%>
			</select>
		</div>
		
		<button type="submit" name="action" value="submit">Submit</button>
	</form>
	
	<h3>Students Enrolled In</h3>
	<%
	String[] info = request.getParameter("class_information").split(" ");
	%>
	<table style="width:100%">
		<tr>
			<th>Course</th>
            <th>Section ID</th>
            <th>Class Title</th>
			<th>Year</th>
            <th>Quarter</th>
		</tr>
		<%
		if(info.length != 0)
		{	
		%>	
			<tr>
				<td><%=info[0] %></td>
				<td><%=info[3] %></td>
				<td><%=info[4] %></td>
				<td><%=info[1] %></td>
				<td><%=info[2] %></td>
			</tr>
		<%
		}
		%>
		<form>
		
		</form>
	</table>
	
	<h3>Student Information</h3>
	<%-- Table --%>
	
		<%
		if(student_info != null)
		{	
			//System.out.println("Test0: " + student_info.isBeforeFirst());
			
			if(student_info.isBeforeFirst())
			{
				//System.out.println("Test1");
				while(student_info.next())
				{
					//System.out.println("Hello");
				%>	
				<table style="width:100%">
		<tr>
			<th>student_id</th>
			<th>ssn</th>
            <th>first_name</th>
            <th>middle_name</th>
            <th>last_name</th>
            <th>resident_status</th>
            <th>units</th>
			<th>grade</th>
		</tr>
		
		<form>
					<tr>
						<td><%=student_info.getString("student_id") %></td>
						<td><%=student_info.getString("ssn") %></td>
						<td><%=student_info.getString("first_name") %></td>
						<td><%=student_info.getString("middle_name") %></td>
						<td><%=student_info.getString("last_name") %></td>
						<td><%=student_info.getString("resident_status") %></td>
						<td><%=student_info.getString("units") %></td>
						<%
							String grade = student_info.getString("grade");
							
							if(grade.equals("S/U"))
							{
								grade = "S/U";
							}
							else
								grade = "Letter";
						%>
						<td><%=grade %></td>
					</tr>
					</form>
	</table>
				<%
				}
			}
			else
			{
			%>
			<p>No Student Information</p>
			<%
			}
		}
		%>
		

	<%-- Close --%>
	<%
		// Close the ResultSet
		//rs.close();
		// Close the Statement
		//stmt.close();
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