<%@ page contentType="text/html; charset=UTF-8" import="java.sql.*"%>

<%
	int count = 0;
	Class.forName("com.mysql.jdbc.Driver");  //load the driver
	String DB_URL = "jdbc:mysql://localhost:3306/addressbook?useUnicode=true&characterEncoding=utf8&useSSL=false"; //db url
	try {
		Connection con = DriverManager.getConnection(DB_URL, "admin", "1234");  //obtain the connection 
		Statement stmt = con.createStatement();  ///create statement
		String query = "SELECT idx, grp, fname, lname, phone, email, pos, dept, title from info order by fname"; //some information about the contact lists
		ResultSet rs = stmt.executeQuery(query);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>Contacts</title>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">  <!-- icons -->
<link href="home.css" type="text/css" rel="stylesheet">  <!-- css file -->
</head>
<body>
	<header>
		<div class="icon-bar">  <!-- main menus -->
			<a href="user_list.jsp"><i class="material-icons" style="background-color: #99d6ff">person</i></a> 
			<a href="group_list.jsp"><i class="material-icons">people</i></a> 
			<a href="trash.jsp"><i class="material-icons">delete</i></a>
		</div>
	</header>
	<br>
	<h3>&nbsp;&nbsp;All Contacts</h3>
	<section>
	 <a href="user_save.jsp" class="btn-floating btn-large waves-effect waves-light blue">
	 <i class="material-icons" style="float: right; margin-right: 40px; size: 40px">add</i> <!--  add icon button for adding new contact -->
	 </a><br><br>
		<table border="1" style="border-collapse: collapse">  <!-- display all the contact lists in the info table -->
			<tr>
				<th>Group</th>
				<th>First name</th>
				<th>Last name</th>
				<th>Phone</th>
				<th>Email</th>
				<th>Position</th>
				<th>Department</th>
				<th>Title</th>
				<th></th>
			</tr>
			<%
				while (rs.next()) {
			%>
			<tr>
				<td><%=rs.getString(2)%></td>
				<td><a href="user_get.jsp?idx=<%=rs.getInt("idx")%>"><%=rs.getString(3)%></a></td>	
				<td><%=rs.getString(4)%></td>
				<td><%=rs.getString(5)%></td>
				<td><%=rs.getString(6)%></td>
				<td><%=rs.getString(7)%></td>
				<td><%=rs.getString(8)%></td>
				<td><%=rs.getString(9)%></td>
				<td> <!-- each has edit and delete button icons -->
				<a href="user_edit.jsp?idx=<%=rs.getInt("idx")%>"><i class="material-icons" style="font-size:30px; width:30px">mode_edit</i></a>
				<a href="user_delete_do.jsp?idx=<%=rs.getInt("idx")%>"><i class="material-icons" style="font-size:30px; width:30px">delete</i></a>
				</td>
			</tr>
			<%
				count++;
				}
			%>
		</table>
		<span>Number of contacts : <%=count %></span>  <!-- display the number of contacts -->
		<%
				rs.close();
				stmt.close();
				con.close();
			} catch (SQLException e) {
				out.println("err:" + e.toString());
			}
		%>
		</section>
		<footer>
		Copyright © 2017. INHA UNIVERSITY
		</footer>
</body>
</html>