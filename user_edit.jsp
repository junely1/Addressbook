<%@ page contentType="text/html; charset=UTF-8" import="myBean.DB.*, java.sql.*, javax.naming.NamingException"%>
<%

request.setCharacterEncoding("utf-8");
String idx = request.getParameter("idx");
Class.forName("com.mysql.jdbc.Driver");
String DB_URL = "jdbc:mysql://localhost:3306/addressbook?useUnicode=true&characterEncoding=utf8&useSSL=false";
try {
	Connection con = DriverManager.getConnection(DB_URL, "admin", "1234");
	Statement stmt = con.createStatement();
	String query = "SELECT distinct grp from info order by grp";
	ResultSet rs = stmt.executeQuery(query);
	UserInfoDB db = new UserInfoDB();
	UserInfo info = db.getInfo(Integer.parseInt(idx));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>Edit contact information</title>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link href="home.css" type="text/css" rel="stylesheet">

</head>
<body>
	<header>
		<div class="icon-bar">
			<a href="user_list.jsp"><i class="material-icons">person</i></a> 
			<a href="group_list.jsp"><i class="material-icons">people</i></a> 
			<a href="trash.jsp"><i class="material-icons">delete</i></a>
		</div>
	</header>
	<br>
	<section>
   <div class="wide">
      <h3>Edit contact</h3><br>
      <form name="form" action="user_edit_do.jsp?idx=<%=idx%>&photo=<%=info.getFile()%>" method="post" id="formId" enctype="multipart/form-data">
      	 <img src="<%="./upload/"+info.getFile()%>" width="100px" height="110px"><br>
         <span>Change picture:</span>
         <input type="file" name="file" value="Upload picture"><br><br>&nbsp;
      	 Group name: &nbsp;
         <select name="grp">
         <option value="<%=info.getGrp()%>"><%=info.getGrp()%></option>
         <% while(rs.next()){ 
         if (!rs.getString("grp").equals(info.getGrp())){ %>
         <option value="<%=rs.getString("grp")%>"><%=rs.getString("grp")%></option>
         <%}} %>
         </select> &nbsp;Or <input type="text" name="ngrp" placeholder=" Add a new group" id="ngrp" style="width:150px">
         
      <table>
      <tr>
         <td>First name </td>
         <td><input type="text" name="fname" value="<%=info.getFname()%>"></td>
      </tr>
      <tr>
         <td>Last name </td>
         <td><input type="text" name="lname" value="<%=info.getLname()%>"></td>
      </tr>
      <tr>
         <td>Phone number</td>
         <td><input type="tel" name="phone" value="<%=info.getPhone()%>"></td>
      </tr>
      <tr>
         <td>Email address</td>
         <td><input type="email" name="email" value="<%=info.getEmail()%>"></td>
      </tr>
      <tr>
         <td>Position</td>
         <td><input type="text" name="pos" value="<%=info.getPos()%>"></td>
      </tr>
      <tr>
         <td>Department</td>
         <td><input type="text" name="dept" value="<%=info.getDept()%>"></td>
      </tr>
      <tr>
         <td>Title</td>
         <td><input type="text" name="title" value="<%=info.getTitle()%>"></td>
      </tr>
      <tr> 
         <td>Birthday </td>
         <td><input type="date" name="bday" value="<%=info.getBday()%>"></td>
      <tr>
         <td>Address</td>
         <td><input type="text" name="addr" value="<%=info.getAddr()%>"></td>
      </tr>
      <tr>
         <td>Homepage</td>
         <td><input type="url" name="homepg" value="<%=info.getHomepg()%>"></td>
      </tr>
      <tr>
         <td>SNS ID</td>
         <td><input type="text" name="sns" value="<%=info.getSns()%>"></td>
      </tr>
      <tr>
         <td>Memo</td>
         <td><input type="text" name="memo" value="<%=info.getMemo()%>" maxlength="50" size="50"></td>
      </tr>
      </table>
      <input type="button" value="Go back" style="width: 100px" onClick="location.href='user_list.jsp'">
      <input type="submit" value="Submit" style="width: 100px">
      </form>
   </div>
   </section>
   <footer>
      Copyright © 2017. INHA UNIVERSITY
   </footer>
</body>
</html>
<%
db.close();
}
catch(SQLException e){
	out.print(e);
	return;
}
catch(NamingException e){
	out.print(e);
	return;
}
%>