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
		<link rel="stylesheet" href="<%=path%>/admin/css/pintuer.css">
		<link rel="stylesheet" href="<%=path%>/admin/css/admin.css">
		<script src="<%=path%>/admin/js/jquery.js"></script>
		<script src="<%=path%>/admin/js/pintuer.js"></script>
		<script src="<%=path%>/admin/js/respond.js"></script>
		<script src="<%=path%>/admin/js/admin.js"></script>
		<style type="text/css">
			table{
			}
			table img{
				width: 20%;
			}
			table td{
				width: 30%;
			}
		</style>
	</head>

	<body>

		<%@ include file="/admin/topmenu.jsp" %>
		<SCRIPT type="text/javascript">
			showwhere("shezhitop", 2, "管理员详情")
		</SCRIPT>
		<div class="admin">

			<div class="panel">
				<div class="panel-head">
					<div class="line-big">
						<div class="x6"><strong>管理员详情</strong></div>
					</div>
				</div>
				<div class="panel-body">

					<div class="media" style="text-align:center;">

						<img src="<%=path%>/${admin.img}" width="80px" height="80px" class="radius-circle" alt="...">

						<div class="media-body">
							<strong>头像</strong>
						</div>

					</div>

					<table class="table">
						
						<tr>
							<td style="width: 15%;"><strong>账号</strong></td>
							<td style="width: 85%;">${admin.name}</td>
						</tr>
						
						<tr>
							<td><strong>真实姓名：</strong></td>
							<td>${admin.rname}</td>
						</tr>
					
						<tr>
							<td><strong>电话：</strong></td>
							<td>${admin.phone}</td>
						</tr>
						<tr>
							<td><strong>密码：</strong></td>
							<td>${admin.password}</td>
						</tr>
						<tr>
							<td><strong>权限：</strong></td>
							<td>
								<s:if test="admin.quanxian=='teacher'">
									讲师 
	        					</s:if>
							</td>
						</tr>
						<tr>
							<td><strong>个性签名：</strong></td>
							<td>${admin.qianming}</td>
						</tr>
						
						
						
					</table>
					
				</div>
			</div>

		</div>

	</body>

</html>