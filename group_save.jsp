<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.sql.*, myBean.DB.*, javax.naming.*"%>

<%
request.setCharacterEncoding("utf-8");
String grp = request.getParameter("grp");  //obtain the group parameter
String sgrp = request.getParameter("sgrp"); //obtain the newly entered group parameter

if (sgrp.isEmpty()){  /* if there is no new group name */
	sgrp = grp;  //
}

try{
UserInfoDB db = new UserInfoDB();  
db.updateGrp(grp, sgrp);  //update the tables corresponding to the group
db.close();

}catch(SQLException e){
out.print(e);
return;
}catch(NamingException e){
out.print(e);
return;
}
response.sendRedirect("group_list.jsp");  //send back to group list page
%>