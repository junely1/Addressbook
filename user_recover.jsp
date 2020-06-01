<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.sql.*, myBean.DB.*, javax.naming.*"%>
<%
request.setCharacterEncoding("utf-8");
String idx = request.getParameter("idx"); //obtain the primary key

UserInfo info = new UserInfo();
try{
	UserInfo uinfo = new UserInfo();
	UserInfoDB db = new UserInfoDB();
	uinfo = db.getTrash(Integer.parseInt(idx)); //obtain the data from the trash table
	db.insertInfo(uinfo);  //insert the data to the info table
	db.deleteTrash(Integer.parseInt(idx));  //delete the data from the trash table
	db.close();
}catch(SQLException e){
	out.print(e);
	return;
}catch(NamingException e){
	out.print(e);
	return;
}
response.sendRedirect("user_list.jsp");  //send to the ALl contact page
%>