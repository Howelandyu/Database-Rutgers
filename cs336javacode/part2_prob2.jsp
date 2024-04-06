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

		//Make a query
		String queryString = "SELECT if( (select count(*) from drinkers left join frequents on drinkers.name = frequents.drinker left join bars b1 on frequents.bar = b1.name left join ( select  drinkers.name as drinker, b2.name, b2.state from drinkers left join frequents on drinkers.name = frequents.drinker left join bars b2 on frequents.bar = b2.name ) as subquery  on subquery.drinker = drinkers.name and subquery.state != b1.state)=0 ,'TRUE','FALSE' ) as result";

		//Run the query against the database.
		ResultSet result = stmt.executeQuery(queryString);
		//out.print("result");
		while (result.next()) {
			out.println(result.getString("result"));
		}
		
		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		con.close();

		out.print("Query succeeded!");
		
	} catch (Exception ex) {
		out.print(ex);
		out.println("Query failed :()");
	}
%>
</body>
</html>

