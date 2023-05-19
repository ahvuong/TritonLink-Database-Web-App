<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>Advisor home page</title>
</head>

<body>
	<%-- Set the scripting language to Java and --%>
	<%@ page language="java" import="java.sql.*" %>

	<%-- -------- Open Connection Code -------- --%>
	<%
	String student_num = request.getParameter("student_num");
    final String CURRENT_QUARTER = "WINTER";  // default per project requirements
    final String CURRENT_YEAR = "2016";       // default per project requirements
    
	try {
				// Load Oracle Driver class file
				DriverManager.registerDriver (new org.postgresql.Driver());
				String GET_QUERY = "SELECT DISTINCT st.student_num AS st_num, first_name, middle_name, last_name " +
                        "FROM Student st " +
                        "JOIN SectionEnrollment se ON st.student_num = se.student_num " +
                        "JOIN Section s ON se.section_id = s.id " +
                        "JOIN Class c ON s.class_id = c.id " +
                        "WHERE c.quarter = '" + CURRENT_QUARTER + "' " +
                        "AND c.class_year = '" + CURRENT_YEAR + "' " +
                        "ORDER BY st.student_num ASC";
				
				// Make a connection to the Oracle datasource
				Connection connection = DriverManager.getConnection
				("jdbc:postgresql:tables?user=postgres&password=ahvuong");
				%>

	<%
				// Create the statement
				Statement stmt = connection.createStatement();
				
				// Use the statement to SELECT the advisor attributes
				// FROM the advisor table.
				ResultSet rs = null;
				
			if(student_num == null)
			{
					rs = stmt.executeQuery(GET_QUERY);
				%>
				<p>Select a student who is enrolled in the current quarter (<b><%=CURRENT_QUARTER%>&nbsp;<%=CURRENT_YEAR%></b>).
            	<br/>
            	<b>Note</b>: Students who are not enrolled in the current quarter
            	(<b><%=CURRENT_QUARTER%>&nbsp;<%=CURRENT_YEAR%></b>) are not shown.
            	<br/>
            	<b>Note</b>: Student_Num's are used instead of SSN.</p>
            	
            	<form action="1a.jsp" method="POST">
            	<select name="student_num" required>
            	<%
            		if(!rs.isBeforeFirst()) 
            		{
                %>
                    <option selected disabled>No students available</option>
                <%
                    } 
            		else 
            		{
                %>
                    	<option selected disabled>Select Student</option>
                <%
                        while (rs.next()) 
                        {
                        	String info = rs.getString("st_num") + " | " + rs.getString("first_name") + " " +
                        			rs.getString("middle_name") + " " + rs.getString("last_name");
                %>
                            <option value="<%=rs.getString("st_num")%>"><%=info%></option>
                <%
                    	}
                	}
            	%>
				</select>
            	<input type="submit" value="Submit">
            	</form>
            <%
            }  // end if request student_num == null
       		else
            {
            %>
            	<p>Classes for student_num '<b><%=student_num%></b>' for the current quarter:
            	<b><%=CURRENT_QUARTER%>&nbsp;<%=CURRENT_YEAR%></b>.</p>
            	<%
                rs = stmt.executeQuery(
                        "SELECT class_title, quarter, class_year, units_taking, section_num " +
                        "FROM SectionEnrollment se " +
                        "JOIN Section s ON se.section_id = s.id " +
                        "JOIN Class c ON s.class_id = c.id " +
                        "WHERE c.quarter = '" + CURRENT_QUARTER + "' " +
                        "AND c.class_year = '" + CURRENT_YEAR + "' " +
                        "AND se.student_num = '" + student_num + "' " +
                        "ORDER BY class_year, quarter, class_title");
                %>
                <table border="1">
                    <tr>
                        <th>Class_Title</th>
                        <th>Quarter</th>
                        <th>Class_Year</th>
                        <th>Units_Taking</th>
                        <th>Section_Num</th>
                    </tr>
                    <%
                    while (rs.next()) 
                    {
                        %>
                        <tr>
                            <td><input type="text" name="class_title" value="<%=rs.getString("class_title")%>" readonly></td>
                            <td><input type="text" name="quarter" value="<%=rs.getString("quarter")%>" readonly></td>
                            <td><input type="text" name="class_year" value="<%=rs.getString("class_year")%>" readonly></td>
                            <td><input type="text" name="units_taking" value="<%=rs.getInt("units_taking")%>" readonly></td>
                            <td><input type="text" name="section_num" value="<%=rs.getString("section_num")%>" readonly></td>
                        </tr>
                        <%
                    }
                    %>
                </table>
                <%
            }  // end else
            %>
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