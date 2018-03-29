<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="/struts-tags" prefix="s" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page import="pojo.Admin" %>
<% 
Admin admin=(Admin)session.getAttribute("admin");
if(admin==null){
response.sendRedirect(request.getContextPath()+"/admin/login.jsp");
}
%>


<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="renderer" content="webkit">
    <title>后台管理</title>
    <link rel="stylesheet" href="../css/pintuer.css">
    <link rel="stylesheet" href="../css/admin.css">
    <script src="../js/jquery.js"></script>
    <script src="../js/pintuer.js"></script>
    <script src="../js/respond.js"></script>
    <script src="../js/admin.js"></script>
   
</head>

<body>
<%@ include file="/admin/topmenu.jsp" %>
<script type="text/javascript">showwhere("ordertop",0,"订单详情")</script>
		<div class="admin">
			<div class="panel admin-panel">
				<div class="panel-head">
					<div class="line-middle">
						<div class="x3">
							<strong>订单号：</strong>${order2.oid}
						</div>
						<div class="x4">
							<strong>订单类型：</strong>
							<s:if test="order2.type==0">普通课程</s:if>
							<s:if test="order2.type==1">套餐课程</s:if>
							<s:if test="order2.type==2"><span style="color:red;">活动报名</span></s:if>
							
							<s:if test="order2.fhStatus==0">（未付款）</s:if>
							<s:if test="order2.fhStatus==1">（已付款）</s:if>
						</div>

						<div class="x3" >
							<strong style="margin-left: 50px;">总价：</strong>
							<s:if test="order2.price==0||order2.price==''">
								${order2.point}积分
							</s:if><s:elseif test="order2.point==0||order2.point==''">
								${order2.price}元
							</s:elseif><s:else>
								${order2.price}元+${order2.point}积分
							</s:else>
						</div>
						
					</div>
				</div>

				<table class="table table-hover">
					<s:if test="order2.type==2">
						<tr onclick="location='banner!findhdall.action'">
							<td width="200">
								<img height="70" width="70" src="<%=path%>/${banner.img}"  />
							</td>
							<td width="300">
								${banner.hdtitle}
							</td>
							<td width="200">
								价格: ${banner.hdMoney}元
							</td>
						</tr>
					
					</s:if><s:elseif test="order2.type==1">
						<tr style="color:red;" onclick="location='<%=path %>/admin/course/course!thetaocan.action?taocan.id=${taocan.id}'">
							<td width="200">
								<img height="70" width="70" src="<%=path%>/${taocan.img}"  />
							</td>
							<td width="300">
								${taocan.name}
							</td>
							<td width="200">
								价格: ${taocan.money}元
							</td>
							<td width="200">
								<div style=""  class="button button-small border-yellow">查看详情</div>
							</td>
						</tr>
						
						<tr >
							<td width="200">
								
							</td>
							<td width="300">
								
							</td>
							<td width="200">
								
							</td>
							<td width="200">
								
							</td>
						</tr>
					</s:elseif>
					
						<s:iterator value="courses">
							<tr onclick="location='<%=path %>/admin/course/course!toCourse.action?course.id=${id}'">
								<td width="200">
									<img height="70" width="70" src="<%=path%>/${img}"  />
								</td>
								<td width="300">
									${title}
								</td>
								<td width="200">
									价格: ${money}元
								</td>
								<td width="200">
									评分: 
									<s:if test="collectid>0">
										${collectid}
									</s:if><s:else>
										未评分
									</s:else>
									
								</td>
							</tr>
						</s:iterator>
					
				</table>
				<table class="table">
					<tr>
						<td style="width: 15%">
							<strong>姓 &nbsp; &nbsp; &nbsp; 名：</strong>
						</td>
						<td>
							<div style="" onclick="location='<%= path %>/admin/user/team!toUser.action?team.id=${order2.teamId}'" class="button button-small border-yellow">${order2.name}</div>
						</td>
					</tr>
					<tr>
						<td>
							<strong>电 &nbsp; &nbsp; &nbsp; 话：</strong>
						</td>
						<td>
							${order2.phone}
						</td>
					</tr>
					<tr>
						<td>
							<strong>下单时间：</strong>
						</td>
						<td>
							${order2.time}
						</td>
					</tr>
				</table>
		</div>
	</div>
</body>
</html>