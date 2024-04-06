<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
	try {

		//Get the database connection
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();
//Create a SQL statement
		Statement stmt = con.createStatement();

		//Get parameters from the HTML form at the drinker.jsp
		String drinker = request.getParameter("drinker");
		System.out.println("Query Drinker: " + drinker);

		//Make a query
		String queryString = "select drinker, count(bill_id) as trannum,bar,date,time from barbeerdrinkersample.bills where drinker=\"" + drinker + "\" group by bar Order by date,time";

		//Run the query against the database.
		ResultSet result = stmt.executeQuery(queryString);
		
		//Make an HTML table to show the results in:
		out.print("<table>");
//make a row
		out.print("<tr>");
		//make a column
		out.print("<td>");
		//print out column header
		out.print("drinker");
		out.print("</td>");
		//make a column
		out.print("<td>");
		out.print("trannum");
		out.print("</td>");
		out.print("<td>");
		//print out column header
		out.print("bar");
		out.print("</td>");
		//make a column
		out.print("<td>");
		out.print("date");
		out.print("</td>");
		out.print("<td>");
		out.print("time");
		out.print("</td>");
		out.print("</tr>");
		// print query results
		while (result.next()) {
			//make a row
			out.print("<tr>");
			//make a column
			out.print("<td>");
			//Print out current bar name:
			out.print(result.getString("drinker"));
			out.print("</td>");
			out.print("<td>");
			//Print out current beer name:
			out.print(result.getString("trannum"));
			out.print("</td>");
			out.print("<td>");
			out.print(result.getString("bar"));
			out.print("</td>");
			out.print("<td>");
			//Print out current beer name:
			out.print(result.getString("date"));
			out.print("</td>");
			out.print("<td>");
			//Print out current beer name:
			out.print(result.getString("time"));
			out.print("</td>");
			out.print("</tr>");
		}
		out.print("</table>");
		
		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		con.close();

		out.print("Query succeeded!");
		
	} catch (Exception ex) {
		out.print(ex);
		out.print("Insert failed :()");
	}
%>
</body>
</html>
		