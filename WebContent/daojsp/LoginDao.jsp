<%@page import="g.GetCon"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
    <%@ page import="java.sql.DriverManager"%>
    <%@page import="java.sql.PreparedStatement"%>
    <%@page import="java.sql.ResultSet"%>
    <%@page import="java.sql.SQLException" %>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%!public boolean check(String user,String pass)
{
	String sql= "select * from login where uname=? and password=?";
	try {
		//Class.forName("com.mysql.jdbc.Driver");
		Connection con1=GetCon.getCon();
		PreparedStatement st=con1.prepareStatement(sql);
		st.setString(1,user);
		st.setString(2,pass);
		ResultSet sr=st.executeQuery();
		if(sr.next())
			return true;
		else
			return false;

	} catch (Exception e) 
	{
		e.printStackTrace();
	}
	
	return false;
} %>
<% 
String x = request.getParameter("submit");
if(x!=null && x.equals("confirm"))
{ 
        String username=request.getParameter("uname");
		String password=request.getParameter("pass");
		if(username == ""|| password == "")
		{
			response.sendRedirect("../index.jsp?field=empty");
		}
		else if(check(username,password))
		{
			session.setAttribute("uname",username);
			try{
				String sql1="Select active from login where uname=?;";
				Connection con=GetCon.getCon();
				PreparedStatement ps1=con.prepareStatement(sql1);
				ps1.setString(1, username);
				ResultSet rs=ps1.executeQuery();
				rs.next();
			if(rs.getInt(1)==0)
				response.sendRedirect("../profilepic.jsp?welcomeuser");
			else
				response.sendRedirect("../message.jsp?welcomeuser");
			}
			catch(Exception e)
			{
				System.out.println(e);
			}
		}
		else
		{
			response.sendRedirect("../index.jsp?usernam=wrong&passwor=wrong");
		}
}
else
{
	response.sendRedirect("../index.jsp?pleaselogin=first");
}
%>


</body>
</html>