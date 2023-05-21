<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>undergraduate degree remaining</title>
</head>


<body>

	<%
    try {
        DriverManager.registerDriver(new org.postgresql.Driver());
    
        Connection connection = DriverManager.getConnection("jdbc:postgresql:tables?user=postgres&password=trungtinvo");
    
        String action = request.getParameter("action");
        
        ResultSet student_info = null;
        ResultSet class_info = null;
        ResultSet degree_info = null;
        ResultSet filter_degree = null; 

        HashMap <String, Integer> required_units = new HashMap<>();
        HashMap <String, Integer> archieved_units = new HashMap<>();
        
        connection.setAutoCommit(false);
    	PreparedStatement pstmt2 = connection.prepareStatement("SELECT * FROM students where student_id in (select student_id from undergraduate)");
    	student_info = pstmt2.executeQuery();

    	PreparedStatement pstmt5 = connection.prepareStatement("SELECT * FROM undergraduate");
    	filter_degree = pstmt5.executeQuery(); 
    	
    	connection.commit();
    	connection.setAutoCommit(true);
    	
        if (action != null && action.equals("submit")) {
        	
            connection.setAutoCommit(false);
            
            String correct_major = null;
            
            PreparedStatement pstmt4 = connection.prepareStatement(
    				"SELECT * FROM undergraduate where student_id = ?"
    		);
            
            pstmt4.setInt(1, Integer.parseInt(request.getParameter("student_id")));

            ResultSet major_info = pstmt4.executeQuery();
            
            while (major_info.next()) {
            	correct_major = major_info.getString("major");
            }
            
             String majorValue = request.getParameter("major"); 
             if (majorValue.equals(correct_major)) { 
                PreparedStatement pstmt = connection.prepareStatement(
    				"SELECT * FROM degree where degree_name = ? AND degree_type = ?"
    			);
    			
                pstmt.setString(1, correct_major);
                pstmt.setString(2, "BS");

                degree_info = pstmt.executeQuery();	

            PreparedStatement pstmt3 = connection.prepareStatement(
    				"SELECT * FROM past_classes where student_id = ?"
    		);
    			
            pstmt3.setInt(1, Integer.parseInt(request.getParameter("student_id")));

            class_info = pstmt3.executeQuery();
            
            connection.commit();
            connection.setAutoCommit(true);
           	}
            
        }
        

    %>

	<h2>Choose Student And Degree Info</h2>
	<form action="1d.jsp" method="POST">

		<div>
			Student:
			<select name="student_id">
				<%
					if (student_info.isBeforeFirst())
					{
						while(student_info.next()){
	                       
							%>
				<option value="<%=student_info.getString("student_id")%>">
					<%=student_info.getString("first_name")%>
					<%=student_info.getString("middle_name").equals("NULL")? " " : student_info.getString("middle_name")%>
					<%=student_info.getString("last_name")%>
					(SSN: <%=student_info.getString("ssn")%>)
				</option>
				<%
						}
					}
					%>
			</select>

		</div>

		<div>
			Degree Name and Type:
			<select name="major">
				<%
					if (filter_degree.isBeforeFirst())
					{
						while(filter_degree.next()){
	                       
							%>
				<option value="<%=filter_degree.getString("major")%>">
					<%=filter_degree.getString("major")%>
					(BS)
				</option>
				<%
						}
					}
					%>
			</select>
		</div>


		<button type="submit" name="action" value="submit">Submit</button>

	</form>


	<h3> </h3>
	<table>
		<tr>
			<th>Student id</th>
			<th>Upper Units Remaining</th>
			<th>Lower Units Remaining</th>
			<th>Total</th>

		</tr>

		<% 
  	 		if (degree_info != null) {
  				if (degree_info.isBeforeFirst()) {
					while(degree_info.next()) { 
/* 					    System.out.println("upper_units1: " + required_units.get("upper_units"));
					    System.out.println("lower_units1: " + required_units.get("lower_units")); */
					    int upperUnits = degree_info.getInt("upper_units");
					    int lowerUnits = degree_info.getInt("lower_units");

					    required_units.put("upper_units", upperUnits);
					    required_units.put("lower_units", lowerUnits);
		
/*  					System.out.println("upper_units1: " + required_units.get("upper_units"));
					    System.out.println("lower_units1: " + required_units.get("lower_units"));  */
					}
				}	
  			}  
	 			 		
  	 		if (class_info != null) {
				archieved_units.put("upper_units", 0);
				archieved_units.put("lower_units", 0);
  				if (class_info.isBeforeFirst()) {
					while(class_info.next()) { 
						String class_type = class_info.getString("class_type");
						int units = class_info.getInt("units");

						if (class_type.equals("upper_units")) {
							archieved_units.put("upper_units", archieved_units.get("upper_units") + units);
						}
						if (class_type.equals("lower_units")) {
							archieved_units.put("lower_units", archieved_units.get("lower_units") + units);
						}
		/* 			    System.out.println("upper_units2: " + archieved_units.get("upper_units"));
					    System.out.println("lower_units2: " + archieved_units.get("lower_units")); */
					}
				}	
  			}
   	 		int upper_remain = 0;	
 	 		int lower_remain = 0;
 	 		int total_remain = 0;
  	 		

			System.out.println("upper_units1: " + required_units.get("upper_units"));
		    System.out.println("lower_units1: " + required_units.get("lower_units")); 
		    System.out.println("upper_units2: " + archieved_units.get("upper_units"));
		    System.out.println("lower_units2: " + archieved_units.get("lower_units"));
 	 		
 	 		
   	 	/* 	if (class_info != null && degree_info != null) { */
		 		if(archieved_units.get("upper_units")>= required_units.get("upper_units")) {
		 			upper_remain = 0;
		 		} else {
		 			upper_remain = required_units.get("upper_units") - archieved_units.get("upper_units");
		 		}
		 		
		 		if(archieved_units.get("lower_units")>= required_units.get("lower_units")) {
		 			lower_remain = 0;
		 		} else {
		 			lower_remain = required_units.get("lower_units") - archieved_units.get("lower_units");
		 		}
		 		total_remain = upper_remain + lower_remain;
 	 		/* } */   
	 		
	 		if (class_info != null) {   
		 
	 		%>
		<tr>
			<td><%= request.getParameter("student_id") %></td>
			<td><%= upper_remain %></td>
			<td><%= lower_remain %></td>
			<td><%= total_remain %></td>
		</tr>

		<% 
	 		  }  
	  %>

	</table>

	<%-- iteration --%>

	<%
      connection.close();
           
      } catch (SQLException e1) {
    	  throw new RuntimeException("SQL Exception!", e1); 
    	  
      } catch (Exception e2) {
    	  throw new RuntimeException("Exception!", e2); 
      }
      %>

</body>

</html>