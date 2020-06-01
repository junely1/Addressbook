<%@ page contentType="text/html; charset=UTF-8" import="java.sql.*, java.io.*, myBean.DB.*, 
javax.naming.*, com.oreilly.servlet.*, com.oreilly.servlet.multipart.*"%>
<%
request.setCharacterEncoding("utf-8");
ServletContext context = getServletContext();
/* String realFolder = "/Users/Khaliun/Documents/workspace/Khaliun_12153937_addressbook/WebContent/upload"; */
String realFolder = context.getRealPath("upload");  //obtain the path
int maxsize = 5*1024*1024;  //max size of the file
MultipartRequest multi = new MultipartRequest(request, realFolder, maxsize, "utf-8", new DefaultFileRenamePolicy());

String idx = multi.getParameter("idx");  //obtain the parameters from user_edit.jsp
String grp = multi.getParameter("grp");
String ngrp = multi.getParameter("ngrp");
String fname = multi.getParameter("fname");
String lname = multi.getParameter("lname");
String phone = multi.getParameter("phone");
String email = multi.getParameter("email");
String pos = multi.getParameter("pos");
String dept = multi.getParameter("dept");
String title = multi.getParameter("title");
String bday = multi.getParameter("bday");
String addr = multi.getParameter("addr");
String homepg = multi.getParameter("homepg");
String sns = multi.getParameter("sns");
String photo = multi.getParameter("photo");
String file = multi.getFilesystemName("file");
String memo = multi.getParameter("memo");

if (grp.isEmpty() && grp.isEmpty()){  //if group is not selected and not entered
	grp = "My contact";
}

else if (!ngrp.isEmpty()){ //if new group is entered
	grp = ngrp;
}

if (file == null){ //if photo file is empty
	file = photo;
}

UserInfo info = new UserInfo();  //use beans to set the parameters
info.setIdx(Integer.parseInt(idx));
info.setGrp(grp);
info.setFname(fname);
info.setLname(lname);
info.setPhone(phone);
info.setEmail(email);
info.setPos(pos);
info.setDept(dept);
info.setTitle(title);
info.setBday(bday);
info.setAddr(addr);
info.setHomepg(homepg);
info.setSns(sns);
info.setFile(file);
info.setMemo(memo);

try{
	UserInfoDB db = new UserInfoDB();
	db.updateInfo(info);  //update the info database
	db.close();
}catch(NamingException e){
	out.print(e);
	return;
}catch(SQLException e){
	out.print(e);
	return;
}
response.sendRedirect("user_list.jsp"); //send back to the page
%>