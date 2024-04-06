<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Part3 Page</title>
	</head>
	<h1>Part3 Page</h1>
	<h2>Please type attribute into table:</h2>
	<br>
		<form method="get" action="modificationpage.jsp">
			<td>Table</td>
			<table>
					<td>content</td><td><input type="text" name="content"></td>
				
				</table>
			<input type="submit" value="Add the attribute to table!">
		</form>
	<br>
	
</html>