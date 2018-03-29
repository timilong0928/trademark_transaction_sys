<%@ page language="java" import="java.util.*,pojo.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>  

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>洛奇教育</title>
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
	<style type="text/css">
		
		.mainbody>div{
			background-color: white;
		}
		.partzero img{
			width: 100%;
		}
	</style>
	<SCRIPT type="text/javascript">
		function xuanze(name){
				$("#huodong").css("display","none");
				$("#huodong1").css("color","black");
				$("#huodong1").css("border-bottom-color","white");
				
				$("#mianfei").css("display","none");
				$("#mianfei1").css("color","black");
				$("#mianfei1").css("border-bottom-color","white");
				
				$("#fufei").css("display","none");
				$("#fufei1").css("color","black");
				$("#fufei1").css("border-bottom-color","white");
				
				$("#"+name).css("display","");
				$("#"+name+"1").css("color","#ef8201");
				$("#"+name+"1").css("border-bottom-color","#ef8201");
			}
		
		  
	</SCRIPT>
	
	
  </head>
  
  <body >
		
	
	</body>
</html>
