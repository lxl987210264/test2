<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'd3zhexian.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style>
  .axis path,
  .axis line{
   fill:none;
   stroke:black;
   shape-rendering:crispEdges;
  }
  .axis text{
    font-family:sans-serif;
    font-size:11px;
  }
  .MyPath{
     fill: none;
     stroke:black;
     stroke-width:3px;
  }
  </style>
  </head>
  
  <body>
    <script src="http://d3js.org/d3.v3.min.js" charset="utf-8"></script> 
<script type="text/javascript" src=" http://cpettitt.github.io/project/dagre-d3/v0.3.0/dagre-d3.min.js"></script>
  <script type="text/javascript">
  var dataset=[10,20,30,40,33,24,12,8];
  var width=400;
  var height=400;
    //添加画布
    var svg=d3.select("body").append("svg").attr("width",width).attr("height",height);
    //画布周边的空白
    var padding={left:100,right:30,top:20,bottom:20};
    //定义比例尺

       var dataset1=[{x:10,y:100},{x:20,y:200},{x:50,y:400},{x:20,y:400},{x:0,y:200}];
        var dataset2=[{x:10,y:100},{x:20,y:200},{x:30,y:400},{x:20,y:200},{x:10,y:100}];
     var xmax=d3.max(dataset1,function(d){return d.x});
     var ymax=d3.max(dataset1,function(d){return d.y});
     var xScale=d3.scale.linear().domain([0,xmax]).range([0,300]);
      var yScale = d3.scale.ordinal()
        .domain(["部门","部门1","部门2","部门3","部门4"])
        .range([50,100,150,200,250
        ]); 
        alert(xScale(50));
    //var yScale=d3.scale.linear().domain([0,ymax]).range([250,0]);
   var xAxis=d3.svg.axis().scale(xScale).orient("bottom");
    var yAxis=d3.svg.axis().scale(yScale).orient("left");
    
    svg.append("g").attr("class","axis").attr("transform","translate(100,350)")
    .call(xAxis);
    svg.append("g").attr("class","axis").attr("transform","translate(100,100)")
    .call(yAxis);
   
    /* var line=d3.svg.line()
             .x(function(d){ return xScale(d.x);})
             .y(function(d){return yScale(d.y);})
             .interpolate("line");
     svg.append("path").attr("class","MyPath").attr("d",line(dataset1)).style("stroke","#09F");        
     svg.append("path").attr("class","MyPath").attr("d",line(dataset2)).style("stroke","#FFECEC");  */       
  </script> 
  
  </body>
 
  
</html>
