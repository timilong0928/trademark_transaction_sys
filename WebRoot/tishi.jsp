<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<s:property value="content" escapeHtml="false" />
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>提示</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="牧人">
	<meta http-equiv="description" content="牧人">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
	<link href="<%=path%>/css/pintuer.css" rel="stylesheet">
	<link href="<%=path%>/style/index.css" rel="stylesheet">
	<script src="<%=path%>/js/jquery.js"></script>
	<script src="<%=path%>/js/pintuer.js"></script>
	<script src="<%=path%>/js/main.js"></script>
	<script src="<%=path%>/js/diqu2.js"></script>
  </head>
  
  <body style="background-image: url(<%=path %>/images/注册bg-.png);background-repeat:no-repeat;background-size:100%; background-color:#124081;">
  	<div>
  		
  		<div  style="width:80%;margin:200px 10% 0;">
			<div  class="bg radius" style="width: 100%;text-align: center;height: 35px;background-color: #27CCf9;color: white;padding-top: 6px;font-size: 15px;">${msg}</div>
  		</div>
  		<s:if test="team.tishi!=null">
	  		<div  style="width:80%;margin:20px 10% 0;">
				<a href="index!tishi.action"><div  class="bg radius"  style="width: 100%;text-align: center;height: 35px;background-color: #27CCf9;color: white;padding-top: 6px;font-size: 15px;">我已知道</div>
	  		</a></div>
  		</s:if>
  	</div>
  
	</body>
</html>
