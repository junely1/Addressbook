<%@ page contentType="text/html; charset=UTF-8" import="java.sql.*, myBean.DB.*"%>

<%
	Class.forName("com.mysql.jdbc.Driver");  //load the drive
	String DB_URL = "jdbc:mysql://localhost:3306/addressbook?useUnicode=true&characterEncoding=utf8&useSSL=false";  //db url
	String sgrp = request.getParameter("grp");  //obtain the group parameter
	String ssrch = request.getParameter("search"); //obtain the search parameter
	String search_sql; 
	String search_grp;
	String sql;
	int count = 0; 
	PreparedStatement pstmt;
	ResultSet rslt;
	if (sgrp == null){  //in case of group being empty 
	sgrp = "My contact";  //default
	}
	if (ssrch == null){  //if search is empty
		search_sql = "grp = ?";  //just query the group members
		}
	else{  //if search is not empty
		search_grp = null;  //no group is searched
		search_sql = " grp like '%"+ssrch+"%' or fname like '%"+ssrch+"%' or lname like '%"+ssrch+"%' or pos like '%"+ssrch+"%'";  //query for searching 
		} 
	try {  //connect and query for group list
		Connection con = DriverManager.getConnection(DB_URL, "admin", "1234");
		Statement stmt = con.createStatement();
		String query = "SELECT distinct grp from info order by grp";
		ResultSet rs = stmt.executeQuery(query);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>Group list</title>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link href="home.css" type="text/css" rel="stylesheet">
</head>
<body>
	<header>
		<div class="icon-bar">  <!-- main menus -->
			<a href="user_list.jsp"><i class="material-icons">person</i></a> 
			<a href="group_list.jsp"><i class="material-icons" style="background-color: #99d6ff">people</i></a> 
			<a href="trash.jsp"><i class="material-icons">delete</i></a>
		</div>
	</header>
	<br>
	<h3>&nbsp;&nbsp;Group list</h3>
	<section>
		<form action="group_get.jsp" method="post">  <!-- search form -->
		<input type="submit" class="submit" value="Search">
		<input type="text" class="search" name="search" placeholder="Search contact..">
		</form>
		<br>
		<%
			while (rs.next()) {
		 %>
		 
		 <% if(rs.getString(1).equals("My contact")){%>
		<span class="vertical-menu">
				<a href="group_get.jsp?grp=<%=rs.getString(1)%>"><%=rs.getString(1)%></a>  <!-- display the deafult my contact group -->
		</span>
		<br>
		<% } else { %>
		<span class="vertical-menu">
				<a href="group_get.jsp?grp=<%=rs.getString(1)%>"><%=rs.getString(1)%></a> <!-- display the group list -->
		</span>
		<a href="group_edit.jsp?grp=<%=rs.getString(1)%>"><i class="material-icons" style="font-size:30px; width:30px">mode_edit</i></a> <!-- edit icons -->
		<% } %> 
		<br><br>
		<%
		count++;
		} 
		%>
		<span style="float: left">Number of groups : <%=count %></span><br><br> <!--  display number of groups -->
		<% 
		if (ssrch != null){  /* if there search */
			sql = "SELECT idx, fname, lname, phone, email, pos, dept, title from info where "+search_sql;
			pstmt = con.prepareStatement(sql);
			rslt = pstmt.executeQuery();
		}
		else { /*  if there is no search */
			sql = "SELECT idx, fname, lname, phone, email, pos, dept, title from info where grp=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, sgrp);
			rslt = pstmt.executeQuery();
		}
		count = 0;
		%>
	<br>
	 <h3>&nbsp;&nbsp;Group members</h3>  <!-- display group members -->
		<div class="member-menu">
		<table  border="1" style="border-collapse: collapse">
			<tr>
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
				while (rslt.next()) {
			%>
			<tr>
				<td><a href="user_get.jsp?idx=<%=rslt.getInt("idx")%>"><%=rslt.getString(2)%></a></td>	
				<td><%=rslt.getString(3)%></td>
				<td><%=rslt.getString(4)%></td>
				<td><%=rslt.getString(5)%></td>
				<td><%=rslt.getString(6)%></td>
				<td><%=rslt.getString(7)%></td>
				<td><%=rslt.getString(8)%></td>
				<td>
				<!-- edit and delete icons for each members -->
				<a href="user_edit.jsp?idx=<%=rslt.getInt("idx")%>"><i class="material-icons" style="font-size:30px; width:30px">mode_edit</i></a> 
				<a href="user_delete_do.jsp?idx=<%=rslt.getInt("idx")%>"><i class="material-icons" style="font-size:30px; width:30px">delete</i></a>
				</td>
			</tr>
			<%
			count++;
				}
			%>
		</table>
		<span>Number of contacts : <%=count %></span>  <!-- display number of contacts in the group or search result -->
		</div>
		<%
				rs.close();
				stmt.close();
				con.close();
			} catch (SQLException e) {
				out.println("err:" + e.toString());
			}
		%>
	</section>
	
	<footer> Copyright © 2017. INHA UNIVERSITY </footer>
</body>
</html>