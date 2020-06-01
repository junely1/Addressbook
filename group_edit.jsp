<%@ page contentType="text/html; charset=UTF-8"
	import="java.sql.*, myBean.DB.*"%>
<%
	request.setCharacterEncoding("utf-8");
	String grp = request.getParameter("grp"); //obtain the group variable
%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>Group manager</title>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet"> <!-- using icons-->
<link href="home.css" type="text/css" rel="stylesheet"> <!-- for design and style-->
</head>
<body>
	<header>
		<div class="icon-bar"> <!-- main menus on the top of the page -->
			<a href="user_list.jsp"><i class="material-icons">person</i></a>  <!-- All contacts menu -->
			<a href="group_list.jsp"><i class="material-icons" style="background-color: #99d6ff">people</i></a> <!-- group list menu -->
			<a href="trash.jsp"><i class="material-icons">delete</i></a> <!-- trash menu -->
		</div>
	</header>
	<br>
	<h2>Manage group</h2>
	<!-- page for managin the groups-->
	<section>
		<br>
		<div style="margin-left: 300px">
			<form action="group_save.jsp?grp=<%=grp%>" method="post"> <!-- form for saving the name of the group-->
				Group name: <input type="text" value="<%=grp%>" name="sgrp"> <!-- group nam can be modified -->
				<br><br> 
				<input type="submit" value="save" style="width: 70px"> <!-- save -->
				<input type="button"
					onclick="location.href='group_delete.jsp?grp=<%=grp%>'"
					value="delete" style="width: 70px; margin-left: 30px"> <!--  button for deleting -->
			</form>
		</div>
	</section>

	<footer> Copyright © 2017. INHA UNIVERSITY </footer>
</body>
</html>