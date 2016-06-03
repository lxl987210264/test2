<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.xmgk.action.FangwenServlet" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'fangwenliang.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script type="text/javascript" src="js/jquery-1.11.1.js"></script>

  </head>
  <script type="text/javascript">
  window.onbeforeunload = onbeforeunload_handler;   
    window.onunload = onunload_handler;   
    function onbeforeunload_handler(){   
        var warning="确认退出?";           
        return warning;   
    }   
       
    function onunload_handler(){   
        var warning="谢谢光临";   
        alert(warning);   
    }  
    $.ready
  </script>
  <body >
  <%
    FangwenServlet CountFileHandler=new FangwenServlet();//创建对象
    int count=0;
    if(application.getAttribute("count")==null){
    count=CountFileHandler.readFile(request.getRealPath("/")+"count.txt");//读取文件获取数据赋给count
    application.setAttribute("count",new Integer(count));
  }
  count=(Integer)application.getAttribute("count");
  if(session.isNew()) ++count;
  application.setAttribute("count",count);
  
  CountFileHandler.writeFile(request.getRealPath("/")+"count.txt",
count);//更新文件记录
System.out.println(application.getAttribute("count"));
%>
    <a href="fangwenliang.jsp">lianjie</a> <br>
  </body>
</html>
