<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>

<form method="POST">
<%
int table_no = Integer.parseInt(request.getParameter("table_no"));
String status = request.getParameter("status");

if(status.equals("dinein")) {
	response.sendRedirect("W_menulist_dinein.jsp?table_no=" + table_no);
} else if(status.equals("takeaway")) {
	response.sendRedirect("W_menulist_takeaway.jsp?table_no=" + table_no);
}

%>
</form>
</body>
</html>