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
String password=request.getParameter("password");
String sname=request.getParameter("studentname");
int stumobile=Integer.parseInt(request.getParameter("stumobile"));
String gender=request.getParameter("gender");

String locality=request.getParameter("locality");
String city=request.getParameter("city");
String state=request.getParameter("state");
String country=request.getParameter("country");
int roomno=Integer.parseInt(request.getParameter("roomno"));
String fathname=request.getParameter("fathername");
int fathmobile=Integer.parseInt(request.getParameter("fathmobile"));
String mothname=request.getParameter("mothername");
int mothmobile=Integer.parseInt(request.getParameter("mothmobile"));
try{
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/admindetails","root","tiger");
Statement st=con.createStatement();
int i=st.executeUpdate("insert into student values('"+sid+"','"+password+"','"+sname+"','"+stumobile+"','"+gender+"','"+locality+"','"+city+"','"+state+"','"+country+"','"+fathname+"','"+fathmobile+"','"+mothname+"','"+mothmobile+"'+'"+roomno+"')");
Statement st1=con.createStatement();
st1.executeUpdate("insert into student values('"+sid+"','"+password+"')");
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