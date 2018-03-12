<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="shortcut icon" type="image/x-icon" href="favicon.png" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
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
<% String uname1 = (String)session.getAttribute("uname"); %>
<link rel=stylesheet type="text/css" href="style/style2.css">
     <header id=head>
        <h1>welcome to your new page <%=uname1%></h1>
    </header>
<body>

 <div id="dp51">
  <form action="daojsp/FileUpload.jsp" method="post" enctype="multipart/form-data">
    <h2>Upload a cute pic</h2>  
    <label class="label1" for="dpchange"><img src="avatar.b6a87.png" id="choose"></label>    
    <input id="dpchange" type="file" name="profile"><br>
    <input type="submit" value="upload"/>   
  </form>
  <form action="message.jsp">
  <input type="submit" value="skip" id="skip"/>
  </form>
 </div>
</body>
</html>