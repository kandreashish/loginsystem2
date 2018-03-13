<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="g.*"%>
<%@ page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%!public void insert(String user, String pass, String date, String tel) {
		String sql = "insert into login(uname,password,date,mnumber,active)values(?,?,?,?,?)";
	
		try {
			Connection con1 = GetCon.getCon();
			PreparedStatement st = con1.prepareStatement(sql);
			st.setString(1, user);
			st.setString(2, pass);
			st.setString(3, date);
			st.setString(4, tel);
			st.setInt(5, 0);
			st.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
		} 
	}

	public boolean check(String user) {
		String url = "jdbc:mysql://localhost:3306/db";
		String username = "root";
		String password = "1234";
		String sql = "select uname from login where uname=?";
		Connection con = null;
		PreparedStatement st = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(url, username, password);
			st = con.prepareStatement(sql);
			st.setString(1, user);
			ResultSet rs = st.executeQuery();
			if (rs.next()) {
				return false;
			} else {
				return true;
			}
		} catch (Exception e) {
			System.out.println(e);
		}

		return false;
	}%>
	<%
		String x = request.getParameter("submit");
		if (x != null && x.equalsIgnoreCase("submit")) {
			String user = request.getParameter("uname");
			String pass = request.getParameter("Pass");
			String pass1 = request.getParameter("Password1");
			String date = request.getParameter("date");
			String tel = request.getParameter("tel");
			System.out.println(x + " " + user + " " + pass + " " + pass1 + " " + date + " " + tel);
			if (user != "" && user != null && pass != null && pass != "" && pass1 != null && pass1 != ""
					&& date != null && date != "" && tel != null) {
				if (check(user)) {
					if (pass.equals(pass1)) {
						insert(user, pass, date, tel);
						response.sendRedirect("../index.jsp?pleaselogin=success");
					} else {
						response.sendRedirect("../signup1.jsp?password=not same");
					}
				} else {
					response.sendRedirect("../signup1.jsp?user=exist");
				}
			} else {
				response.sendRedirect("../signup1.jsp?field should not be blank");
			}
		} else {
			response.sendRedirect("../signup1.jsp?pleaselogin=first");
		}
	%>