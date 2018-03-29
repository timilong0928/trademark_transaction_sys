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
			showwhere("yewutop", 0, "业务详情")
		</SCRIPT>
		<div class="admin">
		
			<div class="panel">
				<div class="panel-head">
					<div class="line-big">
						<div class="x6"><strong>会员详情</strong></div>
					</div>
				</div>
				<div class="panel-body">

				<div class="media" style="text-align:center;margin-bottom:10px">
						
						<img height="100" width="100" src="<%=path%>/${yewu.img}" />
						

						<div class="media-body">
							<strong>主图</strong>
						</div>
						
						
				    </div>

					<table class="table">
					    <tr>
							<td><strong>上传时间：</strong></td>
							<td>${yewu.uptime}</td>
						</tr>
						<tr>
							<td style="width: 15%;"><strong>标&nbsp; &nbsp; &nbsp; &nbsp;题：</strong></td>
							<td>${yewu.biaoti}</td>
						</tr>
						<tr>
							<td><strong>业务 &nbsp; &nbsp;价格：</strong></td>
							<td>${yewu.price}</td>
						</tr>
						<tr>
							<td><strong>业务小项价格：</strong></td>
							<td>${yewu.xiaoxiang}</td>
						</tr>
						
						
						<tr>
							<td><strong>销售量：</strong></td>
							<td>${yewu.xiaoshounum}</td>
						</tr>
						
						<tr>
							<td><strong>简介：</strong></td>
							<td>${yewu.jianjie}</td>
						</tr>
						
						<tr>
							<td><strong>图片详情：</strong></td>
							<td>
								<s:iterator var="array" value="#request.imgs">
				    				<img alt="..." src="<%=path%>/<s:property value="array"/>"  style="margin-top: 10px">
				   				 </s:iterator>
							</td>
						</tr>
						
						
					</table>
				</div>
				
			</div>

		</div>

	</body>

</html>