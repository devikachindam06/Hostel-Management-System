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
String wid=(request.getParameter("wid"));
String password=request.getParameter("password");
String wname=request.getParameter("wname");
String wmobile=(request.getParameter("wmobile"));
String hmobile=(request.getParameter("hmobile"));
String doj=(request.getParameter("doj"));
String locality=request.getParameter("locality");
String city=request.getParameter("city");
String state=request.getParameter("state");
String country=request.getParameter("country");
try{
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/admindetails","root","tiger");
Statement st=con.createStatement();
int i=st.executeUpdate("insert into warden values('"+wid+"','"+password+"','"+wname+"','"+wmobile+"','"+hmobile+"','"+doj+"','"+locality+"','"+city+"','"+state+"','"+country+"')");
Statement st1=con.createStatement();
st1.executeUpdate("insert into wardenup values('"+wid+"','"+password+"')");
if(i>0)
{
	out.println("inserted succesfully");
	out.println("<a href='admin.html'>goto admin page</a>");
}
else
{
	out.println("insertion failed");
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