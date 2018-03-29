<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML >
<html>
	<head>
		<base href="<%=basePath%>">
		<title>
		我的团队
		</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<meta name="viewport"
			content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
		<link rel="stylesheet" href="<%=path%>/css/pintuer.css">
		<link rel="stylesheet" href="<%=path%>/css/main.css">
		<link rel="stylesheet" href="<%=path%>/css/office.css">
		<link rel="stylesheet" href="style/index.css" />
		<link rel="stylesheet" href="style/common.css" />
		<link rel="stylesheet" href="style/swiper.min.css" />
		<link rel="stylesheet" href="style/sp.css" />
		<script src="<%=path%>/js/jquery.js"></script>
		<script src="<%=path%>/js/pintuer.js"></script>
		<script type="text/javascript">
			$(function(){
				$(".navbt").removeClass("act");
				$(".nav2").addClass("act");
				
			});
		</script>
		
		</head>

	<body>
		
  		
  		
	
    	<div style="width: 100%;height: 100%;background-color: #F1F1F1">
    	
    	<s:iterator value="allyiji"> 
 		<!-- 内容 -->
        <div class="order" style="background-color: white;height: 100px">
			
				        <div  style="margin-top: 23px;margin-left: 10px;position:absolute;"><img src="<s:property value="img"/>" width="55" height="55"></img></div> 
				        <div  style="margin-top: 25px;font-size:14px;margin-left: 80px;position:absolute;"><s:property value="nickName"/></div> 
				        <div  style="margin-top: 53px;font-size:12px;margin-left: 80px;color: #999999;position:absolute;">累计佣金：<s:property value="allyongjin"/> </div>
				        
		</div>	
	   	<div style="border: 1px solid #F1F1F1; "></div>
	   	</s:iterator>
	   
	   
	   
	   	<div style=" width: auto;height: 80px;text-align: center;font-size: 12px;background-color: #F1F1F1;padding-top: 20px;color: #ACACAC" >没有更多记录~</div>
     	</div>
   	   
	</body>
</html>
