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
try{
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/admindetails","root","tiger");
PreparedStatement st=con.prepareStatement("delete from warden where wid=(?)");
st.setString(1,wid);
int i=st.executeUpdate();
if(i>0)
{
	out.println("deleted succesfully");
	out.println("<a href='admin.html'>goto admin page</a>");
}
else
{
	out.println("deletion failed");
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