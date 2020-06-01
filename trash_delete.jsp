<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.sql.*, myBean.DB.*, javax.naming.*"%>
<%
request.setCharacterEncoding("utf-8");
String idx = request.getParameter("idx");  //get the primary key
try{
	UserInfoDB db = new UserInfoDB();
	db.deleteTrash(Integer.parseInt(idx));  //delete from the trash table
	db.close();
	
}catch(SQLException e){
	out.print(e);
	return;
}catch(NamingException e){
	out.print(e);
	return;
}
response.sendRedirect("trash.jsp");  //send back to the trash page
%>
