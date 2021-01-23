<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<script>
window.onload = function MyFunc() {

	var chart = new CanvasJS.Chart("chartContainer", {
	  animationEnabled: true,
	  theme: "light2", // "light1", "light2", "dark1", "dark2"
	  title:{
	    text: "Top Perfomer"
	  },
	  axisY: {
	    title: "Score"
	  },
	  data: [{        
	    type: "column",  
	    showInLegend: true, 
	    legendMarkerColor: "grey",
	    legendText: "Score",
	    dataPoints: [      
	      { y: 80, label: "Associate Name Pyth Score" },
	     { y: 50, label: "Associate Name Power Score" },
	     { y: 40, label: "Associate Name bash Score" },
	    
	    ]
	  }]
	});
	chart.render();

	}
</script>
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

<div id="chartContainer"  style=" opacity: 0.6;position: relative;left:500px;top:100px; height: 400px; width: 35%;"></div>
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>




</body>
</html>
