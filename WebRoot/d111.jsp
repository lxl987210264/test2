
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE svg PUBLIC "-//W3C//DTD SVG 1.1//EN"   "http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd">  
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">  
        <meta charset="utf-8">  
        <title>Arrow</title>  
  </head> 
<body>  
<script src="http://d3js.org/d3.v3.min.js" charset="utf-8"></script>  
<script>

var width  = 400;
var height = 400;
	
var svg = d3.select("body").append("svg")
	    .attr("width", width)
	    .attr("height", height);
		
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
  </body></html>