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
		<script src="../js/admin.js"></script>
		<style type="text/css">
		</style>
	</head>

	<body>

		<%@ include file="/admin/topmenu.jsp" %>
		<SCRIPT type="text/javascript">
			showwhere("coursetop", 0)
		</SCRIPT>
		<div class="admin">

			<div class="panel">
				<div class="panel-head">
					<div class="line-big">
						<div class="x6"><strong>课程详情</strong></div>
					</div>
				</div>
				<div class="panel-body">
					<div class="media" style="text-align:center; ">
							<div style="float: left; margin: 5px 30px 5px 5px;" >
								<div><img src="<%=path%>/${course.img}" width="80px" height="80px"></div>
								<div class="media-body">
									<strong>封面 </strong>
								</div>
							</div>
					</div>	

					<table class="table">
						<tr>
							<td style="width: 15%;"><strong>课&nbsp;程 &nbsp;名：</strong></td>
							<td>${course.title}</td>
						</tr>
						
						<tr>
							<td><strong>分 &nbsp; &nbsp; &nbsp;类：</strong></td>
							<td>
								${classify2.name}<img src="<%=path%>/${classify2.img}" width="50px">
							</td>
						</tr>
						
						<tr>
							<td><strong>状 &nbsp; &nbsp; &nbsp;态：</strong></td>
							<td>
								<s:if test="course.status==0">
									普通课程
								</s:if>
								<s:if test="course.status==1">
									活动课程
								</s:if>
								<s:if test="course.status==2">
									下架课程
								</s:if>
							</td>
						</tr>
						<tr>
								<td>
									<strong>讲 &nbsp; &nbsp; &nbsp;师：</strong>
								</td>
								<td>
									${course.teacher}
								</td>
						</tr>
						
						<tr>
							<td><strong>课 &nbsp; &nbsp; &nbsp;时：</strong></td>
							<td>
								<span style="width: auto;float: left;">${course.period}节：</span>
								<s:iterator value="contents">
									<a target="_blank" href="<%=basePath %><s:property value="content1" />">
										<div style="width: auto;float: left;padding:3px 10px;background-color: #f60;margin: 0 10px;color: white;">${title}</div>
									</a>
								</s:iterator>
							</td>
						</tr>
						
						<tr>
							<td><strong>上传时间：</strong></td>
							<td>	
								${course.time}
							</td>
						</tr>
						
						<tr>
							<td><strong>课程价格：</strong></td>
							<td>
								${course.money}<s:if test="course.status==1"><span style="color:#888888;">(原价：${course.twomoney})</span></s:if>
							</td>
						</tr>
						
						
						<tr>
							<td><strong>购买人数：</strong></td>
							<td>${course.payNum}</td>
						</tr>
						
						<tr>
							<td><strong>观看人数：</strong></td>
							<td>${course.readNum}</td>
						</tr>
						
						
						<tr>
							<td><strong>课程详情：</strong></td>
							<td>${course.introduce}</td>
						</tr>
						
						
						
					</table>
					
				</div>
			</div>

		</div>

	</body>

</html>