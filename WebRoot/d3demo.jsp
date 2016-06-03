<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'd3demo.jsp' starting page</title>
    
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
   <svg>
   </svg>
   
  </body>
     <script src="http://d3js.org/d3.v3.min.js" charset="utf-8"></script> 
<script type="text/javascript" src=" http://cpettitt.github.io/project/dagre-d3/v0.3.0/dagre-d3.min.js"></script>
<script type="text/javascript">
 var width=900;
 var height=900;
 var svg=d3.select("body").append("svg").attr("width",width).attr("height",height);
 /* var rectHeight=25;
 var dataset=[250,210,170,130,90];
 svg.selectAll("rect").data(dataset).enter().append("rect").attr("x",20).attr("y",function(d,i){
   return i*rectHeight;
 }).attr("width",function(d){return d;}).attr("height",rectHeight-2).attr("fill","steelblue");
 */
 //-----柱形图开始-------
	 var dataset=[2.5,2.1,1.7,1.3,0.9];
	 var linear=d3.scale.linear().domain([0,d3.max(dataset)]).range([0,250]);
	 var rectHeight=25;
	 svg.selectAll("rect").data(dataset).enter()
	    .append("rect").attr("x",20).attr("y",function(d,i){return i*rectHeight})
	     .attr("width",function(d){return linear(d);})
	     .attr("height",rectHeight-2).attr("fill","steelblue");
 //-----柱形图结束-----
     var axis=d3.svg.axis().scale(linear).orient("bottom").ticks(7);
     svg.append("g").attr("class","axis").attr("transform","translate(20,130)").call(axis);
 //-------圆形图以及拖动 
  var drag=d3.behavior.drag().on("drag",dragmove);
  function dragmove(d){
  d3.select(this).attr("cx",d.cx=d3.event.x).attr("cy",d.cy=d3.event.y);
    
  }
   var circles=[{cx:150,cy:200,r:30},{cx:250,cy:200,r:30},];
   svg.selectAll("circle").data(circles).enter().append("circle")
      .attr("cx",function(d){return d.cx;})
      .attr("cy",function(d){return d.cy;})
      .attr("r",function(d){return d.r;})
      .attr("fill","black")
      .call(drag);
 </script>
 <style>
.axis path,
.axis line{
    fill: steelblue;
    stroke: black;
    shape-rendering: crispEdges;
}
 
.axis text {
    font-family: sans-serif;
    font-size: 11px;
}
</style>
</html>
