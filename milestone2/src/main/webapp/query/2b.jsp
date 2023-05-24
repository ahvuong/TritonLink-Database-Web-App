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
	<%@ page language="java" import="java.sql.*" import="java.util.*" %>

	<%-- -------- Open Connection Code -------- --%>
	<%!
	// Function
	/*public String[] time(String date) {
		
		
		return res;
	}*/
	%>
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
		String second_action = request.getParameter("second_action");
		
		String num = "";
		String id = "";
		String title = "";
		String quarter = "";
		int year = 0;
		int sday = 0;
		int smonth = 0;
		int eday = 0;
		int emonth = 0;
		
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
	<% 
			PreparedStatement pstmt = null;
	
			String[] info = request.getParameter("class_information").split(" ");
						
			year = Integer.parseInt(info[7]);
			quarter = info[9];
			
			if(year == 2022 && quarter.equals("SP"))
			{
				pstmt = connection.prepareStatement(
						"SELECT * " +
						"FROM students " + 
						"NATURAL JOIN course_enrollment c " +
						"WHERE c.section_id = ? AND c.class_name = ?"
						);
				//System.out.println(info[3]);
				//System.out.println(info[1]);
				pstmt.setInt(1, Integer.parseInt(info[1]));	// class_name
				pstmt.setString(2, info[3]);		// section_id
				
				student_info = pstmt.executeQuery();
			}
			
			connection.commit();
			connection.setAutoCommit(true);
		}
		
		System.out.println("second_action: " + second_action);
		if (second_action != null && second_action.equals("submit")) 
		{
			String[] start = request.getParameter("start").split("-");
        	String[] end = request.getParameter("end").split("-");
        	
        	year = Integer.parseInt(start[0]);
        	smonth = Integer.parseInt(start[1]);
            emonth = Integer.parseInt(end[1]);
            sday = Integer.parseInt(start[2]);
            eday = Integer.parseInt(end[2]); 
            
			/*String start = request.getParameter("start");
			String end = request.getParameter("end");
			
			System.out.println(start);
			System.out.println(end);

			year = Integer.parseInt(start.substring(0,4));
			smonth = Integer.parseInt(start.substring(5,7));
			sday = Integer.parseInt(start.substring(8));
				
			emonth = Integer.parseInt(end.substring(5,7));
			eday = Integer.parseInt(end.substring(8));*/
				
			System.out.println("smonth " + smonth + " sday " + sday);
			System.out.println("emonth " + emonth + " eday " + eday);
		}
	%>

	<%-- Form --%>
	<h2>Review Schedule Information</h2>
	<form action="2b.jsp" method="POST">
		<div>
			<select name="class_information">
			<option>--Choose A Class--</option>
			<%
				if (class_info.isBeforeFirst())
				{
					while(class_info.next())
					{
						num = class_info.getString("new_number");
						year = class_info.getInt("year");
						quarter = class_info.getString("quarter");
						id = class_info.getString("section_id");
						title = class_info.getString("title");
						
						String class_information =  "Section: " + id + " " +
													"Course: " + num + " " +  
													"Class: " + title + " " + 
													"Year: " + String.valueOf(year) + " " + 
													"Quarter: " + quarter + " ";
						//System.out.println(class_information);
			%>
			<option value="<%=class_information%>"><%=class_information%></option>
			<%
					}
				}
			%>
			</select>
		</div>
		<br>
		
		<button type="submit" name="action" value="submit">Submit</button>
	</form>
	
	<h3>Students Enrolled In</h3>
	<%
	String[] info1 = request.getParameter("class_information").split(" ");
	%>
	<table style="width:100%">
		<tr>
			<th>Section ID</th>
			<th>Course</th>
            <th>Class Title</th>
			<th>Year</th>
            <th>Quarter</th>
		</tr>
		<%
		if(info1.length != 0)
		{	
		%>	
			<tr>
				<td><%=info1[3] %></td>
				<td><%=info1[1] %></td>
				<td><%=info1[5] %></td>
				<td><%=info1[7] %></td>
				<td><%=info1[9] %></td>
			</tr>
		<%
		}
		%>
	</table>
	<br>
	
	<h3>Choose Time Period</h3>
	<form action="2b.jsp" method="POST">
			<%
				if (quarter != null && quarter.equals("SP"))
				{
						//System.out.println(class_information);
						String start = "2022-04-01";
						String end = "2022-06-31";
			%>
			<label>START_DATE:</label>
			<input type="date" name="start" min=<%=start %> max=<%=end %>><br><br>
			<label>END_DATE:</label>
			<input type="date" name="end" min=<%=start %> max=<%=end %>>
			<%
					}
			%>
		<br>
		<button type="submit" name="second_action" value="submit">Submit</button>
	</form>
	<br>
	
	<h3>Review Schedule</h3>
	
	<%-- Table --%>
		<%
		if(student_info != null)
		{	%>
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
			</tr><%
			//System.out.println("Test0: " + student_info.isBeforeFirst());
			
			if(!student_info.isBeforeFirst())
			{
				%>
				<p>No Classes Are Taken</p>
				<%
			}
			else
			{
				
				//System.out.println("Test1");
				while(student_info.next())
				{
					//System.out.println("Hello");
				%>	
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
							
							if(grade.equals("S/U") || grade.equals("U") || grade.equals("S"))
							{
								grade = "S/U";
							}
							else
								grade = "Letter";
						%>
						<td><%=grade %></td>
					</tr>
				<%
				}
			}
		}
		else
		{
			%>
			<p><b>Note:</b> No Review Schedule For Classes Taken In The Past</p>
			<%
		}
		%>
		</form>
	</table>
	<br>

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
		out.println("Select Class Above First");
	}
	%>
	<br><br>
</body>
<a href="../../index.html">Go to Home Page</a>
</html>