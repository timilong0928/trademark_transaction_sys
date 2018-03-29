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
		<style type="text/css">
			table{
			}
			table img{
				width: 20%;
			}
		</style>
		
	</head>
	
	
	<body>

		<%@ include file="/admin/topmenu.jsp" %>
		<SCRIPT type="text/javascript">
			showwhere("coursetop", 2, "讲师详情")
		</SCRIPT>
		<div class="admin">
		<input type="hidden" id="teacherid" value="${teacher.id}" />
			<div class="panel">
				<div class="panel-head">
					<div class="line-big">
						<div class="x6"><strong>讲师详情</strong></div>
					</div>
				</div>
				<div class="panel-body">

					<div class="media" style="text-align:center;">
									<s:if test="teacher.img.substring(0,4)=='http'">
										<img height="70" width="70" src="${teacher.img}" />
									</s:if>
									<s:else>
										<img height="70" width="70" src="<%=path%>/${teacher.img}" />
									</s:else>

						<div class="media-body">
							<strong>照片</strong>
						</div>

					</div>

					<table class="table">
						<tr >
							<td style="width: 15%;"><strong>讲师姓名：</strong></td>
							<td>${teacher.name}</td>
						</tr>
						
						<tr>
							<td><strong>讲师排序：</strong></td>
							<td>${teacher.seq}</td>
						</tr>
						
						<tr>
							<td><strong>讲师简介：</strong></td>
							<td>${teacher.detail}</td>
						</tr>
						
						<tr>
							<td><strong>讲师介绍：</strong></td>
							<td>${teacher.intro}</td>
						</tr>
						
					</table>
				</div>
			</div>

		</div>

	</body>

</html>