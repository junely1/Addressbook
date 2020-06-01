<%@ page contentType="text/html; charset=UTF-8" import="java.sql.*, javax.naming.*, myBean.DB.*"%>

<%
request.setCharacterEncoding("utf-8");
String idx = request.getParameter("idx");  //obtain the primary key

try{
UserInfoDB db = new UserInfoDB();
UserInfo info = db.getInfo(Integer.parseInt(idx));  //acquire the data from the info table and use bean
%> 

<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>Contact information</title>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet"> <!--  icons -->
<link href="home.css" type="text/css" rel="stylesheet"> <!-- css file -->

</head>
<body>
	<header>
		<div class="icon-bar"> <!--  main menus -->
			<a href="user_list.jsp"><i class="material-icons">person</i></a> 
			<a href="group_list.jsp"><i class="material-icons">people</i></a> 
			<a href="trash.jsp"><i class="material-icons">delete</i></a>
		</div>
	</header>
	<br>
	<section>
   <div class="wide">
      <h2>Contact information</h2>  
      <br><br>
      <% if (info.getFile().equals("")) {%>  <!--  display the photo -->
    	  <img src="./upload/user-default.png" width="150" height="170">
      <% } else {%>
      <img src="<%="./upload/"+info.getFile()%>" width="150" height="170">
      <%} %>
      
      <table> <!-- display all the information about the contact which are readonly fields-->
      <tr>
         <td>Group </td>
         <td><input type="text" name="grp" readOnly value="<%=info.getGrp()%>"></td>
      </tr>
      <tr>
         <td>First name </td>
         <td><input type="text" name="fname" readOnly value="<%=info.getFname()%>"></td>
      </tr>
      <tr>
         <td>Last name </td>
         <td><input type="text" name="lname" readOnly value="<%=info.getLname()%>"></td>
      </tr>
      <tr>
         <td>Phone number</td>
         <td><input type="tel" name="phone" readOnly value="<%=info.getPhone()%>"></td>
      </tr>
      <tr>
         <td>Email address</td>
         <td><input type="email" name="email" readOnly value="<%=info.getEmail()%>"></td>
      </tr>
      <tr>
         <td>Position</td>
         <td><input type="text" name="pos" readOnly value="<%=info.getPos()%>"></td>
      </tr>
      <tr>
         <td>Department</td>
         <td><input type="text" name="dept" readOnly value="<%=info.getDept()%>"></td>
      </tr>
      <tr>
         <td>Title</td>
         <td><input type="text" name="title" readOnly value="<%=info.getTitle()%>"></td>
      </tr>
      <tr> 
         <td>Birthday </td>
         <td><input type="date" name="bday" readOnly value="<%=info.getBday()%>"></td>
      <tr>
         <td>Address</td>
         <td><input type="text" name="addr" readOnly value="<%=info.getAddr()%>"></td>
      </tr>
      <tr>
         <td>Homepage</td>
         <td><input type="url" name="homepg" readOnly value="<%=info.getHomepg()%>"></td>
      </tr>
      <tr>
         <td>SNS ID</td>
         <td><input type="text" name="sns" readOnly value="<%=info.getSns()%>"></td>
      </tr>
      <tr>
         <td>Memo</td>
         <td><input type="text" name="memo" readOnly value="<%=info.getMemo()%>" maxlength="50" size="50"></td>
      </tr>
      </table>
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