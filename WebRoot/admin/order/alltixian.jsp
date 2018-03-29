<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ page import="pojo.Admin"%>
<%
	Admin admin = (Admin) session.getAttribute("admin");
	if (admin == null) {
		response.sendRedirect(request.getContextPath()
				+ "/admin/login.jsp");
	}
%>

<!DOCTYPE html>
<html lang="zh-cn">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport"
			content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
		<meta name="renderer" content="webkit">
		<title>后台管理</title>
		<link rel="stylesheet" href="../css/pintuer.css">
		<link rel="stylesheet" href="../css/admin.css">
		<link rel="stylesheet" type="text/css" href="../My97DatePicker/myCSS.css" />
		<script type="text/javascript" src="../My97DatePicker/WdatePicker.js"></script>
		<script src="../js/jquery.js"></script>
		<script src="../js/pintuer.js"></script>
		<script src="../js/admin.js"></script>
		
	</head>

	<body>
   <%@ include file="/admin/topmenu.jsp" %>
	<SCRIPT type="text/javascript">showwhere("ordertop",1)</SCRIPT>
		<div class="admin">
			<div class="panel admin-panel">
				
				<div class="panel-head" style="">
				</div>
			<div class="panel-head">
			</div>
					<div class="padding border-bottom" style="height: 50px;">
						<div onclick="xuanze('3');" class="button button-small border-yellow">全部提现记录</div>
						<div onclick="xuanze('0');" class="button button-small border-yellow" style="margin-left: 10px">已申请</div>
						<div onclick="xuanze('1');" class="button button-small border-yellow">已完成</div>
						<div onclick="xuanze('2');" class="button button-small border-yellow">已拒绝</div>
					</div>
					<SCRIPT type="text/javascript">
					function xuanze(tixianstatus){
						$(".tixianstatus3").css("display","none");
						$(".tixianstatus"+tixianstatus).css("display","");
					}
					
					</SCRIPT>
					<table class="table table-hover" style="margin-top: 20px;">
						<tr>
							<th min-width="80" style="">
								开户姓名
							</th>
							<th min-width="100" style="">
								银行卡号
							</th>
							<th min-width="100" style="">
								开户银行
							</th>
							<th min-width="100" style="">
								佣金消费数量
							</th>
							
							<th min-width="60" style="">
								提现状态
							</th>
							<th min-width="60" style="">
								提现时间
							</th>
							<th min-width="100" style="">
								操作
							</th>
						</tr>

						<s:iterator value="payRecords">

							<tr class="tixianstatus3 tixianstatus${status}">
								
								<td style="">
									<s:property value="name"/>
								</td>
								
								<td style="">
									<s:property value="kahao"/>
								</td>
								<td style="">
									<s:property value="yinghang"/>
								</td>
								<td style="">
									<s:property value="yjpay"/>
								</td>
								
								<td style="">
									<s:if test="status==0"><span style="color:red;">已申请</span></s:if>
									<s:if test="status==1"><span style="">已完成</span></s:if>
									<s:if test="status==2"><span style="color:#888888;">已拒绝</span></s:if>
								</td>
								<td style="">
									<s:property value="time"/>
								</td>
								
								<td style="">
									<a class="button border-blue button-little" href="<%=path %>/admin/user/team!toUser.action?team.id=<s:property value="teamid"/>" />查看提现用户</a>
									<s:if test="status==0">
										<a class="button border-blue button-little"	href="<%=path %>/admin/order/team!tongyitixian.action?payRecord.id=<s:property value="id"/>" />提现成功</a>
										<a class="button border-blue button-little"	href="<%=path %>/admin/order/team!jujuetixian.action?payRecord.id=<s:property value="id"/>" />拒绝提现申请</a>
									</s:if>
								</td>
							</tr>

						</s:iterator>

					</table>
				<div class="panel-foot text-center">
					<ul class="pagination">
						<li>
							<s:if test="page==1">
								<a href="#">上一页</a>
							</s:if>
							<s:else>
								<a href="order!findAll.action?type=${type}&page=${page-1}">上一页</a>
							</s:else>
						</li>
					</ul>

					<ul class="pagination pagination-group">
						<s:iterator begin="1" end="allpage" var="i">
							<s:if test="#i==page">

								<li class="active">
									<a href="order!findAll.action?type=${type}&page=<s:property value="#i"/>"><s:property
											value="#i" /> </a>
								</li>
							</s:if>
							<s:else>

								<li>
									<a href="order!findAll.action?type=${type}&page=<s:property value="#i"/>"><s:property
											value="#i" /> </a>
								</li>
							</s:else>
						</s:iterator>
					</ul>


					<ul class="pagination">
						<li>
							<s:if test="page==allpage">
								<a href="#">下一页</a>
							</s:if>
							<s:else>
								<a href="order!findAll.action?type=${type}&page=${page+1}">下一页</a>
							</s:else>
						</li>
					</ul>
				</div>
			</div>
			<br />
		</div>
	</body>
</html>