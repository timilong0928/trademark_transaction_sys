<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML >
<html>
	<head>
		<base href="<%=basePath%>">

		<title>兑换订单详情</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<meta name="viewport"
			content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
		<link rel="stylesheet"
			href="<%=request.getContextPath()%>/admin/css/pintuer.css">
		<script src="<%=request.getContextPath()%>/admin/js/jquery.js"></script>
		<script src="<%=request.getContextPath()%>/admin/js/pintuer.js"></script>
	</head>

	<body style=" background-color: #f5f5f5;">
	<!-- 订单信息 -->
			<div style=" margin:10px auto 0; width:95%;background-color: white; font-size: 13px;"  >
				<div><img height="20" width="20" src="<%=request.getContextPath()%>/image/我的订单.png" style="float: left;margin: 15px 4px 8px 7px;" />
					<div  style="float: left;margin: 15px 4px 8px 5px; color: black;" >订单信息</div></div>
					<div style="background:#eeeeee;clear:both;width:100%;height:2px;"></div>
					
				<div style="margin: 15px; color: #555555; "> <div  style="float: left;margin: 0 30px 7px 0; color: black;" >订单号&nbsp;&nbsp;&nbsp;</div>${order3.oid}
					</div><div style="background:#dddddd;clear:both;width:91%;height:1px; margin: 0 auto;"></div>
				<s:if test="order3.status!=0">
				<div style="margin: 15px; color: #555555; "> <div  style="float: left;margin: 0 30px 7px 0; color: black;" >付款时间</div>${order3.time}
					</div>
					<div style="background:#dddddd;clear:both;width:91%;height:2px; margin: 0 auto;"></div>
				</s:if>
					
				<div style="margin: 15px; color: #555555; "> <div  style="float: left;margin: 0 30px 15px 0; color: black;" >订单状态</div>
						<s:if test="order3.Status==0">待付款</s:if>
					<s:elseif test="order3.Status==1">待发货</s:elseif>
					<s:elseif test="order3.Status==2">待收货</s:elseif>
					<s:elseif test="order3.Status==2">已完成</s:elseif>
	
					<div style="clear:both;width:100%;height:2px;"></div></div>
			</div>
			
	<!-- 配送信息 -->
			<div style=" margin:0px auto; width:95%;background-color: white; font-size: 13px;"  >
				<div><img height="20" width="20" src="<%=request.getContextPath()%>/image/我的订单.png" style="float: left;margin: 15px 4px 8px 7px;" />
					<div  style="float: left;margin: 15px 4px 6px 5px; color: black;" >配送信息</div></div>
					<div style="background:#eeeeee;clear:both;width:100%;height:2px;"></div>
					
				<div style="margin: 15px; color: #555555; "> <div  style="float: left;margin: 0 30px 15px 0; color: black;" >收货人&nbsp;&nbsp;&nbsp;</div>${order3.name}
					<div style="background:#eeeeee;clear:both;width:100%;height:2px;"></div></div>
					
				<div style="margin: 15px; color: #555555; "> <div  style="float: left;margin: 0 30px 15px 0; color: black;" >联系电话</div>${order3.phone}
					<div style="background:#eeeeee;clear:both;width:100%;height:2px;"></div></div>
					
				<div style="margin: 15px; color: #555555; "> <div  style="float: left;margin: 0 30px 15px 0; color: black;" >收货地址</div>${order3.province}${order3.city}${order3.area}${order3.address}
					<div style="background:#eeeeee;clear:both;width:100%;height:2px;"></div></div>
			
			<!-- 商品信息 -->
			<div style=" margin:0 auto 40px; width:95%;background-color: white; font-size: 13px;"  >
				<div><img height="20" width="20" src="<%=request.getContextPath()%>/image/我的订单.png" style="float: left;margin: 15px 4px 8px 7px;" />
					<div  style="float: left;margin: 15px 4px 6px 5px; color: black;" >商品信息</div></div>
					<div style="background:#eeeeee;clear:both;width:100%;height:2px;"></div>
					
						<div style="margin: 15px; color: #555555; width: 90%; height: 70px; "> 
						<div  style="float: left;margin: 0 0 7px 0; color: black; width: 20%;" >
							<a href="product2!theproduct2.action?product.id=${order3.pid}">
								<img height="60" width="60" src="<%=path%>/${order3.img}"  />
							</a>
						</div>
						<div style="float: right;width: 70% ;">
							<div style="float: left; margin-left: -15px;"> <div>${order3.title }</div><div>x${order3.num}</div> </div> 
							<div style="float: right; margin: 20px 0 0px 0; color: black;">${order3.price} 积分</div>
						</div>
						</div>
					
						<div style="float: left;background:#eeeeee;clear:both;width:90%;height:2px; margin-top: -10px; margin-bottom: 10px; margin-left: 5%;"></div>
			
						<div style="background-color: white;height: 40px;width: 100%;">
						<div style="float: left;background:#eeeeee;clear:both;width:100%;height:2px; margin-top: -12px;"></div>
						<div style="float: right; margin-right: 7%;"><div style=" margin: 0 0 0 16px;  font-size:14px;"></div>
						<div style=" margin: 0 0 5px 0; font-size: 14px;">总计：<div style="color: red; float: right; ">${order3.allprice} 积分</div></div>
						</div>
						</div>		
				
			</div>
	</body>
</html>
