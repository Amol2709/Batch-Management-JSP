<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<style>
body {
  margin: 0;
}

ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
  width: 10%;
  background-color: #FEF9E7 ;
  position: fixed;
  height: 100%;
  overflow: auto;
}

li a {
  display: block;
  color: #000;
  padding: 8px 16px;
  text-decoration: none;
}

li a.active {
   background-color: #000000;
  color: white;
}

li a:hover:not(.active) {
  background-color: #555;
  color: white;
}
</style>
</head>
<body style="width: 100%;height:100%;font-family: 'Open Sans', sans-serif; background-image: url('front.jpg');background-repeat: no-repeat;background-attachment: fixed;background-size: cover;">
  <% List<String> b_name = (List<String>)request.getAttribute("b_name"); %>
  <% List<Integer> b_tot = (List<Integer>)request.getAttribute("b_tot"); %>
  <% int count = (int)request.getAttribute("counter"); %>
  
  
  <ul style=" opacity: 0.6;">
  <li><a onclick="" class="active" href="#home" >Home</a></li>
  <li><a onclick="MyFunc(['parth','amol','manoj']);" href="#">Batch Strength</a></li>
  <li><a onclick="MyFunc2();"href="#">Batch Topper Score</a></li>
  <li><a href="current_batch_summary.jsp">Current Status</a></li>
  <li><a href="#about">LogOut</a></li>
</ul>
<div id="chartContainer"  style=" opacity: 0.6;position: relative;left:500px;top:100px; height: 500px; width: 60%;"></div>
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>

<script>
function MyFunc() 
{
	var name = <%=b_name%>;
	var nums = <%=b_tot%>;
	var count = <%=count%>;
	var datapoints=[];
	for(int i = 0; i++; i<count)
    	
	{
		datapoints.push({y: occur[i], label: name[i]});
	}
	console.log(name);
	console.log(occur);
	console.log(count);
	var chart = new CanvasJS.Chart("chartContainer", 
	{
	  animationEnabled: true,
	  theme: "light2",
	  title:{
	    text: "Batch Strength"
	  },
	  axisY: {
	    title: "Batch Name"
	  },
	  data: [{        
	    type: "column",  
	    showInLegend: true, 
	    legendMarkerColor: "grey",
	    legendText: "Batch Strength",
	  }]
	});
	chart.render();

	}
	


function MyFunc2() {

	var chart = new CanvasJS.Chart("chartContainer", {
		animationEnabled: true,
		title:{
			text: "Batch Topper Score"
		},
		axisY: {
			title: "Score",
			includeZero: true
		},
		legend: {
			cursor:"pointer",
			itemclick : toggleDataSeries
		},
		toolTip: {
			shared: true,
			content: toolTipFormatter
		},
		data: [{
			type: "bar",
			showInLegend: true,
			name: "Python",
			color: "#27AE60" ,
			dataPoints: [
				{ y: 60, label: "Batch 1" },
				{ y: 90, label: "Batch 2" },
				{ y: 80, label: "Batch 3" },
				{ y: 70, label: "Batch 4" },
			]
		},
		{
			type: "bar",
			showInLegend: true,
			name: "PowerShell",
			color: "#050A6B",
			dataPoints: [
				{ y: 80, label: "Batch 1" },
				{ y: 90, label: "Batch 2" },
				{ y: 60, label: "Batch 3" },
				{ y: 95, label: "Batch 4" },
			]
		},
		{
			type: "bar",
			showInLegend: true,
			name: "Bash",
			color: "#830C8D",
			dataPoints: [
				{ y: 70, label: "Batch 1" },
				{ y: 80, label: "Batch 2" },
				{ y: 60, label: "Batch 3" },
				{ y: 50, label: "Batch 4" },
			]
		}]
	});
	chart.render();

	function toolTipFormatter(e) {
		var str = "";
		var total = 0 ;
		var str3;
		var str2 ;
		for (var i = 0; i < e.entries.length; i++){
			var str1 = "<span style= \"color:"+e.entries[i].dataSeries.color + "\">" + e.entries[i].dataSeries.name + "</span>: <strong>"+  e.entries[i].dataPoint.y + "</strong> <br/>" ;
			total = e.entries[i].dataPoint.y + total;
			str = str.concat(str1);
		}
		total = total/3;
		str2 = "<strong>" + e.entries[0].dataPoint.label + "</strong> <br/>";
		str3 = "<span style = \"color:Tomato\">Total Percentage: </span><strong>" + total + "</strong><br/>";
		return (str2.concat(str)).concat(str3);
	}

	function toggleDataSeries(e) {
		if (typeof (e.dataSeries.visible) === "undefined" || e.dataSeries.visible) {
			e.dataSeries.visible = false;
		}
		else {
			e.dataSeries.visible = true;
		}
		chart.render();
	}

	}
</script>


</body>
</html>
