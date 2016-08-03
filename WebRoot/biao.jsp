<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'biao.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="css/d3.css"/>
	<script type="text/javascript" src="js/d3.min.js"></script>
	<script type="text/javascript" src="js/jquery-1.8.3.js"></script>
  </head>
  
  <body>
   <div id="demo1"></div>
  </body>
  <script type="text/javascript">
	//定义画布
	var svg=d3.select("#demo1")
	.append("svg")
	.attr("width",1000)
	.attr("height",1000);
	svg.append("g").attr("class","hbrect");
	svg.select(".hbrect").append("circle")
			.attr("cx",600)
			.attr("cy",300)
			.attr("r",100)
			.attr("stroke","blue")
			.attr("fill","white");
	svg.select(".hbrect").append("circle")
	.attr("cx",600)
	.attr("cy",300)
	.attr("r",2)
	.attr("stroke","black")
	.attr("fill","white");
var defs = svg.append("defs");
	var arrowMarker = defs.append("marker")
						.attr("id","arrow")
						.attr("markerUnits","strokeWidth")
					    .attr("markerWidth","9")
                        .attr("markerHeight","9")
                        .attr("viewBox","0 0 12 12") 
                        .attr("refX","6")
                        .attr("refY","6")
                        .attr("orient","auto");

	var arrow_path = "M2,2 L10,6 L2,10 L6,6 L2,2";
							
	arrowMarker.append("path")
				.attr("d",arrow_path)
				.attr("fill","#000");			
	 var line= svg.select(".hbrect").append("line")
		.attr("x1",600)
		.attr("y1",300)
		.attr("x2",600)
		.attr("y2",210)
		.attr("stroke","#666")
		.attr("stroke-width",3)
		.attr("marker-end","url(#arrow)");
		setInterval(function(){
		if(line.attr("x2")/1>=700){
		line.attr("x2",line.attr("x2")/1-3);
		}else if(line.attr("x2")/1<=500){
		line.attr("x2",line.attr("x2")/1+3);
		}else{
		line.attr("x2",line.attr("x2")/1+3);
		}
		if(line.attr("y2")/1>=390){
		  line.attr("y2",line.attr("y2")/1-3);
		}else if(line.attr("y2")/1<=210){
		   line.attr("y2",line.attr("y2")/1+3);
		 }else{
		 line.attr("y2",line.attr("y2")/1+3);
		 }
		},1000)
	 </script>
</html>
