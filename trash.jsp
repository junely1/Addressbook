<%@ page contentType="text/html; charset=UTF-8" import="java.sql.*, myBean.DB.*"%>

<%	
	int count = 0;
	Class.forName("com.mysql.jdbc.Driver");  //load the driver
	String DB_URL = "jdbc:mysql://localhost:3306/addressbook?useUnicode=true&characterEncoding=utf8&useSSL=false";  //db url
	try {
		Connection con = DriverManager.getConnection(DB_URL, "admin", "1234");  //obtain the connection
		Statement stmt = con.createStatement();  //create statement
		String query = "SELECT idx, grp, fname, lname, phone, email, pos, dept, title, bday, addr, homepg, sns, file, memo from trash order by fname";
		ResultSet rs = stmt.executeQuery(query);  //query all the datas of members in trash table
%>

<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>Trash</title>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">  <!-- icons -->
<link href="home.css" type="text/css" rel="stylesheet"> <!-- css file -->
</head>
<body>
	<header>
		<div class="icon-bar">  <!-- main menus -->
			<a href="user_list.jsp"><i class="material-icons">person</i></a> 
			<a href="group_list.jsp"><i class="material-icons">people</i></a> 
			<a href="trash.jsp"><i class="material-icons" style="background-color: #99d6ff">delete</i></a>
		</div>
	</header>
	<br>
	<h3>&nbsp;&nbsp;Trash</h3>
	<section>
	 <table border="1" style="border-collapse: collapse">  <!-- display the datas of the memebrs in trash table -->
			<tr>
				<th>Group</th>
				<th>First name</th>
				<th>Last name</th>
				<th>Phone</th>
				<th>Email</th>
				<th>Position</th>
				<th>Department</th>
				<th>Title</th>
				<th>Birthday</th>
				<th>Address</th>
				<th>Homepage</th>
				<th>SNS ID</th>
				<th>Photo</th>
				<th>Memo</th>
				<th></th>
			</tr>
			<%
				while (rs.next()) {
			%>
			<tr>
				<td><%=rs.getString(2)%></td>
				<td><%=rs.getString(3)%></td>
				<td><%=rs.getString(4)%></td>
				<td><%=rs.getString(5)%></td>
				<td><%=rs.getString(6)%></td>
				<td><%=rs.getString(7)%></td>
				<td><%=rs.getString(8)%></td>
				<td><%=rs.getString(9)%></td>
				<td><%=rs.getString(10)%></td>
				<td><%=rs.getString(11)%></td>
				<td><%=rs.getString(12)%></td>
				<td><%=rs.getString(13)%></td>
				<td><img src="<%="./upload/"+rs.getString(14)%>" width="50" height="50"></td> 
				<td><%=rs.getString(15)%></td>
				<TD>
				<!-- each has recover and delete button icons -->
				<a href="user_recover.jsp?idx=<%=rs.getInt("idx")%>"><i class="material-icons" style="font-size:30px; width:30px">restore</i></a>
				<a href="trash_delete.jsp?idx=<%=rs.getInt("idx")%>"><i class="material-icons" style="font-size:30px; width:30px">delete</i></a>
				</TD>
			</tr>
			<%
				count++;
				}
			%>
		</table>
		<span>Number of contacts : <%=count %></span>  <!-- display the number of contacts in trash table -->
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