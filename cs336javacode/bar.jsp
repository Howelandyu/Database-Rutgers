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
	<h1>Bar Page</h1>
	<h2>Problem 1</h2>
	<br>
		<form method="get" action="bar_prob1.jsp">
			<table>
				<tr>    
					<td>Bar Name</td><td><input type="text" name="bar"></td>
				</tr>
			</table>
			<input type="submit" value="see the top 10 drinkers who are the largest spenders">
		</form>
	<br>
	<h2>Problem 2</h2>
	<br>
		<form method="get" action="bar_prob2.jsp">
			<table>
				<tr>    
					<td>Bar Name</td><td><input type="text" name="bar"></td>
				</tr>
			</table>
			<input type="submit" value="see the top 10 beers which are the most popular">
		</form>
	<br>
	<h2>Problem 3</h2>
	<br>
		<form method="get" action="bar_prob3.jsp">
			<table>
				<tr>    
					<td>Bar Name</td><td><input type="text" name="bar"></td>
				</tr>
			</table>
			<input type="submit" value="see the top 5 manufacturers who sell the most beers.">
		</form>
	<br>
	
	<h2>Problem 4a</h2>
	<br>
		<form method="get" action="bar_prob4a.jsp">
			<table>
				<tr>    
					<td>Bar Name</td><td><input type="text" name="bar"></td>
				</tr>
			</table>
			<input type="submit" value="busiest periods of the day.">
		</form>
	<br>
	
		<h2>Problem 4b</h2>
	<br>
		<form method="get" action="bar_prob4b.jsp">
			<table>
				<tr>    
					<td>Bar Name</td><td><input type="text" name="bar"></td>
				</tr>
			</table>
			<input type="submit" value="busiest periods of the week.">
		</form>
	<br>
</html>
