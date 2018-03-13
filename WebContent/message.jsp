<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="g.*"%>
<%@page import="java.sql.Connection"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<!doctype html>
<html>
<script type=text/javascript src="script/function.js"></script>
<title>home page</title>
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
<head>
<link rel="shortcut icon" type="image/x-icon" href="favicon.png" />
</head>
<div id="settings">
	<ul>
		<li><image src="settings.png" alt="setting" title="settings"
				class="avatar23">
			<ul id="haris" class="lefty">
				<li><a>change username</a></li>
				<li><a>change password</a></li>
				<li><a href="daojsp/Logout.jsp">logout</a></li>
			</ul></li>
	</ul>
</div>
<head>
<link rel=stylesheet type="text/css" href="style/style1.css">

</head>

<header>
	<% String uname1 = (String)session.getAttribute("uname"); %>
	<h1>
		This is
		<%=uname1%>
		page

	</h1>
</header>
<body onload="message()">
	<%
		String u31 = request.getParameter("choose");
		if (u31 != null && u31.equals("imagefile")) {
	%>
	<input type="hidden" id="demo" value="imagefile" name="hidden">
	<%
		}
		if (u31 != null && u31.equals("a file")) {
			%>
	<input type="hidden" id="demo" value="afile" name="hidden">
	<%
				}
		String u32 = request.getParameter("upload");
		if (u32 != null && u32.equals("success")) {
			%>
	<input type="hidden" id="demo" value="success" name="hidden">
	<%
				}
		
	%>
	<div id="profilepic">
		<jsp:include page="pic.jsp"></jsp:include>
	</div>
	<div class=UserDetails>
		<label for="pics">upload pics for ur friends</label>
		<form action="daojsp/FileUpload.jsp" method="post"
			enctype="multipart/form-data">
			<input type="file" name="file" id="pics"> <input
				type="submit" id="upload" value="upload">
			<%
				if (u32 != null && u32.equals("success")) {
			    out.write("<p id='erro1'>upload success</p>");
				}
				if (u31 != null && u31.equals("a file")) {
					out.write("<p id='erro1'>please choose a file</p>");
				}
				if (u31 != null && u31.equals("imagefile")) {
					out.write("<p id='erro1'>please choose image file</p>");
						}
			    %>
		</form>
		<br> <br> <br> <br>
		<p>what can i say,this is my first project given by my friend</p>
		<form action="videos.jsp">
			<input id="vid" type="submit" value="videos">
		</form>
	</div>
</body>
</html>