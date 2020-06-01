<%@ page contentType="text/html; charset=UTF-8" import="java.sql.*" %>

<%
	Class.forName("com.mysql.jdbc.Driver");  //load the driver 
	String DB_URL = "jdbc:mysql://localhost:3306/addressbook?useUnicode=true&characterEncoding=utf8&useSSL=false"; //db url
	try {
		Connection con = DriverManager.getConnection(DB_URL, "admin", "1234");  //get connection
		Statement stmt = con.createStatement();  //create statement
		String query = "SELECT distinct grp from info order by grp";  //query all the group names in info table
		ResultSet rs = stmt.executeQuery(query);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>Edit contact information</title>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">  <!-- icons -->
<link href="home.css" type="text/css" rel="stylesheet">  <!-- css file -->

</head>
<body>
	<header>
		<div class="icon-bar">  <!-- main menus -->
			<a href="user_list.jsp"><i class="material-icons">person</i></a> 
			<a href="group_list.jsp"><i class="material-icons">people</i></a> 
			<a href="trash.jsp"><i class="material-icons">delete</i></a>
		</div>
	</header>
	<br>
	<section>
   <div class="wide">
      <h3>Add new contact</h3><br><br>
      <form name="form" action="user_save_do.jsp" method="post" id="formId" enctype="multipart/form-data"> <!-- form for adding new contact -->
      	 Group name: &nbsp;  
         <select name="grp">
         <option value=""></option> 
         <% while(rs.next()){%>
         <option value="<%=rs.getString("grp")%>"><%=rs.getString("grp")%></option> <!-- display group names in drop down -->
         <%} %>
         </select> Or <input type="text" name="ngrp" placeholder=" Add a new group" id="ngrp" style="width:150px"><br> <!-- or an empty input text for adding new grou -->p
         <input type="text" name="fname" placeholder="First name" id="fname"><br>
         <input type="text" name="lname" placeholder="Last name" id="lname"><br>
         <input type="tel" name="phone" placeholder="Phone number" id="phone"><br>
         <input type="email" name="email" placeholder="Email address" id="email"><br>
         <input type="text" name="pos" placeholder="Position" id="pos"><br>
         <input type="text" name="dept" placeholder="Department" id="dept"><br>
         <input type="text" name="title" placeholder="Title" id="title"><br> 
         <input type="date" name="bday" placeholder="Birthday" id="bday"><br> 
         <input type="text" name="addr" placeholder="Address" id="addr"><br> 
         <input type="url" name="homepg" placeholder="Homepage" id="homepg"><br> 
         <input type="text" name="sns" placeholder="SNS ID" id="sns"><br><br>
         <span style="">Upload picture: </span>
         <input type="file" name="file" value="Upload picture"><br><br>
         <div>
            Memo: 
            <input type="text" name="memo" placeholder="Enter text here" id="memo" maxlength="50" size="50"><br><br>
         </div>
         <input type="reset" value="Reset" style="width: 100px" onclick="alert('Do you want to reset?')">   <!-- for resetting the form -->
         <input type="submit" value="Submit" style="width: 100px"><br><br><br> <!--  submit the form and redirected to the user_save_do.jsp -->
      </form>
   </div>
</section>
		<%
				rs.close();
				stmt.close();
				con.close();
			} catch (SQLException e) {
				out.println("err:" + e.toString());
			}
	
		%>
		<footer>
		Copyright © 2017. INHA UNIVERSITY
		</footer>
</body>
</html>