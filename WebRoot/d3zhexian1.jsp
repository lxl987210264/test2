<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  	<style>

	.axis path,
	.axis line{
		fill: none;
		stroke: black;
		shape-rendering: crispEdges;
	}
	 
	.axis text {
		font-family: sans-serif;
		font-size: 11px;
	}

	.MyPath {
		fill: none;
		stroke: black;
		stroke-width: 3px;
	}

	</style>
  
    <base href="<%=basePath%>">
    
    <title>My JSP '?.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
   <script src="http://d3js.org/d3.v3.min.js" charset="utf-8"></script>
<script>

var body = d3.select("body");

var width = 400;
var height = 400;

var svg = body.append("svg")
			.attr("width", 400)
			.attr("height", 400);

// 1. 读取文件

d3.json("example.json", function(error, jsondata){

	if(error)
		console.log(error);

	console.log(jsondata);

	var xmax = d3.max(jsondata.data, function(d){
		return d.x;
	});

	var ymax = d3.max(jsondata.data, function(d){
		return d.y;
	});

	var xScale = d3.scale.linear()
					.domain([0, xmax])
					.range([0, 300]);

	var yScale = d3.scale.linear()
					.domain([0, ymax])
					.range([250, 0]);

	var xAxis = d3.svg.axis()
				.scale(xScale)
				.orient("bottom");

	var gxAxis = svg.append("g")
					.attr("class","axis")
					.attr("transform","translate(30,350)")
					.call(xAxis);

	var yAxis = d3.svg.axis()
					.scale(yScale)
					.orient("left");

	var gyAxis = svg.append("g")
					.attr("class","axis")
					.attr("transform","translate(30,100)")
					.call(yAxis);

	// 2. 线段生成器
	var line = d3.svg.line()
			.x( function(d){ return xScale(d.x); } )
			.y( function(d){ return yScale(d.y); } )
			.interpolate("cardinal");

	// 3. 折线图
	svg.append("path")
		.attr("class","MyPath")
		.attr("d", line(jsondata.data) )
		.attr("transform","translate(30,100)");

});





</script>

  </body>
</html>
