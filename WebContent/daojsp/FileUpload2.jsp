 <%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.io.FileNotFoundException"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%> 
    <%@page import="g.*" %>
     <%@ page import="java.sql.*" %>
    <%@ page import="java.sql.DriverManager"%>
    <%@page import="java.sql.PreparedStatement"%>
    <%@page import="java.sql.ResultSet"%>
    <%@page import="java.sql.SQLException" %>
    <%@page import="org.apache.commons.fileupload.FileItem" %>
    <%@page import="org.apache.commons.fileupload.FileItemFactory" %>
    <%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory" %>
    <%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload" %>
    <%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload" %>
    <%@page import="java.io.File" %>
    <%@page import="java.util.List" %>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
FileItemFactory factory = new DiskFileItemFactory();
ServletFileUpload sf=new ServletFileUpload(factory);
try
{
List<FileItem> list= sf.parseRequest(request);
for(FileItem item:list)
{
	System.out.println();
	System.out.println(item.getName().substring((item.getName().length()-4)));
	if(item.getName().substring((item.getName().length()-4),(item.getName().length())).equalsIgnoreCase(".jpg")||item.getName().substring((item.getName().length()-4),(item.getName().length())).equalsIgnoreCase(".png"))
	{
	item.write(new File("/Users/ashish/loginsystem1/WebContent/images/"+item.getName()));
	Connection con1=GetCon.getCon();
	String usernaem=(String)session.getAttribute("uname");
	String sql1="select id from login where uname=?;";
	PreparedStatement ps = con1.prepareStatement(sql1);
	ps.setString(1, usernaem);
	System.out.println(sql1);
	
	ResultSet rs=ps.executeQuery();
	rs.next();
	int k=rs.getInt(1);
	String sql="UPDATE login SET photos=?,active = 1 WHERE id=?";
	PreparedStatement ps1 = con1.prepareStatement(sql);
	String name=item.getName();
	ps1.setString(1, name);
	ps1.setInt(2, k);
	System.out.println(sql+"hello");
	try
	{
	ps1.executeUpdate();
	}
	catch(Exception e)
	{
		System.out.println(e);
	}
	response.sendRedirect("../message.jsp?upload=success");
	}
	else
	{
		response.sendRedirect("../profilepic.jsp?choose=imagefile");	
	}
}
System.out.println("uploaded");

}
catch(FileNotFoundException e)
{
	response.sendRedirect("../profilepic.jsp?choose=a file");
}
catch (Exception e) {
	System.out.println(e);
	response.sendRedirect("../profilepic.jsp?choose=a file");
}
%>
</body>
</html>