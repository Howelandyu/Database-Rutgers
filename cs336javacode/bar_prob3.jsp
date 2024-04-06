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
		String bar = request.getParameter("bar");
		System.out.println("Query Bar: " + bar);

		//Make a query
		String queryString = "select be.manf,sum(t.quantity) as sell_quantity from bills b,transactions t, beers be  where b.bill_id=t.bill_id and t.type='beer' and b.bar=\"" + bar + "\"and t.item=be.name group by be.manf order by sell_quantity desc limit 5";

		//Run the query against the database.
		ResultSet result = stmt.executeQuery(queryString);
		
		//Make an HTML table to show the results in:
		out.print("<table>");
		//make a row
		out.print("<tr>");
		//make a column
		out.print("<td>");
		//print out column header
		out.print("Manufactor");
		out.print("</td>");
		//make a column
		out.print("<td>");
		out.print("Number of sell");
		out.print("</td>");
		
		// print query results
		while (result.next()) {
			//make a row
			out.print("<tr>");
			//make a column
			out.print("<td>");
			//Print out current bar name:
			out.print(result.getString("be.manf"));
			out.print("</td>");
			out.print("<td>");
//Print out current beer name:
			out.print(result.getString("sell_quantity"));
			out.print("</td>");
			out.print("<td>");
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