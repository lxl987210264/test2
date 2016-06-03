<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.awt.Color,  
                org.jfree.chart.ChartFactory,  
                org.jfree.chart.JFreeChart,  
                org.jfree.chart.plot.PlotOrientation,  
                org.jfree.chart.servlet.ServletUtilities,  
                org.jfree.data.category.CategoryDataset,  
                org.jfree.data.general.*,  
                org.jfree.chart.plot.CategoryPlot,  
                org.jfree.chart.axis.CategoryAxis,  
                org.jfree.chart.axis.ValueAxis,  
                org.jfree.chart.renderer.category.BarRenderer3D,  
                org.jfree.chart.urls.StandardCategoryURLGenerator,  
                org.jfree.chart.*,  
                org.jfree.chart.entity.*,  
                org.jfree.chart.labels.*,  
                org.jfree.chart.axis.CategoryLabelPositions,  
                java.awt.Font,  
                java.awt.GradientPaint,  
                org.jfree.ui.TextAnchor,  
                org.jfree.chart.axis.NumberAxis,  
                org.jfree.chart.axis.NumberTickUnit                  
                "%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	 <script src="http://ditu.google.com/maps?file=api&hl=zh-CN&v=2&key=abcdefg" type="text/javascript"></script>
  </head>
    <script type="text/javascript">
    
    </script>
  
  <%  
java.io.PrintWriter pw=new java.io.PrintWriter(out);  
double[][] data = new double[][] {{500}, {200}, {-100}, {400}, {-600}, {300}};  
String[] rowKeys = {"西红柿", "梨子", "橙子", "桔子", "西瓜", "香蕉"};  
String[] columnKeys = {""};  
CategoryDataset dataset = DatasetUtilities.createCategoryDataset(  
        rowKeys,  
        columnKeys,  
        data);  
  
  
JFreeChart chart = ChartFactory.createBarChart3D("水果生产图统计",  
                  "水果名称", //横坐标名称  
                  "产量", //纵坐标名称  
                  dataset,//数据集合  
                  PlotOrientation.VERTICAL,//图形位置，水平还是垂直  
                  true,  
                  false,  
                  false);  
  
       chart.setBackgroundPaint(Color.WHITE);     
       //设定背景色为白色  
         
       CategoryPlot categoryPlot = chart.getCategoryPlot();   
       //获得 plot：3dBar为CategoryPlot  
         
       categoryPlot.setBackgroundPaint(Color.lightGray);   
       //设定图表数据显示部分背景色  
         
       categoryPlot.setDomainGridlinePaint(Color.white);   
       //横坐标网格线白色  
       categoryPlot.setDomainGridlinesVisible(true);   
       //设置网格线可见  
         
       categoryPlot.setRangeGridlinePaint(Color.white);   
       //纵坐标网格线白色  
       
       //获取横坐标  
       CategoryAxis domainAxis = categoryPlot.getDomainAxis();  
         
       //设置 横坐标 垂直显示  
       //domainAxis.setCategoryLabelPositions(CategoryLabelPositions.createUpRotationLabelPositions(0.4));  
         
       //获取纵坐标  
       NumberAxis numberaxis = (NumberAxis)categoryPlot.getRangeAxis();   
       //将纵坐标间距设置为50   
       numberaxis.setTickUnit(new NumberTickUnit(50));  
       //设置横坐标的标题字体和大小,此处是“宋体13号”  
       domainAxis.setLabelFont(new Font("宋体",Font.PLAIN,13));  
         
       //设置距离图片左端距离,参数为图片的百分比  
       domainAxis.setLowerMargin(0.05);  
         
       //设置距离图片右端距离  
       domainAxis.setUpperMargin(0.05);  
             
       //设置横坐标的坐标值的字体  
       domainAxis.setTickLabelFont(new Font("宋体",Font.PLAIN,12));  
       //使横坐标设置生效  
       categoryPlot.setDomainAxis(domainAxis);   
              
       ValueAxis rangeAxis = categoryPlot.getRangeAxis();  
       //设置最高的一个柱与图片顶端的距离  
       rangeAxis.setUpperMargin(0.05);  
         
       //设置最低的一个柱与图片底端的距离  
       rangeAxis.setLowerMargin(0.05);  
       categoryPlot.setRangeAxis(rangeAxis);   
         
       //设置竖坐标标签的旋转角度  
       rangeAxis.setLabelAngle(0.05);  
         
  
       //重要的类，负责生成各种效果  
       BarRenderer3D renderer=(BarRenderer3D) categoryPlot.getRenderer();  
         
  
       //设置 Wall 的颜色  
       renderer.setWallPaint(Color.PINK);  
         
       //设置每个柱的颜色       
       GradientPaint gradientpaint = new GradientPaint(0.0F, 0.0F, Color.blue,  
                0.0F, 0.0F, new Color(0, 0, 64)); //设定特定颜色  
       GradientPaint gradientpaint1 = new GradientPaint(0.0F, 0.0F, Color.green,  
           0.0F, 0.0F, new Color(0, 64, 0));  
  
       renderer.setSeriesPaint(0, gradientpaint);  
       renderer.setSeriesPaint(1, gradientpaint1);  
         
       //设置柱的 Outline 颜色  
       renderer.setSeriesOutlinePaint(0, Color.BLACK);  
       renderer.setSeriesOutlinePaint(1, Color.BLACK);  
       //设置每个category所包含的平行柱的之间距离  
       renderer.setItemMargin(0.1);  
      
       //显示每个柱的数值，并修改该数值的字体属性  
       renderer.setItemLabelGenerator(new StandardCategoryItemLabelGenerator());  
  
  
        //以下设置，将按照指定格式，制定内容显示每个柱的数值。可以显示柱名称，所占百分比  
       //renderer.setBaseItemLabelGenerator(new StandardCategoryItemLabelGenerator("{2}",new DecimalFormat("0.0%")));      
  
  
       //设置柱子上数值的字体  
       renderer.setItemLabelFont(new Font("宋体",Font.PLAIN,13));   
       renderer.setItemLabelsVisible(true);  
       
       //设置柱子上数据的颜色  
       renderer.setItemLabelPaint(Color.RED);  
         
       //设置bar的最小宽度，以保证能显示数值  
       renderer.setMinimumBarLength(0.02);  
         
       //最大宽度  
       //renderer.setMaximumBarWidth(0.07);  
         
       //设置柱子上比例数值的显示，如果按照默认方式显示，数值为方向正常显示  
       //设置柱子上显示的数据旋转90度,最后一个参数为旋转的角度值/3.14  
         ItemLabelPosition itemLabelPosition= new ItemLabelPosition(  
         ItemLabelAnchor.INSIDE12,TextAnchor.CENTER_RIGHT,  
         TextAnchor.CENTER_RIGHT,-1.57D);  
         
       //下面的设置是为了解决，当柱子的比例过小，而导致表示该柱子比例的数值无法显示的问题  
       //设置不能在柱子上正常显示的那些数值的显示方式，将这些数值显示在柱子外面  
         ItemLabelPosition itemLabelPositionFallback=new ItemLabelPosition(  
         ItemLabelAnchor.OUTSIDE12,TextAnchor.BASELINE_LEFT,  
         TextAnchor.HALF_ASCENT_LEFT,-1.57D);  
         
       //设置正常显示的柱子label的position  
       renderer.setPositiveItemLabelPosition(itemLabelPosition);  
       renderer.setNegativeItemLabelPosition(itemLabelPosition);  
         
       //设置不能正常显示的柱子label的position  
       renderer.setPositiveItemLabelPositionFallback(itemLabelPositionFallback);  
       renderer.setNegativeItemLabelPositionFallback(itemLabelPositionFallback);  
         
       categoryPlot.setRenderer(renderer);  
       //设置柱子的透明度  
       categoryPlot.setForegroundAlpha(0.8f);  
         
  
  
         //为柱图设置“数据挖陷”  
         //第一个参数是跳转的连接地址  
         renderer.setBaseItemURLGenerator(new StandardCategoryURLGenerator(  
        "detail.jsp", "fruit", ""));  
  
  
        //使设置生效  
         renderer.setBaseItemLabelsVisible(true);  
        //设置柱的透明度  
         categoryPlot.setForegroundAlpha(0.5f);  
        //设置地区、销量的显示位置  
         //plot.setRangeAxisLocation(AxisLocation.BOTTOM_OR_RIGHT);  
         ChartRenderingInfo info = new ChartRenderingInfo(new StandardEntityCollection());  
  
         //生成图形的名称  
         //可以改变ServletUtilities源代码，设置图形统一前缀名称和默认存放路径  
         //注意：图形的大小往往都是通过配置文件设置的，不可能所有图形一个大小  
         String filename = ServletUtilities.saveChartAsPNG(chart, 800, 600, info, session);  
         //调用DisplayChart（配置在webxml中），生成图形  
         String graphURL = request.getContextPath() + "/servlet/DisplayChart?filename=" + filename;  
         //将MAP信息，写入图形  
         ChartUtilities.writeImageMap(pw, filename, info, true);  
         pw.flush();  
%>  
  
<table width="100%">  
    <tr>  
        <td align="center">  
            <!-- 生成图形 -->  
            <img src="<%= graphURL %>" width=800 height=700 border=0 usemap="#<%= filename %>" alt="">  
        </td>  
        
    </tr>  
</table>  
  </body>
</html>
