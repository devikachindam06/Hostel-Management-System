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
String sid=request.getParameter("sid");
int roomno=Integer.parseInt(request.getParameter("roomno"));
try{
	            Class.forName("com.mysql.cj.jdbc.Driver");
	            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/admindetails","root","tiger");
	            Statement st=con.createStatement();
	           

	            ResultSet rs = st.executeQuery("select * from available where roomno='"+roomno+"' and available>0 ");
	            if(rs.next())
	            {
	            	PreparedStatement ps=con.prepareStatement("update student set roomno= (?) where studentid =?");
	            	ps.setInt(1,roomno);
	            	ps.setString(2,sid);
	            }
	            else
	            	out.println("Not Available");
}
catch(Exception e)
{
	out.println(e);
}
	            %>
</body>
</html>