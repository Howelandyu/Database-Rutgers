<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Drinker Page</title>
	</head>
	<h1>Drinker Page</h1>
	<h2>Problem 1</h2>
	<br>
		<form method="get" action="drinker_prob1.jsp">
			<table>
				<tr>    
					<td>Drinker Name</td><td><input type="text" name="drinker"></td>
				</tr>
			</table>
			<input type="submit" value="See all his/her transactions ordered by time and grouped by bars.">
		</form>
	<br>
	
	</head>
	<h2>Problem 2</h2>
	<br>
		<form method="get" action="drinker_prob2.jsp">
			<table>
				<tr>    
					<td>Drinker Name</td><td><input type="text" name="drinker"></td>
				</tr>
			</table>
			<input  type="submit"  value="see a graph with the beers s/he orders the most">
		</form>
	<br>
	
	</head>
	<h2>Problem 3.a</h2>
	<br>
		<form method="get" action="drinker_prob3a.jsp">
			<table>
				<tr>    
					<td>Drinker Name</td><td><input type="text" name="drinker"></td>
				</tr>
			</table>
			<input  type="submit"  value="see graphs with his/her spending in different bars, per days of the week">
		</form>
	<br>
	
	</head>
	<h2>Problem 3.b</h2>
	<br>
		<form method="get" action="drinker_prob3b.jsp">
			<table>
				<tr>    
					<td>Drinker Name</td><td><input type="text" name="drinker"></td>
				</tr>
			</table>
			<input  type="submit"  value="see graphs with his/her spending in different bars, per month">
		</form>
	<br>
</html>

