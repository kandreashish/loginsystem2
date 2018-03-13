<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
     <%@ page import="g.*" %>
    <%@ page import="java.sql.DriverManager"%>
    <%@page import="java.sql.PreparedStatement"%>
    <%@page import="java.sql.ResultSet"%>
    <%@page import="java.sql.SQLException" %>
    <%String url="jdbc:mysql://localhost:3306/db";%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
.lefty li a
{
color:black;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
response.setHeader("Cache-Control","no-cache");
response.setHeader("Cache-Control","no-store");
response.setHeader("Pragma","no-cache");
response.setDateHeader ("Expires", 0);
if(session.getAttribute("uname")==null)
{
	response.sendRedirect("index.jsp?pleaselogin=first");
}
%>
<%

		 String s="images/smiley1.png";
         String s2="your";
		try
		{
	     String sql="select photos from login where uname=?";
		
		Connection con=GetCon.getCon();
		PreparedStatement ps=con.prepareStatement(sql);
		ps.setString(1,(String)session.getAttribute("uname"));
		ResultSet rs= ps.executeQuery();
		if(rs.next())
		 if(rs.getString(1).equals(""))
			 s="images/smiley1.png";
		 else
             s="images/"+rs.getString(1);
		     s2=rs.getString(1);
		}
		catch(Exception e)
		{
			System.out.println(e+"hello picjs");
		}
        %>
        <ul id="hero1">
        <li><image src=<%=s%> alt="profilepic" title="<%=(String)session.getAttribute("uname")%>'s image"
			class="profilepic"><ul id="hero" class="lefty">
				<li><a>change picture</a></li>
			</ul></li>
			</ul>
</body>
</html>