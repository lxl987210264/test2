<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE svg PUBLIC "-//W3C//DTD SVG 1.1//EN"   "http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd">  
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'd4.jsp' starting page</title>
    
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
  </body>
   <script src="http://d3js.org/d3.v3.min.js" charset="utf-8"></script> 
<script type="text/javascript" src=" http://cpettitt.github.io/project/dagre-d3/v0.3.0/dagre-d3.min.js"></script>
<script type="text/javascript">
var width=1000;
var height=1000;
var color=d3.rgb(111,222,121);
var data={"width":150,"height":100};
var svg=d3.select("body").append("svg").attr("width",1000).attr("height",1000).style("color","red");
var svg1=d3.select("body").append("svg").attr("width",width).attr("height",height);

var drag=d3.behavior.drag().on("drag",dragmove).on("dragend",dragmove1);
function dragmove(d){
//var aa=d3.select(this);

 //svg.append("rect").attr("x",d3.event.x).attr("y",d3.event.y)
	//.attr("width",data.width).attr("height",data.height).attr("fill","steelblue")
	d3.select(this).attr("x",d3.event.x).attr("y",d3.event.y).attr("class","remove");
}
function dragmove1(d){
var rectnum=d3.selectAll("rect").size();
//var aa=d3.select(this);
if(rectnum==1){
svg.append("rect").attr("x",20).attr("y",rectHeight)
	.attr("width",data.width).attr("height",data.height).attr("fill","steelblue").call(drag);
}
 else if(d3.select(this).attr("class")=="remove"&&d3.select("rect:nth-of-type("+rectnum+")").attr("class")!=null){
 svg.append("rect").attr("x",20).attr("y",rectHeight)
	.attr("width",data.width).attr("height",data.height).attr("fill","steelblue").call(drag);
 }
 
}
var rectHeight=25;
svg.append("rect").attr("x",20)
	.attr("y",rectHeight)
	.attr("width",data.width).attr("height",data.height).attr("fill","steelblue")
	.call(drag);
	//绘制直线
/* var line = svg.append("line")
			 .attr("x1",0)
			 .attr("y1",150)
			 .attr("x2",1000)
			 .attr("y2",150)
			 .attr("stroke","red")
			 .attr("stroke-width",2); */



		
var defs = svg.append("defs");

var arrowMarker = defs.append("marker")
						.attr("id","arrow")
						.attr("markerUnits","strokeWidth")
					    .attr("markerWidth","12")
                        .attr("markerHeight","12")
                        .attr("viewBox","0 0 12 12") 
                        .attr("refX","6")
                        .attr("refY","6")
                        .attr("orient","auto");

var arrow_path = "M2,2 L10,6 L2,10 L6,6 L2,2";
						
arrowMarker.append("path")
			.attr("d",arrow_path)
			.attr("fill","#000");

var line = svg.append("line")
			 .attr("x1",0)
			 .attr("y1",0)
			 .attr("x2",200)
			 .attr("y2",50)
			 .attr("stroke","red")
			 .attr("stroke-width",2)
			 .attr("marker-end","url(#arrow)");

var curve_path = "M20,70 T80,100 T160,80 T200,90";

var curve = svg.append("path")
			 .attr("d",curve_path)
			 .attr("fill","white")
			 .attr("stroke","red")
			 .attr("stroke-width",2)
			 .attr("marker-start","url(#arrow)")
			 .attr("marker-mid","url(#arrow)")
			 .attr("marker-end","url(#arrow)");
			 

     
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
