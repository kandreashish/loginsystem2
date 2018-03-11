<%@page import="java.io.FileNotFoundException"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%> 
    <%@page import="g.*" %>
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
	if(item.getName().substring((item.getName().length()-4),(item.getName().length())).equals(".jpg")||item.getName().substring((item.getName().length()-4),(item.getName().length())).equals(".png"))
	{
	item.write(new File("/Users/ashish/loginsystem1/WebContent/images/"+item.getName()));
	response.sendRedirect("message.jsp?upload=success");
	}
	else
	{
		response.sendRedirect("message.jsp?choose a imagefile");	
	}
}
System.out.println("uploaded");

}
catch(FileNotFoundException e)
{
	response.sendRedirect("message.jsp?choose a file");
}
catch (Exception e) {
	System.out.println(e);
}
%>
</body>
</html>