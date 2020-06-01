<%@ page contentType="text/html; charset=UTF-8" import="java.sql.*, myBean.DB.*, javax.naming.*"%>
<%
	String sgrp = request.getParameter("grp");  //obtain the group parameter
	String ssearch = request.getParameter("search"); //obtain the search parameter
	
	if (sgrp == null){  //if the group field is empty, my caontact is the default
		sgrp = "My contact";
	}
	if (ssearch != null){  //if search field is empty
		response.sendRedirect("group_list.jsp?grp="+sgrp+"&search="+ssearch);
	}
	else {  //other case
		response.sendRedirect("group_list.jsp?grp="+sgrp);
	}
%>