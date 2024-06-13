<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String sid=(request.getParameter("sid"));
String whattoupdate=request.getParameter("whattochange");
String updatedvalue=request.getParameter("updatedvalue");
try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/admindetails","root","tiger");
PreparedStatement ps = con.prepareStatement("update student set "+whattoupdate+"= (?) where studentid =?");
ps.setString(1,updatedvalue);
ps.setString(2,sid);
int i=ps.executeUpdate();
if(i>0)
{
	out.println("updated succesfully");
	out.println("<a href='admin.html'>goto admin page</a>");
	out.println("<a href='updatestu.html'>goto update page</a>");
}
else
{
	out.println("updation failed");
	out.println("<a href='updatestu.html'>goto update page</a>");
	out.println("<a href='admin.html'>goto admin page</a>");
}
}
catch(Exception e)
{
	out.println(e);
}
%>
</body>
</html>