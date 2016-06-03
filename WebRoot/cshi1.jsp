<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
 String loginurl=request.getHeader("Referer");//获取用户的访问域名
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<!-- saved from url=(0044)http://www.ourd3js.com/demo/J-4.0/arrow.html -->
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">  
        <meta charset="utf-8">  
        <title>Arrow</title>  
  </head> 
<body>  
<script src="js/jquery-1.11.1.js" charset="utf-8"></script>  
<script src="http://d3js.org/d3.v3.min.js" charset="utf-8"></script>  
<script>

var width  = 1000;//svg画布的宽度
var height = 1000;//svg画布的高度
var leftcircle,topcircle,rightcircle,bottomcircle;//定义了左边圆点的对象，上边圆点对象，右边圆点对象以及下边圆点对象
var lineleftcircle,linerightcircle;//定义直线左边的圆点和右边的圆点
var leftline,topline,rightline,bottomline;//定义了方块四个圆点上的线
//创建画布
var svg = d3.select("body").append("svg")
	    .attr("width", width)
	    .attr("height", height);
//方块的宽度，高度	    
var data={"width":150,"height":100};
//定义拖拽事件
var drag=d3.behavior.drag().on("dragstart",dragmovestart).on("drag",dragmove).on("dragend",dragmoveend);
//拖拽中所触发的事件
function dragmove(d){
	d3.select(this).attr("x",d3.event.x).attr("y",d3.event.y).attr("class","remove");//重新定位方块的位置
	leftline=null;
	topline=null;
	rightline=null;
	bottomline=null;
	//获取左边圆圈上的直线
	leftcircleline(d3.select(this));
	//获取上边圆圈上的直线
	topcircleline(d3.select(this));
	//获取右边圆圈上的直线
	rightcircleline(d3.select(this));
	//获取下边圆圈上的直线
	buttomcircleline(d3.select(this));
	//重新定位正在拖动的圆点的位置
	if(leftcircle!=null){
	 leftcircle.attr("cx",d3.event.x).attr("cy",d3.event.y+d3.select(this).attr("height")/2);
	 topcircle.attr("cx",d3.event.x+d3.select(this).attr("width")/2).attr("cy",d3.event.y);
	 rightcircle.attr("cx",d3.event.x+d3.select(this).attr("width")/1).attr("cy",d3.event.y+d3.select(this).attr("height")/2);
	 bottomcircle.attr("cx",d3.event.x+d3.select(this).attr("width")/2).attr("cy",d3.event.y+d3.select(this).attr("height")/1);
	}
	
}
//获取左边边圆圈上的直线并重新定位
function leftcircleline(obj){
if(leftcircle.attr("cx")!=undefined){
	var leftline1=$("line[x1='"+(leftcircle.attr("cx")/1-0.1)+"'][y1='"+(leftcircle.attr("cy")/1-0.1)+"']");
	var leftline2=$("line[x2='"+(leftcircle.attr("cx")/1-0.1)+"'][y2='"+(leftcircle.attr("cy")/1-0.1)+"']");
	
	if(leftline1.attr("x1")!=undefined){
	   leftline=leftline1;
	   leftline.attr("x1",d3.event.x/1-0.1).attr("y1",d3.event.y+obj.attr("height")/2-0.1);
	   $("circle[cx='"+(leftcircle.attr("cx")/1-0.1)+"'][cy='"+(leftcircle.attr("cy")/1-0.1)+"']").attr("cx",d3.event.x/1-0.1).attr("cy",d3.event.y+obj.attr("height")/2-0.1);
	}else if(leftline2.attr("x2")!=undefined){
	  leftline=leftline2;
	  leftline.attr("x2",d3.event.x/1-0.1).attr("y2",d3.event.y/1+obj.attr("height")/2-0.1);
	   $("circle[cx='"+(leftcircle.attr("cx")/1-0.1)+"'][cy='"+(leftcircle.attr("cy")/1-0.1)+"']").attr("cx",d3.event.x/1-0.1).attr("cy",d3.event.y+obj.attr("height")/2-0.1);
	}
	}
}
//获取上边圆圈上的直线并重新定位
function topcircleline(obj){
  if(topcircle.attr("cx")!=undefined){
    //获取以上边圆圈上的圆点为直线开始的直线
	var topline1=$("line[x1='"+(topcircle.attr("cx")/1-0.1)+"'][y1='"+(topcircle.attr("cy")/1-0.1)+"']");
	//获取以上边圆圈上的圆点为直线结束的直线
	var topline2=$("line[x2='"+(topcircle.attr("cx")/1-0.1)+"'][y2='"+(topcircle.attr("cy")/1-0.1)+"']");
	//判断是否多于一条线
	if(topline1.size()>1){
	for(var i=0;i<topline1.size();i++){
	 topline=topline1.get(i);
	   topline.setAttribute("x1",d3.event.x+obj.attr("width")/2-0.1);
	   topline.setAttribute("y1",d3.event.y/1-0.1);
	   $("circle[cx='"+(topcircle.attr("cx")/1-0.1)+"'][cy='"+(topcircle.attr("cy")/1-0.1)+"']").attr("cx",d3.event.x+obj.attr("width")/2-0.1).attr("cy",d3.event.y/1-0.1);
	}
	  }else if(topline1.size()==1){
	   topline=topline1;
	   topline.attr("x1",d3.event.x+obj.attr("width")/2-0.1).attr("y1",d3.event.y/1-0.1);
	   $("circle[cx='"+(topcircle.attr("cx")/1-0.1)+"'][cy='"+(topcircle.attr("cy")/1-0.1)+"']").attr("cx",d3.event.x+obj.attr("width")/2-0.1).attr("cy",d3.event.y/1-0.1);
	}
	//判断是否多于一条线
	if(topline2.size()>1){
	for(var i=0;i<topline2.size();i++){
	topline=topline2.get(i);
	  topline.setAttribute("x2",d3.event.x+obj.attr("width")/2-0.1);
	  topline.setAttribute("y2",d3.event.y/1-0.1);
	   $("circle[cx='"+(topcircle.attr("cx")/1-0.1)+"'][cy='"+(topcircle.attr("cy")/1-0.1)+"']").attr("cx",d3.event.x+obj.attr("width")/2-0.1).attr("cy",d3.event.y/1-0.1);
	
	}
	}else if(topline2.size()==1){
	topline=topline2;
	  topline.attr("x2",d3.event.x+obj.attr("width")/2-0.1).attr("y2",d3.event.y/1-0.1);
	   $("circle[cx='"+(topcircle.attr("cx")/1-0.1)+"'][cy='"+(topcircle.attr("cy")/1-0.1)+"']").attr("cx",d3.event.x+obj.attr("width")/2-0.1).attr("cy",d3.event.y/1-0.1);
	}
	
	}
}
//获取右边圆圈上的直线并重新定位
function rightcircleline(obj){
 	if(rightcircle.attr("cx")!=undefined){
	var rightline1=$("line[x1='"+(rightcircle.attr("cx")/1-0.1)+"'][y1='"+(rightcircle.attr("cy")/1-0.1)+"']");
	var rightline2=$("line[x2='"+(rightcircle.attr("cx")/1-0.1)+"'][y2='"+(rightcircle.attr("cy")/1-0.1)+"']");
	if(rightline1.attr("x1")!=undefined){
	   rightline=rightline1;
	   rightline.attr("x1",d3.event.x+obj.attr("width")/1-0.1).attr("y1",d3.event.y+obj.attr("height")/2-0.1);
	   $("circle[cx='"+(rightcircle.attr("cx")/1-0.1)+"'][cy='"+(rightcircle.attr("cy")/1-0.1)+"']").attr("cx",d3.event.x+obj.attr("width")/1-0.1).attr("cy",d3.event.y+obj.attr("height")/2-0.1);
	}else if(rightline2.attr("x2")!=undefined){
	   rightline=rightline2;
	  rightline.attr("x2",d3.event.x+obj.attr("width")/1-0.1).attr("y2",d3.event.y+obj.attr("height")/2-0.1);
	   $("circle[cx='"+(rightcircle.attr("cx")/1-0.1)+"'][cy='"+(rightcircle.attr("cy")/1-0.1)+"']").attr("cx",d3.event.x+obj.attr("width")/1-0.1).attr("cy",d3.event.y+obj.attr("height")/2-0.1);
	}
	}
}
//获取下边圆圈上的直线并重新定位
function buttomcircleline(obj){
 if(bottomcircle.attr("cx")!=undefined){
	var bottomline1=$("line[x1='"+(bottomcircle.attr("cx")/1-0.1)+"'][y1='"+(bottomcircle.attr("cy")/1-0.1)+"']");
	var bottomline2=$("line[x2='"+(bottomcircle.attr("cx")/1-0.1)+"'][y2='"+(bottomcircle.attr("cy")/1-0.1)+"']");
	if(bottomline1.attr("x1")!=undefined){
	   bottomline=bottomline1;
	   bottomline.attr("x1",d3.event.x+obj.attr("width")/2-0.1).attr("y1",d3.event.y+obj.attr("height")/1-0.1);
	   $("circle[cx='"+(bottomcircle.attr("cx")/1-0.1)+"'][cy='"+(bottomcircle.attr("cy")/1-0.1)+"']").attr("cx",d3.event.x+obj.attr("width")/2-0.1).attr("cy",d3.event.y+obj.attr("height")/1-0.1);
	}else if(bottomline2.attr("x2")!=undefined){
	   bottomline=bottomline2;
	  bottomline.attr("x2",d3.event.x+obj.attr("width")/2-0.1).attr("y2",d3.event.y/1+obj.attr("height")/1-0.1);
	   $("circle[cx='"+(bottomcircle.attr("cx")/1-0.1)+"'][cy='"+(bottomcircle.attr("cy")/1-0.1)+"']").attr("cx",d3.event.x+obj.attr("width")/2-0.1).attr("cy",d3.event.y+obj.attr("height")/1-0.1);
	}
	}
}
//拖动开始事件---给之前定义的圆点对象赋值
function dragmovestart(){
leftcircle=null;
topcircle=null;
rightcircle=null;
bottomcircle=null;
leftcircle=$("circle[cx='"+d3.select(this).attr("x")/1+"'][cy='"+(d3.select(this).attr("y")/1+d3.select(this).attr("height")/2)+"']");
topcircle=$("circle[cx='"+(d3.select(this).attr("x")/1+d3.select(this).attr("width")/2)+"'][cy='"+d3.select(this).attr("y")/1+"']");
rightcircle=$("circle[cx='"+(d3.select(this).attr("x")/1+d3.select(this).attr("width")/1)+"'][cy='"+(d3.select(this).attr("y")/1+d3.select(this).attr("height")/2)+"']");
bottomcircle=$("circle[cx='"+(d3.select(this).attr("x")/1+d3.select(this).attr("width")/2)+"'][cy='"+(d3.select(this).attr("y")/1+d3.select(this).attr("height")/1)+"']");
}
//拖动结束事件
function dragmoveend(d){
var rectnum=d3.selectAll("rect").size();
//判断是否是第一个方块
if(rectnum==1){
svg.append("rect").attr("x",20).attr("y",rectHeight)
	.attr("width",data.width).attr("height",data.height).attr("fill","steelblue").call(drag);
	addcircle(d3.select(this));
}
 else if(d3.select(this).attr("class")=="remove"&&d3.select("rect:nth-of-type("+rectnum+")").attr("class")!=null){
 svg.append("rect").attr("x",20).attr("y",rectHeight)
	.attr("width",data.width).attr("height",data.height).attr("fill","steelblue").call(drag);
 addcircle(d3.select(this));					 
 }
 
}
//给方块添加圆点
function addcircle(currect){
//方块左边的圆点
	 svg.append("circle")
			.attr("cx",currect.attr("x")/1)
			.attr("cy",currect.attr("y")/1+currect.attr("height")/2)
			.attr("r",5).attr("stroke","blue")
			.attr("fill","white").call(dragrectcircle);
//方块上边的圆点
	 svg.append("circle")
			.attr("cx",currect.attr("x")/1+currect.attr("width")/2)
			.attr("cy",currect.attr("y")/1)
			.attr("r",5).attr("stroke","blue")
			.attr("fill","white");
//方块右边的圆点			
	 svg.append("circle")
			.attr("cx",currect.attr("x")/1+currect.attr("width")/1)
			.attr("cy",currect.attr("y")/1+currect.attr("height")/2)
			.attr("r",5).attr("stroke","blue")
			.attr("fill","white").call(dragrectcircle1);
//方块下边边的圆点			
	 svg.append("circle")
			.attr("cx",currect.attr("x")/1+currect.attr("width")/2)
			.attr("cy",currect.attr("y")/1+currect.attr("height")/1)
			.attr("r",5).attr("stroke","blue")
			.attr("fill","white");
}
//拖拽方块圆点标记改变方块的大小
//左边圆点
var dragrectcircle=d3.behavior.drag().on("dragstart",rectcirclestart).on("drag",rectcircle);
//右边圆点
var dragrectcircle1=d3.behavior.drag().on("dragstart",rectcirclestart1).on("drag",rectcircle1);
var currect=null;
//拖拽方块上面圆点执行时执行的事件
function rectcirclestart(){
   var rectAll=$(".remove");
   var circle=d3.select(this);
  $.each(rectAll,function(i,data){
     if(data.getAttribute("x")/1==circle.attr("cx")/1&&(data.getAttribute("y")/1+data.getAttribute("height")/2)==circle.attr("cy")/1){
       currect=data;
     }
  });
 findcircle(currect);
 }
function rectcirclestart1(){
   var rectAll=$(".remove");
   var circle=d3.select(this);
  $.each(rectAll,function(i,data){
     if(data.getAttribute("x")/1+data.getAttribute("width")/1==circle.attr("cx")/1&&(data.getAttribute("y")/1+data.getAttribute("height")/2)==circle.attr("cy")/1){
       currect=data;
     }
  });
 findcircle(currect);
}
function findcircle(currect){
topcircle=$("circle[cx='"+(currect.getAttribute("x")/1+currect.getAttribute("width")/2)+"'][cy='"+currect.getAttribute("y")/1+"']");
 bottomcircle=$("circle[cx='"+(currect.getAttribute("x")/1+currect.getAttribute("width")/2)+"'][cy='"+(currect.getAttribute("y")/1+currect.getAttribute("height")/1)+"']");
 rightcircle=$("circle[cx='"+(currect.getAttribute("x")/1+currect.getAttribute("width")/2)+"'][cy='"+(currect.getAttribute("y")/1+currect.getAttribute("height")/2)+"']");
 leftcircle=$("circle[cx='"+currect.getAttribute("x")/1+"'][cy='"+currect.getAttribute("y")/1+currect.getAttribute("height")/2+"']");
}
//拖拽方块上面左边圆点进行时执行的事件
function rectcircle(){
  var oldx=currect.getAttribute("x")/1;
  if(currect.getAttribute("width")/1-(d3.event.x/1-oldx)>10){
   currect.setAttribute("x",d3.event.x);
   currect.setAttribute("width",currect.getAttribute("width")/1-(d3.event.x/1-oldx));
   d3.select(this).attr("cx",d3.event.x);
    if(topcircle.attr("cx")!=undefined){
		var topline1=$("line[x1='"+(topcircle.attr("cx")/1-0.1)+"'][y1='"+(topcircle.attr("cy")/1-0.1)+"']");
		var topline2=$("line[x2='"+(topcircle.attr("cx")/1-0.1)+"'][y2='"+(topcircle.attr("cy")/1-0.1)+"']");
		if(topline1.attr("x1")!=undefined){
		   topline=topline1;
		   topline.attr("x1",d3.event.x+currect.getAttribute("width")/2-0.1).attr("y1",currect.getAttribute("y")/1-0.1);
		   $("circle[cx='"+(topcircle.attr("cx")/1-0.1)+"'][cy='"+(topcircle.attr("cy")/1-0.1)+"']").attr("cx",d3.event.x+currect.getAttribute("width")/2-0.1).attr("cy",currect.getAttribute("y")/1-0.1);
		}else if(topline2.attr("x2")!=undefined){
		   topline=topline2;
		  topline.attr("x2",d3.event.x+currect.getAttribute("width")/2-0.1).attr("y2",currect.getAttribute("y")/1-0.1);
		   $("circle[cx='"+(topcircle.attr("cx")/1-0.1)+"'][cy='"+(topcircle.attr("cy")/1-0.1)+"']").attr("cx",d3.event.x+currect.getAttribute("width")/2-0.1).attr("cy",currect.getAttribute("y")/1-0.1);
		}
	}
	 if(bottomcircle.attr("cx")!=undefined){
		var bottomline1=$("line[x1='"+(bottomcircle.attr("cx")/1-0.1)+"'][y1='"+(bottomcircle.attr("cy")/1-0.1)+"']");
		var bottomline2=$("line[x2='"+(bottomcircle.attr("cx")/1-0.1)+"'][y2='"+(bottomcircle.attr("cy")/1-0.1)+"']");
		if(bottomline1.attr("x1")!=undefined){
		   bottomline=bottomline1;
		   bottomline.attr("x1",d3.event.x+currect.getAttribute("width")/2-0.1).attr("y1",currect.getAttribute("y")/1+currect.getAttribute("height")/1-0.1);
		   $("circle[cx='"+(bottomcircle.attr("cx")/1-0.1)+"'][cy='"+(bottomcircle.attr("cy")/1-0.1)+"']").attr("cx",d3.event.x+currect.getAttribute("width")/2-0.1).attr("cy",currect.getAttribute("y")/1+currect.getAttribute("height")/1-0.1);
		}else if(bottomline2.attr("x2")!=undefined){
		   bottomline=bottomline2;
		  bottomline.attr("x2",d3.event.x+currect.getAttribute("width")/2-0.1).attr("y2",currect.getAttribute("y")/1+currect.getAttribute("height")/1-0.1);
		   $("circle[cx='"+(bottomcircle.attr("cx")/1-0.1)+"'][cy='"+(bottomcircle.attr("cy")/1-0.1)+"']").attr("cx",d3.event.x+currect.getAttribute("width")/2-0.1).attr("cy",currect.getAttribute("y")/1+currect.getAttribute("height")/1-0.1);
		}
	}
	if(leftcircle.attr("cx")!=undefined){
		var leftline1=$("line[x1='"+(leftcircle.attr("cx")/1-0.1)+"'][y1='"+(leftcircle.attr("cy")/1-0.1)+"']");
		var leftline2=$("line[x2='"+(leftcircle.attr("cx")/1-0.1)+"'][y2='"+(leftcircle.attr("cy")/1-0.1)+"']");
		
		if(leftline1.attr("x1")!=undefined){
		   leftline=leftline1;
		   leftline.attr("x1",d3.event.x/1-0.1).attr("y1",currect.getAttribute("y")/1+currect.getAttribute("height")/2-0.1);
		   $("circle[cx='"+(leftcircle.attr("cx")/1-0.1)+"'][cy='"+(leftcircle.attr("cy")/1-0.1)+"']").attr("cx",d3.event.x/1-0.1).attr("cy",currect.getAttribute("y")/1+currect.getAttribute("height")/2-0.1);
		}else if(leftline2.attr("x2")!=undefined){
		  leftline=leftline2;
		  leftline.attr("x2",d3.event.x/1-0.1).attr("y2",currect.getAttribute("y")/1+currect.getAttribute("height")/2-0.1);
		   $("circle[cx='"+(leftcircle.attr("cx")/1-0.1)+"'][cy='"+(leftcircle.attr("cy")/1-0.1)+"']").attr("cx",d3.event.x/1-0.1).attr("cy",currect.getAttribute("y")/1+currect.getAttribute("height")/2-0.1);
		}
	}
   topcircle.attr("cx",currect.getAttribute("x")/1+currect.getAttribute("width")/2);
   bottomcircle.attr("cx",currect.getAttribute("x")/1+currect.getAttribute("width")/2);
  }
  
}
//拖拽方块上面右边圆点进行时执行的事件
function rectcircle1(){
  var oldwidth=currect.getAttribute("width")/1;
	
  if(currect.getAttribute("width")/1+(d3.event.x/1-currect.getAttribute("x")/1-oldwidth)>10){
   currect.setAttribute("width",(currect.getAttribute("width")/1+(d3.event.x-currect.getAttribute("x")/1-oldwidth)));
   d3.select(this).attr("cx",d3.event.x);
    if(topcircle.attr("cx")!=undefined){
		var topline1=$("line[x1='"+(topcircle.attr("cx")/1-0.1)+"'][y1='"+(topcircle.attr("cy")/1-0.1)+"']");
		var topline2=$("line[x2='"+(topcircle.attr("cx")/1-0.1)+"'][y2='"+(topcircle.attr("cy")/1-0.1)+"']");
		if(topline1.attr("x1")!=undefined){
		   topline=topline1;
		   topline.attr("x1",currect.getAttribute("x")/1+currect.getAttribute("width")/2-0.1).attr("y1",currect.getAttribute("y")/1-0.1);
		   $("circle[cx='"+(topcircle.attr("cx")/1-0.1)+"'][cy='"+(topcircle.attr("cy")/1-0.1)+"']").attr("cx",currect.getAttribute("x")/1+currect.getAttribute("width")/2-0.1).attr("cy",currect.getAttribute("y")/1-0.1);
		}else if(topline2.attr("x2")!=undefined){
		   topline=topline2;
		  topline.attr("x2",currect.getAttribute("x")/1+currect.getAttribute("width")/2-0.1).attr("y2",currect.getAttribute("y")/1-0.1);
		   $("circle[cx='"+(topcircle.attr("cx")/1-0.1)+"'][cy='"+(topcircle.attr("cy")/1-0.1)+"']").attr("cx",currect.getAttribute("x")/1+currect.getAttribute("width")/2-0.1).attr("cy",currect.getAttribute("y")/1-0.1);
		}
	}
	 if(bottomcircle.attr("cx")!=undefined){
		var bottomline1=$("line[x1='"+(bottomcircle.attr("cx")/1-0.1)+"'][y1='"+(bottomcircle.attr("cy")/1-0.1)+"']");
		var bottomline2=$("line[x2='"+(bottomcircle.attr("cx")/1-0.1)+"'][y2='"+(bottomcircle.attr("cy")/1-0.1)+"']");
		if(bottomline1.attr("x1")!=undefined){
		   bottomline=bottomline1;
		   bottomline.attr("x1",currect.getAttribute("x")/1+currect.getAttribute("width")/2-0.1).attr("y1",currect.getAttribute("y")/1+currect.getAttribute("height")/1-0.1);
		   $("circle[cx='"+(bottomcircle.attr("cx")/1-0.1)+"'][cy='"+(bottomcircle.attr("cy")/1-0.1)+"']").attr("cx",currect.getAttribute("x")/1+currect.getAttribute("width")/2-0.1).attr("cy",currect.getAttribute("y")/1+currect.getAttribute("height")/1-0.1);
		}else if(bottomline2.attr("x2")!=undefined){
		   bottomline=bottomline2;
		  bottomline.attr("x2",(currect.getAttribute("x")/1+currect.getAttribute("width")/2-0.1)).attr("y2",currect.getAttribute("y")/1+currect.getAttribute("height")/1-0.1);
		   $("circle[cx='"+(bottomcircle.attr("cx")/1-0.1)+"'][cy='"+(bottomcircle.attr("cy")/1-0.1)+"']").attr("cx",currect.getAttribute("x")/1+currect.getAttribute("width")/2-0.1).attr("cy",currect.getAttribute("y")/1+currect.getAttribute("height")/1-0.1);
		}
	}
   if(rightcircle.attr("cx")!=undefined){
		var rightline1=$("line[x1='"+(rightcircle.attr("cx")/1-0.1)+"'][y1='"+(rightcircle.attr("cy")/1-0.1)+"']");
		var rightline2=$("line[x2='"+(rightcircle.attr("cx")/1-0.1)+"'][y2='"+(rightcircle.attr("cy")/1-0.1)+"']");
		if(rightline1.attr("x1")!=undefined){
		   rightline=rightline1;
		   rightline.attr("x1",currect.getAttribute("x")/1+currect.getAttribute("width")/1-0.1).attr("y1",currect.getAttribute("y")/1+currect.getAttribute("height")/2-0.1);
		   $("circle[cx='"+(rightcircle.attr("cx")/1-0.1)+"'][cy='"+(rightcircle.attr("cy")/1-0.1)+"']").attr("cx",currect.getAttribute("x")/1+currect.getAttribute("width")/1-0.1).attr("cy",currect.getAttribute("y")/1+currect.getAttribute("height")/2-0.1);
		}else if(rightline2.attr("x2")!=undefined){
		   rightline=rightline2;
		  rightline.attr("x2",currect.getAttribute("x")/1+currect.getAttribute("width")/1-0.1).attr("y2",currect.getAttribute("y")/1+currect.getAttribute("height")/2-0.1);
		   $("circle[cx='"+(rightcircle.attr("cx")/1-0.1)+"'][cy='"+(rightcircle.attr("cy")/1-0.1)+"']").attr("cx",currect.getAttribute("x")/1+currect.getAttribute("width")/1-0.1).attr("cy",currect.getAttribute("y")/1+currect.getAttribute("height")/2-0.1);
		}
	} 
   topcircle.attr("cx",currect.getAttribute("x")/1+currect.getAttribute("width")/2);
   bottomcircle.attr("cx",currect.getAttribute("x")/1+currect.getAttribute("width")/2);
  }
  
}
//方块左上角y轴距离
var rectHeight=25;
//控件拦中的方块
svg.append("rect").attr("x",20)
	.attr("y",rectHeight)
	.attr("width",data.width).attr("height",data.height).attr("fill","steelblue")
	.call(drag);	
//绘制直线
var line = svg.append("line")
			 .attr("x1",0)
			 .attr("y1",150)
			 .attr("x2",1000)
			 .attr("y2",150)
			 .attr("stroke","red")
			 .attr("stroke-width",2); 
	
var defs = svg.append("defs");
//定义箭头的标示
var arrowMarker = defs.append("marker")
						.attr("id","arrow")
						.attr("markerUnits","strokeWidth")
					    .attr("markerWidth","6")
                        .attr("markerHeight","12")
                        .attr("viewBox","0 0 12 12") 
                        .attr("refX","6")
                        .attr("refY","6")
                        .attr("orient","auto");

var arrow_path = "M2,2 L10,6 L2,10 L6,6 L2,2";
						
arrowMarker.append("path")
			.attr("d",arrow_path)
			.attr("fill","#000");

//箭头拖拽事件
var dragline=d3.behavior.drag().on("dragstart",movestartline).on("drag",linemove).on("dragend",changeline);
//直线移动事件
function linemove(d){
	d3.select(this).attr("x1",d3.event.x).attr("y1",d3.event.y).attr("x2",d3.event.x+200).attr("y2",d3.event.y).attr("class","lineremove");
	if(lineleftcircle!=null&&linerightcircle!=null){
	   if(lineleftcircle.size()>1){
	      lineleftcircle.get(0).setAttribute("cx",d3.select(this).attr("x1"));
	      lineleftcircle.get(0).setAttribute("cy",d3.select(this).attr("y1"));
	   }else{
	    lineleftcircle.attr("cx",d3.select(this).attr("x1")).attr("cy",d3.select(this).attr("y1"));
	   }
	 
	    if(linerightcircle.size()>1){
	      linerightcircle.get(0).setAttribute("cx",d3.select(this).attr("x2"));
	      linerightcircle.get(0).setAttribute("cy",d3.select(this).attr("y2"));
	   } else{
	       linerightcircle.attr("cx",d3.select(this).attr("x2")).attr("cy",d3.select(this).attr("y2"));
	   }
	 
	}
}
//直线拖动开始事件
function movestartline(){
lineleftcircle=null;
linerightcircle=null;
lineleftcircle=$("circle[cx='"+d3.select(this).attr("x1")+"'][cy='"+d3.select(this).attr("y1")+"']");
if(lineleftcircle.size()==0){
  var line=$("line[x2='"+d3.select(this).attr("x1")+"'][y2='"+d3.select(this).attr("y1")+"']");
  if(line.size()>1){
  lineleftcircle=$("circle[cx='"+line.get(0).getAttribute("x1")+"'][cy='"+line.get(0).getAttribute("y1")+"']");
    if(lineleftcircle.size()==0){
      var line1=$("line[x2='"+line.get(0).getAttribute("x1")+"'][y2='"+line.get(0).getAttribute("y1")+"']");
      if(line1.size()>1){
         lineleftcircle=$("circle[cx='"+line1.get(0).getAttribute("x1")+"'][cy='"+line1.get(0).getAttribute("y1")+"']");
      }else{
        lineleftcircle=$("circle[cx='"+line1.attr("x1")+"'][cy='"+line1.attr("y1")+"']");
      }
      line1.remove();
   }
   
  }else{
  lineleftcircle=$("circle[cx='"+line.attr("x1")+"'][cy='"+line.attr("y1")+"']");
    if(lineleftcircle.size()==0){
      var line1=$("line[x2='"+line.attr("x1")+"'][y2='"+line.attr("y1")+"']");
      if(line1.size()>1){
         lineleftcircle=$("circle[cx='"+line1.get(0).attr("x1")+"'][cy='"+line1.get(0).attr("y1")+"']");
      }else{
        lineleftcircle=$("circle[cx='"+line1.attr("x1")+"'][cy='"+line1.attr("y1")+"']");
      }
      line1.remove();
   }
  }
  line.remove(); 
}
linerightcircle=$("circle[cx='"+d3.select(this).attr("x2")+"'][cy='"+d3.select(this).attr("y2")+"']");
if(linerightcircle.size()==0){
  var line=$("line[x1='"+d3.select(this).attr("x2")+"'][y1='"+d3.select(this).attr("y2")+"']");
  if(line.size()>1){
  linerightcircle=$("circle[cx='"+line.get(0).getAttribute("x2")+"'][cy='"+line.get(0).getAttribute("y2")+"']");
	  if(linerightcircle.size()==0){
	      var line1=$("line[x1='"+line.get(0).getAttribute("x2")+"'][y1='"+line.get(0).getAttribute("y2")+"']");
	      if(line1.size()>1){
	        linerightcircle=$("circle[cx='"+line1.get(0).getAttribute("x2")+"'][cy='"+line1.get(0).getAttribute("y2")+"']");
	      }else{
	        linerightcircle=$("circle[cx='"+line1.attr("x2")+"'][cy='"+line1.attr("y2")+"']");
	      }
	      line1.remove();
	  }
  }else{
  linerightcircle=$("circle[cx='"+line.attr("x2")+"'][cy='"+line.attr("y2")+"']");
   if(linerightcircle.size()==0){
	      var line1=$("line[x1='"+line.attr("x2")+"'][y1='"+line.attr("y2")+"']");
	      if(line1.size()>1){
	        linerightcircle=$("circle[cx='"+line1.get(0).getAttribute("x2")+"'][cy='"+line1.get(0).getAttribute("y2")+"']");
	      }else{
	        linerightcircle=$("circle[cx='"+line1.attr("x2")+"'][cy='"+line1.attr("y2")+"']");
	      }
	       line1.remove();
	  }
  }
  line.remove(); 
  d3.select(this).attr("marker-end","url(#arrow)");
}
}
//纠正直线两端连接点
function changeline(){

  var rectnum=d3.selectAll("line").size();
//判断是否是第一个直线
if(rectnum==1){
svg.append("line")
			 .attr("x1",200)
			 .attr("y1",75)
			 .attr("x2",400)
			 .attr("y2",75)
			 .attr("stroke","red")
			 .attr("stroke-width",5)
			 .attr("marker-end","url(#arrow)").attr("class","linestart")
			 .call(dragline);
			 addlinecircle(d3.select(this));
}
 else if(d3.select(this).attr("class")=="lineremove"&&$("line.linestart").size()==0){
 svg.append("line")
			 .attr("x1",200)
			 .attr("y1",75)
			 .attr("x2",400)
			 .attr("y2",75)
			 .attr("stroke","red")
			 .attr("stroke-width",5).attr("class","linestart")
			 .attr("marker-end","url(#arrow)")
			 .call(dragline);
 addlinecircle(d3.select(this));					 
 }
 linkcirrect(d3.select(this));
}
//自动连接适当位置的点
function linkcirrect(obj){
 var x1=obj.attr("x1");
  var y1=obj.attr("y1");
  var curline=obj;
  var linecircle1=$("circle[cx='"+obj.attr("x1")+"'][cy='"+obj.attr("y1")+"']");//直线左边开始圆点标记
  var rectAll=$(".remove");
  $.each(rectAll,function(i,data){
    //判断直线左边连接点是否与方块右边的连接点最近(内边距为20，外边距为10)
    if((data.getAttribute("x")/1+data.getAttribute("width")/1-20)<x1&&x1<(data.getAttribute("x")/1+data.getAttribute("width")/1+10)&&y1<(data.getAttribute("y")/1+data.getAttribute("height")/1)&&y1>data.getAttribute("y")/1){
     curline.attr("x1",data.getAttribute("x")/1+data.getAttribute("width")/1-0.1);
     curline.attr("y1",data.getAttribute("y")/1+data.getAttribute("height")/2-0.1);
     linecircle1.attr("cx",data.getAttribute("x")/1+data.getAttribute("width")/1-0.1).attr("cy",data.getAttribute("y")/1+data.getAttribute("height")/2-0.1);
    
    //判断直线左边连接点是否与方块上边的连接点最近
    }else if((data.getAttribute("x")/1+data.getAttribute("width")/1)>x1&&x1>data.getAttribute("x")/1&&y1<(data.getAttribute("y")/1+20)&&y1>(data.getAttribute("y")/1-10)){
      curline.attr("x1",data.getAttribute("x")/1+data.getAttribute("width")/2-0.1);
      curline.attr("y1",data.getAttribute("y")/1-0.1);
      linecircle1.attr("cx",data.getAttribute("x")/1+data.getAttribute("width")/2-0.1).attr("cy",data.getAttribute("y")/1-0.1);
    //判断直线左边连接点是否与方块左边的连接点最近
    }else if((data.getAttribute("x")/1-10)<x1&&x1<(data.getAttribute("x")/1+20)&&y1>(data.getAttribute("y")/1)&&y1<(data.getAttribute("y")/1+data.getAttribute("height")/1)){
      curline.attr("x1",data.getAttribute("x")/1-0.1);
      curline.attr("y1",data.getAttribute("y")/1+data.getAttribute("height")/2-0.1);
      linecircle1.attr("cx",data.getAttribute("x")/1-0.1).attr("cy",data.getAttribute("y")/1+data.getAttribute("height")/2-0.1);
     //判断直线左边连接点是否与方块下边的连接点最近
    }else if((data.getAttribute("x")/1)<x1&&x1<(data.getAttribute("x")/1+data.getAttribute("width")/1)&&y1>(data.getAttribute("y")/1+data.getAttribute("height")/1-20)&&y1<(data.getAttribute("y")/1+data.getAttribute("height")/1+10)){
      curline.attr("x1",data.getAttribute("x")/1+data.getAttribute("width")/2-0.1);
      curline.attr("y1",data.getAttribute("y")/1+data.getAttribute("height")/1-0.1);
      linecircle1.attr("cx",data.getAttribute("x")/1+data.getAttribute("width")/2-0.1).attr("cy",data.getAttribute("y")/1+data.getAttribute("height")/1-0.1);
    }
    
  });
}
//自动连接适当位置的点
function linkcirrectend(obj){
 var x2=obj.attr("x2");
  var y2=obj.attr("y2");
  var curline=obj;
  var linecircle1=$("circle[cx='"+obj.attr("x2")+"'][cy='"+obj.attr("y2")+"']");//直线左边开始圆点标记
  var rectAll=$(".remove");
  $.each(rectAll,function(i,data){
    //判断直线尾部连接点是否与方块右边的连接点最近(内边距为20，外边距为10)
    if((data.getAttribute("x")/1+data.getAttribute("width")/1-20)<x2&&x2<(data.getAttribute("x")/1+data.getAttribute("width")/1+10)&&y2<(data.getAttribute("y")/1+data.getAttribute("height")/1)&&y2>data.getAttribute("y")/1){
     curline.attr("x2",data.getAttribute("x")/1+data.getAttribute("width")/1-0.1);
     //判断是否直线是否需要改变角度
        if(curline.attr("y1")/1!=curline.attr("y2")/1){
        if(curline.attr("x1")/1<curline.attr("x2")/1){
        svg.append("line").attr("x1",curline.attr("x1")/1)
			 .attr("y1",curline.attr("y1")/1)
			 .attr("x2",curline.attr("x2")/1+(curline.attr("x2")/1-curline.attr("x1")/1)/2)
			 .attr("y2",curline.attr("y1")/1)
			 .attr("stroke","red")
			 .attr("stroke-width",5).call(dragline);
		svg.append("line").attr("x1",curline.attr("x2")/1+(curline.attr("x2")/1-curline.attr("x1")/1)/2)
			 .attr("y1",curline.attr("y1")/1)
			 .attr("x2",curline.attr("x2")/1+(curline.attr("x2")/1-curline.attr("x1")/1)/2)
			 .attr("y2",data.getAttribute("y")/1+data.getAttribute("height")/2-0.1)
			 .attr("stroke","red")
			 .attr("stroke-width",5).call(dragline);
		curline.attr("x1",curline.attr("x2")/1+(curline.attr("x2")/1-curline.attr("x1")/1)/2);
          curline.attr("y1",data.getAttribute("y")/1+data.getAttribute("height")/2-0.1);	 
        }else{
        svg.append("line").attr("x1",curline.attr("x1")/1)
			 .attr("y1",curline.attr("y1")/1)
			 .attr("x2",curline.attr("x1")/1+(curline.attr("x2")/1-curline.attr("x1")/1)/2)
			 .attr("y2",curline.attr("y1")/1)
			 .attr("stroke","red")
			 .attr("stroke-width",5).call(dragline);
		svg.append("line").attr("x1",curline.attr("x1")/1+(curline.attr("x2")/1-curline.attr("x1")/1)/2)
			 .attr("y1",curline.attr("y1")/1)
			 .attr("x2",curline.attr("x1")/1+(curline.attr("x2")/1-curline.attr("x1")/1)/2)
			 .attr("y2",data.getAttribute("y")/1+data.getAttribute("height")/2-0.1)
			 .attr("stroke","red")
			 .attr("stroke-width",5).call(dragline);
			 curline.attr("x1",curline.attr("x1")/1+(curline.attr("x2")/1-curline.attr("x1")/1)/2);
          curline.attr("y1",data.getAttribute("y")/1+data.getAttribute("height")/2-0.1);
        }
        }
      curline.attr("y2",data.getAttribute("y")/1+data.getAttribute("height")/2-0.1);
     linecircle1.attr("cx",data.getAttribute("x")/1+data.getAttribute("width")/1-0.1).attr("cy",data.getAttribute("y")/1+data.getAttribute("height")/2-0.1);
    //判断直线尾部连接点是否与方块上边的连接点最近
    }else if((data.getAttribute("x")/1+data.getAttribute("width")/1)>x2&&x2>data.getAttribute("x")/1&&y2<(data.getAttribute("y")/1+20)&&y2>(data.getAttribute("y")/1-10)){
      curline.attr("x2",data.getAttribute("x")/1+data.getAttribute("width")/2-0.1);
         if(curline.attr("y1")/1!=curline.attr("y2")/1){
        svg.append("line").attr("x1",curline.attr("x1")/1)
			 .attr("y1",curline.attr("y1")/1)
			 .attr("x2",curline.attr("x2")/1)
			 .attr("y2",curline.attr("y1")/1)
			 .attr("stroke","red")
			 .attr("stroke-width",5).attr("class","lineremove").call(dragline);
          curline.attr("x1",curline.attr("x2")/1);
     } 
      curline.attr("y2",data.getAttribute("y")/1-0.1);
      linecircle1.attr("cx",data.getAttribute("x")/1+data.getAttribute("width")/2-0.1).attr("cy",data.getAttribute("y")/1-0.1);
    //判断直线尾部连接点是否与方块左边的连接点最近
    }else if((data.getAttribute("x")/1-10)<x2&&x2<(data.getAttribute("x")/1+20)&&y2>(data.getAttribute("y")/1)&&y2<(data.getAttribute("y")/1+data.getAttribute("height")/1)){
      curline.attr("x2",data.getAttribute("x")/1-0.1);
      if(curline.attr("y1")/1!=curline.attr("y2")/1){
      if(curline.attr("x1")/1<curline.attr("x2")/1){
        svg.append("line").attr("x1",curline.attr("x1")/1)
			 .attr("y1",curline.attr("y1")/1)
			 .attr("x2",curline.attr("x1")/1+(curline.attr("x2")/1-curline.attr("x1")/1)/2)
			 .attr("y2",curline.attr("y1")/1)
			 .attr("stroke","red")
			 .attr("stroke-width",5).attr("class","lineremove").call(dragline);
		svg.append("line").attr("x1",curline.attr("x1")/1+(curline.attr("x2")/1-curline.attr("x1")/1)/2)
			 .attr("y1",curline.attr("y1")/1)
			 .attr("x2",curline.attr("x1")/1+(curline.attr("x2")/1-curline.attr("x1")/1)/2)
			 .attr("y2",data.getAttribute("y")/1+data.getAttribute("height")/2-0.1)
			 .attr("stroke","red")
			 .attr("stroke-width",5).attr("class","lineremove").call(dragline);
			  curline.attr("x1",curline.attr("x1")/1+(curline.attr("x2")/1-curline.attr("x1")/1)/2);
          curline.attr("y1",data.getAttribute("y")/1+data.getAttribute("height")/2-0.1);
      }else{
       svg.append("line").attr("x1",curline.attr("x1")/1)
			 .attr("y1",curline.attr("y1")/1)
			 .attr("x2",curline.attr("x2")/1+(curline.attr("x2")/1-curline.attr("x1")/1)/2)
			 .attr("y2",curline.attr("y1")/1)
			 .attr("stroke","red")
			 .attr("stroke-width",5).attr("class","lineremove").call(dragline);
		svg.append("line").attr("x1",curline.attr("x2")/1+(curline.attr("x2")/1-curline.attr("x1")/1)/2)
			 .attr("y1",curline.attr("y1")/1)
			 .attr("x2",curline.attr("x2")/1+(curline.attr("x2")/1-curline.attr("x1")/1)/2)
			 .attr("y2",data.getAttribute("y")/1+data.getAttribute("height")/2-0.1)
			 .attr("stroke","red")
			 .attr("stroke-width",5).attr("class","lineremove").call(dragline);
			  curline.attr("x1",curline.attr("x2")/1+(curline.attr("x2")/1-curline.attr("x1")/1)/2);
          curline.attr("y1",data.getAttribute("y")/1+data.getAttribute("height")/2-0.1);
      }
      
     } 
      curline.attr("y2",data.getAttribute("y")/1+data.getAttribute("height")/2-0.1);
      linecircle1.attr("cx",data.getAttribute("x")/1-0.1).attr("cy",data.getAttribute("y")/1+data.getAttribute("height")/2-0.1);
     //判断直线尾部连接点是否与方块下边的连接点最近
    }else if((data.getAttribute("x")/1)<x2&&x2<(data.getAttribute("x")/1+data.getAttribute("width")/1)&&y2>(data.getAttribute("y")/1+data.getAttribute("height")/1-20)&&y2<(data.getAttribute("y")/1+data.getAttribute("height")/1+10)){
      curline.attr("x2",data.getAttribute("x")/1+data.getAttribute("width")/2-0.1);
     if(curline.attr("y1")/1!=curline.attr("y2")/1){
        svg.append("line").attr("x1",curline.attr("x1")/1)
			 .attr("y1",curline.attr("y1")/1)
			 .attr("x2",curline.attr("x2")/1)
			 .attr("y2",curline.attr("y1")/1)
			 .attr("stroke","red")
			 .attr("stroke-width",5).attr("class","lineremove").call(dragline);
          curline.attr("x1",curline.attr("x2")/1);
     } 
      curline.attr("y2",data.getAttribute("y")/1+data.getAttribute("height")/1-0.1);
      linecircle1.attr("cx",data.getAttribute("x")/1+data.getAttribute("width")/2-0.1).attr("cy",data.getAttribute("y")/1+data.getAttribute("height")/1-0.1);
    }
    
  });
}
 //给直线添加圆点
function addlinecircle(line){
    svg.append("circle")
			.attr("cx",line.attr("x1"))
			.attr("cy",line.attr("y1"))
			.attr("r",5).attr("stroke","blue")
			.attr("fill","white")
			.call(draglinelong);
	svg.append("circle")
			.attr("cx",line.attr("x2"))
			.attr("cy",line.attr("y2"))
			.attr("r",4).attr("stroke","black")
			.attr("fill","black")
			.call(draglinelongend);
}

//通过拖拽直线开始圆点标记改变直线的长度
var draglinelong=d3.behavior.drag().on("dragstart",findcurline).on("drag",changelinelong).on("dragend",draglinecircle);
//通过拖拽直线结束圆点标记改变直线的长度
var draglinelongend=d3.behavior.drag().on("dragstart",findcurlineend).on("drag",changelinelong1).on("dragend",draglinecircleend);
var curline;
//根据直线开始端圆点获取当前的直线
function findcurline(){
 curline=null;
 curline=$("line[x1='"+d3.select(this).attr("cx")+"'][y1='"+d3.select(this).attr("cy")+"']");
}
//根据直线结束端圆点获取当前的直线
function findcurlineend(){
 curline=null;
 curline=$("line[x2='"+d3.select(this).attr("cx")+"'][y2='"+d3.select(this).attr("cy")+"']");
}
//通过拖拽直线开始端圆点改变直线的长度
function changelinelong(){
    d3.select(this).attr("cx",d3.event.x).attr("cy",d3.event.y);
    curline.attr("x1",d3.event.x).attr("y1",d3.event.y);
 }
 //通过拖拽直线结束端圆点改变直线的长度
function changelinelong1(){
    d3.select(this).attr("cx",d3.event.x).attr("cy",d3.event.y);
    curline.attr("x2",d3.event.x).attr("y2",d3.event.y);
 }
 //改变完长度后执行的方法
 function draglinecircle(){
 if(curline!=null){
  linkcirrect(curline);
 }
 }
 function draglinecircleend(){
 if(curline!=null){
 linkcirrectend(curline);
 }
 }
var line = svg.append("line")
			 .attr("x1",200)
			 .attr("y1",75)
			 .attr("x2",400)
			 .attr("y2",75)
			 .attr("stroke","red")
			 .attr("stroke-width",5)
			 .attr("marker-end","url(#arrow)").attr("class","linestart")
			 .call(dragline);
			 
			 

</script>
  
  </body></html>
