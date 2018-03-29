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
	<SCRIPT type="text/javascript">showwhere("sbtop",1)</SCRIPT>

		<div class="admin">
		
			<div class="panel">
				<div class="panel-head">
					<div class="line-big">
						<div class="x6"><strong>商标详情</strong></div>
					</div>
				</div>
				<div class="panel-body">

					<div class="media" style="text-align:center;margin-bottom:10px">
						
						<img height="150" width="150" src="<%=path%>/${sb.img}" />
						

						<div class="media-body">
							<strong>主图</strong>
						</div>
						
						
				    </div>

					<table class="table">
					    
						<tr>
							<td style="width: 15%;"><strong>标&nbsp; &nbsp; &nbsp; &nbsp;题：</strong></td>
							<td>${sb.title}</td>
						</tr>
						
						<tr>
							<td style="width: 15%;"><strong>编&nbsp; &nbsp; &nbsp; &nbsp;码：</strong></td>
							<td>${sb.biaohao}</td>
						</tr>
						
						<tr>
							<td style="width: 15%;"><strong>价&nbsp; &nbsp; &nbsp; &nbsp;格：</strong></td>
							<td>${sb.price}</td>
						</tr>
						
						<tr>
							<td style="width: 15%;"><strong>分&nbsp; &nbsp; &nbsp; &nbsp;类：</strong></td>
							<td>${sb.fenleiname}</td>
						</tr>
						
						<tr>
							<td style="width: 15%;"><strong>专用期限：</strong></td>
							<td>${sb.time}</td>
						</tr>
						
						<tr>
							<td style="width: 15%;"><strong>商标分类：</strong></td>
							<td>${sb.leixing}</td>
						</tr>
						
						<tr>
							<td style="width: 15%;"><strong>商标群组：</strong></td>
							<td>${sb.qunzu}</td>
						</tr>
						
						<tr>
							<td style="width: 15%;"><strong>服务项目：</strong></td>
							<td style="width: 50%">${sb.jieshao}</td>
						</tr>
						
						
					</table>
					
					
				</div>
				
			</div>

		</div>

	</body>

</html>