<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
String ssearch = request.getParameter("search"); //obtain the search parameter
response.sendRedirect("group_list.jsp?search="+ssearch);  //send bac kto the group list page with the search parameter
%>

