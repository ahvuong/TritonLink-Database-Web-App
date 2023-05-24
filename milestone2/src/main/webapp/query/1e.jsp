<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>MS Degree Requirement Report</title>
</head>
<style>
	table,
	th,
	td {
		border: 1px solid black;
	}
</style>

<body>

	<%
    try {
        DriverManager.registerDriver(new org.postgresql.Driver());
    
        Connection connection = DriverManager.getConnection(
        		"jdbc:postgresql:tables?user=postgres&password=ahvuong");
    
        String action = request.getParameter("action");
        
        String student_id = "";
        String ssn = "";
		String first = "";
		String middle = "";
		String last = "";
		
        ResultSet student_info = null;
        ResultSet class_info = null;
        ResultSet degree_info = null;
        ResultSet filter_degree = null; 

        HashMap <String, Integer> required_units = new HashMap<>();
        HashMap <String, Integer> archieved_units = new HashMap<>();
        
        /* -------------------------------------------------- */
        HashMap<String, HashMap<String, ArrayList<String>>> concentration_db = new HashMap<>();

	    String sql = "SELECT department, concentration, class_name FROM concentration";
	    PreparedStatement statement = connection.prepareStatement(sql);
	    ResultSet resultSet = statement.executeQuery();
	
	    while (resultSet.next()) {
	        String department = resultSet.getString("department");
	        String concentration = resultSet.getString("concentration");
	        String className = resultSet.getString("class_name");
	
	        // Check if the department already exists in the HashMap
	        if (!concentration_db.containsKey(department)) {
	            concentration_db.put(department, new HashMap<>());
	        }
	
	        // Check if the concentration already exists in the department
	        HashMap<String, ArrayList<String>> departmentConcentrations = concentration_db.get(department);
	        if (!departmentConcentrations.containsKey(concentration)) {
	            departmentConcentrations.put(concentration, new ArrayList<>());
	        }
	
	        // Add the class to the concentration in the department
	        ArrayList<String> concentrationClasses = departmentConcentrations.get(concentration);
	        concentrationClasses.add(className);
	    }  
        
        /* -------------------------------------------------- */
        
        connection.setAutoCommit(false);
    	PreparedStatement pstmt2 = connection.prepareStatement("SELECT * FROM students where student_id in (select student_id from ms_student)");
    	student_info = pstmt2.executeQuery();

    	PreparedStatement pstmt5 = connection.prepareStatement("SELECT * FROM ms_student");
    	filter_degree = pstmt5.executeQuery(); 
    	
    	connection.commit();
    	connection.setAutoCommit(true);
    	
        if (action != null && action.equals("submit")) {
        	
            connection.setAutoCommit(false);
            
            String correct_major = null;
            
            PreparedStatement pstmt4 = connection.prepareStatement(
    				"SELECT * FROM ms_student where student_id = ?"
    		);
            
            pstmt4.setInt(1, Integer.parseInt(request.getParameter("student_id")));

            ResultSet major_info = pstmt4.executeQuery();
            
            while (major_info.next()) {
            	correct_major = major_info.getString("department");
            }
            
            String majorValue = request.getParameter("department"); 
            if (majorValue.equals(correct_major)) { 
                PreparedStatement pstmt = connection.prepareStatement(
    				"SELECT * FROM ms_degree where ms_name = ?"
    			);
    			
                pstmt.setString(1, correct_major);

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
	<form action="1e.jsp" method="POST">

		<div>
			<select name="student_id">
			<option>--Choose A Student--</option>
				<%
					if (student_info.isBeforeFirst())
					{
						while(student_info.next()){
							student_id = student_info.getString("student_id");
							ssn = student_info.getString("ssn");
							first = student_info.getString("first_name");
							middle = student_info.getString("middle_name");
							last = student_info.getString("last_name");
							
							if (middle.equals("NULL"))
								middle = "";
							
							String student_information = "SSN: " + ssn + " " + 
														"First Name: " + first + " " + 
														"Middle Name: " + middle + " " +
														"Last Name: " + last + " ";
							%>
				<option value=<%=student_id%>><%=student_information%></option>
				<%
						}
					}
					%>
			</select>

		</div>
		<br>

		<div>
			<select name="department">
			<option>--Degree Name and Type--</option>
				<%
					if (filter_degree.isBeforeFirst())
					{
						while(filter_degree.next()){
	                       String degree = filter_degree.getString("department");
							%>
				<option value="<%=degree %>"><%=degree %> (MS)</option>
				<%
						}
					}
					%>
			</select>
		</div>
		<br>

		<button type="submit" name="action" value="submit">Submit</button>

	</form>

	<% 
		String dept = "";
		double concentration_min_grade = 0;
  	 		if (degree_info != null) {
  				if (degree_info.isBeforeFirst()) {
					while(degree_info.next()) { 
					    int concentration_1_units = degree_info.getInt("concentration_1_units");
					    int concentration_2_units = degree_info.getInt("concentration_2_units");
					    int concentration_3_units = degree_info.getInt("concentration_3_units");
					    dept = degree_info.getString("ms_name"); 
					   	concentration_min_grade = degree_info.getInt("concentration_min_grade");
					    
					    required_units.put("concentration_1_units", concentration_1_units);
					    required_units.put("concentration_2_units", concentration_2_units);
					    required_units.put("concentration_3_units", concentration_3_units);
					}
				}	
  			}  
  	 		
			ArrayList<String> concentration_1_courses_done = new ArrayList<>();
			ArrayList<String> concentration_2_courses_done = new ArrayList<>();
			ArrayList<String> concentration_3_courses_done = new ArrayList<>();
			
  	 		if (class_info != null) {
				archieved_units.put("concentration_1_units", 0);
				archieved_units.put("concentration_2_units", 0);
				archieved_units.put("concentration_3_units", 0);
  				if (class_info.isBeforeFirst()) {
					while(class_info.next()) { 
						String class_type = class_info.getString("class_type");
						String title = class_info.getString("title");
						int units = class_info.getInt("units");
						if (class_info.getString("grade").equals("D") || class_info.getString("grade").equals("U") || class_info.getString("grade").equals("I")) {
							continue;
						}
						if (class_info.getDouble("grade_conversion") >= concentration_min_grade || class_info.getString("grade").equals("S")) {
							if (class_type.equals("concentration_1_units")) {
								archieved_units.put("concentration_1_units", archieved_units.get("concentration_1_units") + units);
								concentration_1_courses_done.add(title);
							}
							if (class_type.equals("concentration_2_units")) {
								archieved_units.put("concentration_2_units", archieved_units.get("concentration_2_units") + units);
								concentration_2_courses_done.add(title);
							}
							if (class_type.equals("concentration_3_units")) {
								archieved_units.put("concentration_3_units", archieved_units.get("concentration_3_units") + units);
								concentration_3_courses_done.add(title);
							}
						}
					}
				}	
  			}
	 		
   	 		int concentration_1_remain = 0;	
 	 		int concentration_2_remain = 0;
 	 		int concentration_3_remain = 0;
 	 		int total_remain = 0;		

 	 			
   	 	 	if (class_info != null && degree_info != null) { 
		 		if(archieved_units.get("concentration_1_units")>= required_units.get("concentration_1_units")) {
		 			concentration_1_remain = 0;
		 		} else {
		 			concentration_1_remain = required_units.get("concentration_1_units") - archieved_units.get("concentration_1_units");
		 		}
		 		
		 		if(archieved_units.get("concentration_2_units")>= required_units.get("concentration_2_units")) {
		 			concentration_2_remain = 0;
		 		} else {
		 			concentration_2_remain = required_units.get("concentration_2_units") - archieved_units.get("concentration_2_units");
		 		}
		 		
		 		if(archieved_units.get("concentration_3_units")>= required_units.get("concentration_3_units")) {
		 			concentration_3_remain = 0;
		 		} else {
		 			concentration_3_remain = required_units.get("concentration_3_units") - archieved_units.get("concentration_3_units");
		 		}
		 		
		 		
		 		total_remain = concentration_1_remain + concentration_2_remain + concentration_3_remain;
 	 		 }    
	 		
	 		if (class_info != null) {    
	 		%>

	<%-- Table --%>
	<br>
	<table style="width:100%">
		<tr>
			<th>Student ID</th>
			<th>Concentration_1 Units Remaining</th>
			<th>Concentration_2 Units Remaining</th>
			<th>Concentration_3 Units Remaining</th>
			<th>Total</th>

		</tr>
		<tr>
			<td><%= request.getParameter("student_id") %></td>
			<td><%= concentration_1_remain %></td>
			<td><%= concentration_2_remain %></td>
			<td><%= concentration_3_remain %></td>
			<td><%= total_remain %></td>
		</tr>
	</table>
	<br>
	<% 
				String completed_concentration = "";
				if (concentration_1_remain == 0){
					completed_concentration = "Concentration 1 \n";
				} 
				if (concentration_2_remain == 0) {
					completed_concentration = completed_concentration + " Concentration 2 \n";
				}
				if (concentration_3_remain == 0) {
					completed_concentration = completed_concentration + " Concentration 3 \n";
				}
				%>
	<table style="width:100%">
		<tr>
			<th>Student ID</th>
			<th>Completed Concentration</th>
		</tr>
		<tr>
			<td><%= request.getParameter("student_id") %></td>
			<td><%= completed_concentration %></td>
		</tr>
	</table>

	<% } else { %>
	<p><strong>Wrong Department, please choose again!</strong></p>
	<% } 
			
	        /* -------------------------------------------------- */
	        String course_1_remain = "";
	        String course_2_remain = "";
	        String course_3_remain = "";
	        
 	        if (class_info != null && degree_info != null) {   
				for (String department : concentration_db.keySet()) {
			         if (department.equals(dept)) { 
				        // Get the inner map for the department
				        HashMap<String, ArrayList<String>> departmentConcentrations = concentration_db.get(department);	        		
				        // Iterate over the inner map's keys
				        for (String concentration : departmentConcentrations.keySet()) {
							
				            // Get the list of classes for the concentration
				            ArrayList<String> concentrationClasses = departmentConcentrations.get(concentration);
				            if (concentration.equals("concentration_1")) {
					            // Iterate over the classes and print them
					            for (String className : concentrationClasses) {
					             	//System.out.println("className: " + className); 
					            	
					            	if (!concentration_1_courses_done.contains(className)) {
					            		//System.out.println(!concentration_1_courses_done.contains(className));  	
					                	course_1_remain = course_1_remain + "\n " + className;
					                	//System.out.println(course_1_remain);
					                }				         
					            }
				            }
				            if (concentration.equals("concentration_2")) {
					            // Iterate over the classes and print them
					            for (String className : concentrationClasses) {

					               	if (!concentration_2_courses_done.contains(className)) {
					                	//System.out.println(!concentration_2_courses_done.contains(className));
					                	course_2_remain = course_2_remain + "\n " + className;
					                	//System.out.println(course_2_remain);
					                }				         
					            }
				            }
				            if (concentration.equals("concentration_3")) {
					            // Iterate over the classes and print them
					            for (String className : concentrationClasses) {

					                if (!concentration_3_courses_done.contains(className)) {
					                	//System.out.println(!concentration_3_courses_done.contains(className));
					                	course_3_remain = course_3_remain + "\n " + className;
					                	//System.out.println(course_3_remain);
					                }				         
					            }
				            }
				        }		        
				    }
		        }
 	        }
	        
		%>
	<br>
	<table style="width:100%">
		<tr>
			<th>Student ID</th>
			<th>Concentration 1 Courses Remain</th>
			<th>Concentration 2 Courses Remain</th>
			<th>Concentration 3 Courses Remain</th>
		</tr>
		<tr>
			<td><%= request.getParameter("student_id") %></td>
			<td><%= course_1_remain %></td>
			<td><%= course_2_remain %></td>
			<td><%= course_3_remain %></td>
		</tr>
	</table>
	<br>

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
<a href="../../index.html">Go to Home Page</a>
</html>