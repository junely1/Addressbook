<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.sql.*, myBean.DB.*, javax.naming.*"%>
<%
request.setCharacterEncoding("utf-8");
String idx = request.getParameter("idx");  //obtain the primary key

try{
	UserInfo uinfo = new UserInfo();
	UserInfoDB db = new UserInfoDB();
	uinfo = db.getInfo(Integer.parseInt(idx));   //get the parameters and use bean
	db.insertTrash(uinfo);  //add the data to be deleted to the trash table
	db.deleteInfo(Integer.parseInt(idx));  //delete the data from the info table
	db.close();
}catch(SQLException e){
	out.print(e);
	return;
}catch(NamingException e){
	out.print(e);
	return;
}
response.sendRedirect("user_list.jsp");  //send to All contact page
%>
