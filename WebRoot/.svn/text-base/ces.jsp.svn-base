<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>帮扶教育</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="洛奇教育">
	<meta http-equiv="description" content="洛奇教育">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
	<link href="<%=path%>/css/pintuer.css" rel="stylesheet">
	<link href="<%=path%>/css/swiper.min.css" rel="stylesheet">
	<script src="<%=path%>/js/jquery.js"></script>
	<script src="<%=path%>/js/pintuer.js"></script>
	<script src="<%=path%>/js/swiper.min.js"></script>
	<script src="<%=path%>/js/main.js"></script>
  	<SCRIPT type="text/javascript">
		var a = 1;
		function shang(){
			$(".bb").css("display","none");
			a = a-1;
			$("#aa"+a).css("display","");
			if(a==1){
				$("#shangyizhang").css("display","none");
				$("#shangyizhang2").css("display","");
			}
			$("#xiayizhang").css("display","");
			$("#xiayizhang2").css("display","none");
			window.scroll(0,0);
		}
		function xia(){
			$(".bb").css("display","none");
			a = a+1;
			$("#aa"+a).css("display","");
			
			if(a==8){
				$("#xiayizhang").css("display","none");
				$("#xiayizhang2").css("display","");
			}
			$("#shangyizhang").css("display","");
			$("#shangyizhang2").css("display","none");
			window.scroll(0,0);
		}
  	</SCRIPT>
  	<style type="text/css">
  	img{
  		width: 100%;
  	}
  	
  	</style>
  <body style="">
  		
		<div id="firstAnchor" style="width: 100%;height: 0px;"></div>
		<img  class="bb" id="aa1" alt="" src="<%=path%>/l/1.jpg" style="width: 100%; ">
		<img  class="bb" id="aa2" alt="" src="<%=path%>/l/2.jpg" style="display: none;width: 100%;">
		<img  class="bb" id="aa3" alt="" src="<%=path%>/l/3.jpg" style="display: none;width: 100%;">
		<img  class="bb" id="aa4" alt="" src="<%=path%>/l/4.jpg" style="display: none;width: 100%;">
		<img  class="bb" id="aa5" alt="" src="<%=path%>/l/5.jpg" style="display: none;width: 100%;">
		<img  class="bb" id="aa6" alt="" src="<%=path%>/l/6.jpg" style="display: none;width: 100%;">
		<img  class="bb" id="aa7" alt="" src="<%=path%>/l/7.jpg" style="display: none;width: 100%;">
		<img  class="bb" id="aa8" alt="" src="<%=path%>/l/8.jpg" style="display: none;width: 100%;">
		
		
		<div style="width: 100%;height: 50px;"></div>
			<div style="width: 100%;height: 50px;background-color: white; position:fixed;bottom:0;z-index:3;">
					
					<div id="shangyizhang" onclick="shang();"  style="width: 49%;height: 50px;float: left;background-color: #f08a78;text-align: center;font-size: 20px;padding: 13px 0; color:white;display: none;">
						上一张
					</div>
					<div id="shangyizhang2" style="width: 49%;height: 50px;float: left;background-color: #aaaaaa;text-align: center;font-size: 20px;padding: 13px 0; color:white;">
						上一张
					</div>
					<div id="xiayizhang" onclick="xia();"  style="width: 50%;height: 50px;float: right;background-color:#f08a78;text-align: center;font-size: 20px;padding: 13px 0; color:white;">
						下一张
					</div>
					<div id="xiayizhang2"  style="width: 50%;height: 50px;float: right;background-color:#aaaaaa;text-align: center;font-size: 20px;padding: 13px 0; color:white;display: none;">
						下一张
					</div>
			</div>
		
	</body>
</html>
