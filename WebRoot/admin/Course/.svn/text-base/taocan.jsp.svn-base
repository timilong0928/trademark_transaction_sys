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
			showwhere("coursetop", 3)
		</SCRIPT>
		<div class="admin">

			<div class="panel">
				
				<table class="table table-hover" style="margin-top: 20px;">
						<tr>
							<th width="60" style="">
								封面
							</th>
							<th width="80" style="">
								标题
							</th>
							<th width="30" style="">
								状态
							</th>
							<th width="60" style="">
								讲师
							</th>
							<th width="60" style="">
								课时
							</th>
							<th width="60" style="">
								观看次数
							</th>
							<th width="60" style="">
								购买人数
							</th>
							<th width="60" style="">
								价格(￥)
							</th>
							<th width="60" style="">
								上传时间
							</th>
							<th width="60" style="">
								操作
							</th>
						</tr>

						<s:iterator value="taocan.taocancourses">

							<tr>
								
								<td style="">
									<img height="70" width="70" src="<%=path%>/<s:property value="img"/>" />
								</td>
								
								<td style="width:80px">
									<s:property value="title"/>
								</td>
								
								<td style="">
									<s:if test="status==0">
										普通
									</s:if>
									<s:elseif test="status==1">
										<span style="color:red;">活动</span>
									</s:elseif>
									<s:else>
										<span style="color:#888888;">下架</span>
									</s:else>
								</td>
								
								<td style="">
									${teacher}
								</td>
								
								<td style="">
									${period}
								</td>
								<td style="">
									${readNum}
								</td>
								<td style="">
									${payNum}
								</td>
								
								<td style="">
									${money}<s:if test="status==1"><span style="color:#888888;">(原价：${twomoney})</span></s:if>
								</td>
								
								<td style="">
									<s:property value="time"/>
								</td>
								<td style="">
									<a class="button border-blue button-little" href="course!toCourse.action?course.id=<s:property value="id"/>" />查看</a>
								</td>
								
							</tr>

						</s:iterator>

					</table>
			
			
			
				<div class="panel-head">
					<div class="line-big">
						<div class="x6"><strong>套餐详情</strong></div>
					</div>
				</div>
				<div class="panel-body">
					<div class="media" style="text-align:center; ">
							<div style="float: left; margin: 5px 30px 5px 5px;" >
								<div><img src="<%=path%>/${taocan.img}" width="80px" height="80px"></div>
								<div class="media-body">
									<strong>封面 </strong>
								</div>
							</div>
					</div>	

					<table class="table">
						<tr>
							<td style="width: 15%;"><strong>套&nbsp;餐 &nbsp;名：</strong></td>
							<td>${taocan.name}</td>
						</tr>
						
						<tr>
							<td><strong>上传时间：</strong></td>
							<td>	
								${taocan.time}
							</td>
						</tr>
						
						<tr>
							<td><strong>套餐价格：</strong></td>
							<td>
								${taocan.money}<span style="color:#888888;">(原价：${taocan.twomoney})</span>
							</td>
						</tr>
						
						
						<tr>
							<td><strong>购买人数：</strong></td>
							<td>${taocan.payNum}</td>
						</tr>
						
						
						<tr>
							<td><strong>课程详情：</strong></td>
							<td>${taocan.introduce}</td>
						</tr>
						
						
						
					</table>
					
				</div>
			</div>

		</div>

	</body>

</html>