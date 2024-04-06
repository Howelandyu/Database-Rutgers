<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Bar Page</title>
	</head>
	<h1>Beer Page</h1>
	<h2>Problem 1</h2>
	<br>
		<form method="get" action="beer_prob1.jsp">
			<table>
				<tr>    
					<td>Beer Name</td><td><input type="text" name="beer"></td>
				</tr>
			</table>
			<input type="submit" value="see the 5 top bars where this beer sells the most">
		</form>
	<br>
	
	</head>
	<h2>Problem 2</h2>
	<br>
		<form method="get" action="beer_prob2.jsp">
			<table>
				<tr>    
					<td>Beer Name</td><td><input type="text" name="beer"></td>
				</tr>
			</table>
			<input type="submit" value="see all the drinkers who are the biggest consumers of this beer">
		</form>
	<br>
	
	</head>
	<h2>Problem 3a</h2>
	<br>
		<form method="get" action="beer_prob3a.jsp">
			<table>
				<tr>    
					<td>Beer Name</td><td><input type="text" name="beer"></td>
				</tr>
			</table>
			<input type="submit" value=" distribution of time beer sells the most">
		</form>
	<br>
		
	</head>
	<h2>Problem 3b</h2>
	<br>
		<form method="get" action="beer_prob3b.jsp">
			<table>
				<tr>    
					<td>Beer Name</td><td><input type="text" name="beer"></td>
				</tr>
			</table>
			<input type="submit" value=" distribution of day beer sells the most">
		</form>
	<br>
			
	</head>
	<h2>Problem 3c</h2>
	<br>
		<form method="get" action="beer_prob3c.jsp">
			<table>
				<tr>    
					<td>Beer Name</td><td><input type="text" name="beer"></td>
				</tr>
			</table>
			<input type="submit" value=" distribution of month beer sells the most">
		</form>
	<br>
</html>