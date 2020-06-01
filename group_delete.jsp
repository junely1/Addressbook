<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.sql.*, myBean.DB.*, javax.naming.*"%>

<%
request.setCharacterEncoding("utf-8");
String grp = request.getParameter("grp"); //obtain the group variable
try{
UserInfoDB db = new UserInfoDB(); //instance of UserInfoDB
db.deleteGrp(grp); //delete the group from the db
db.close();  
}
catch(SQLException e){  //exception handlers
out.print(e);
return;
}
catch(NamingException e){
out.print(e);
return;
}
response.sendRedirect("group_list.jsp");  //send back to the group list page
%>