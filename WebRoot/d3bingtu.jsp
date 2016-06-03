<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'd3bingtu.jsp' starting page</title>
    
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
   <script src="js/d3.min.js" charset="utf-8"></script>
    <script type="text/javascript">
    var svg = d3.select("body").append("svg")
			.attr("width", 400)
			.attr("height", 400);
      var dataset=[30,10,43,55,13];
      var pie=d3.layout.pie();
      var piedata=pie(dataset);
      var outerRadius=150;//外半径
      var innerRadius=0;//内半径
      var arc=d3.svg.arc()//弧生成器
		      .innerRadius(innerRadius)//设置内半径
		      .outerRadius(outerRadius);//设置外半径
	 var color=d3.scale.category10();
	  var arcs=svg.selectAll("g").data(piedata).enter().append("g")
	          .attr("transform","translate("+ (400/2) +","+ (400/2) +")");	      
      arcs.append("path").attr("fill",function(d,i){return color(i);})
                          .attr("d",function(d){return arc(d);}) ;
     
      arcs.append("text").attr("transform",function(d){
           return "translate("+arc.centroid(d)+")";
      }).text(function(d){
          return d.data;
      }) ;                   
    </script>
  </body>
</html>
