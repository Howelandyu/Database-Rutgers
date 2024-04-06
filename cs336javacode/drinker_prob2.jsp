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
	StringBuilder myData=new StringBuilder();
	String strData ="";
   String chartTitle="";
   String legend="";
	try {
		
		
		//this list will hold the x-axis and y-axis data as a pair
		ArrayList<Map<String,Integer>> list = new ArrayList();
   		Map<String,Integer> map = null;

   		
		//Get the database connection
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();
//Create a SQL statement
		Statement stmt = con.createStatement();

		//Get parameters from the HTML form at the drinker.jsp
		String drinker = request.getParameter("drinker");
		System.out.println("Query Drinker: " + drinker);
		//Make a query
		String queryString = "select sunquery2.drinker, sunquery2.item as item, sunquery2.sum_quantity as num from ( select sum(t.quantity) as sum_quantity from bills b, transactions t where b.bill_id=t.bill_id and t.type=\"beer\" and b.drinker=\"" + drinker + "\" group by b.drinker order by sum_quantity desc limit 1) as subquery1, (select b.drinker, t.item,sum(t.quantity) as sum_quantity from bills b, transactions t where b.bill_id=t.bill_id and t.type=\"beer\" and b.drinker=\"" + drinker + "\" group by b.drinker order by sum_quantity desc) as sunquery2 where subquery1.sum_quantity=sunquery2.sum_quantity";
		
		//Run the query against the database.
		ResultSet result = stmt.executeQuery(queryString);
   		//Process the result
   		while (result.next()) { 
   			map=new HashMap<String,Integer>();
   	   		map.put(result.getString("item"),result.getInt("num"));
   			list.add(map);
   	    } 
   	    result.close();
   	    //Create a String of graph data of the following form: ["Caravan", 3],["Cabana",2],...
        for(Map<String,Integer> hashmap : list){
        		Iterator it = hashmap.entrySet().iterator();
            	while (it.hasNext()) { 
           		Map.Entry pair = (Map.Entry)it.next();
           		String key = pair.getKey().toString().replaceAll("'", "");
           		//int keyInt = Integer.valueOf(key) + 1;
           		//key = key + "-" + Integer.toString(keyInt);
           		myData.append("['"+ key +"',"+ pair.getValue() +"],");
           	}
        }
        strData = myData.substring(0, myData.length()-1); //remove the last comma
        //Create the chart title according to what the user selected
       
		chartTitle = "Number of beers s/he orders the most";
        legend="item";
	}catch(SQLException e){
		out.println(e);
}
        
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Graphs</title>
		<script src="https://code.highcharts.com/highcharts.js"></script>
		<script> 
		
			var data = [<%=strData%>]; //contains the data of the graph in the form: [ ["Caravan", 3],["Cabana",2],...]
			var title = '<%=chartTitle%>'; 
			var legend = '<%=legend%>'
			//this is an example of other kind of data
			//var data = [["01/22/2016",108],["01/24/2016",45],["01/25/2016",261],["01/26/2016",224],["01/27/2016",307],["01/28/2016",64]];
			var cat = [];
			data.forEach(function(item) {
			  cat.push(item[0]);
			});
			document.addEventListener('DOMContentLoaded', function () {
			var myChart = Highcharts.chart('graphContainer', {
			    chart: {
			        defaultSeriesType: 'column',
			        events: {
			            //load: requestData
			        }
			    },
			    title: {
			        text: title
			    },
			    xAxis: {
			        text: 'xAxis',
			        categories: cat
			    },
			    yAxis: {
			        text: 'yAxis'
			    },
			    series: [{
			        name: legend,
			        data: data
			    }]
			});
			});
		
		</script>
	</head>
	<body>

	<div id="graphContainer" style="width: 500px; height: 400px; margin: 0 auto"></div>



</body>
</html>
