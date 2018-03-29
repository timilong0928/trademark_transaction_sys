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
		<script src="../js/jquery.js"></script>
		<script src="../js/pintuer.js"></script>
		<script src="../js/admin.js"></script>
		<script src="<%=path%>/js/diqu.js"></script>
		<SCRIPT type="text/javascript">
			$(function(){
				$("#selectall").click();
			});
		</SCRIPT>

	</head>

	<body>
		<%@ include file="/admin/topmenu.jsp"%>
		<SCRIPT type="text/javascript">showwhere("teamtop",0)</SCRIPT>
		<div class="admin">
		
		

			<div class="panel admin-panel">
				<div class="panel-head">
					<div class="line-big">
						<div class="x8"><strong>佣金记录</strong></div>
						<div style="">
								<div>
									<strong>可用佣金:
										<s:if test="team.yongjin!=null">
											 ${team.allyongjin }&nbsp;&nbsp;&nbsp;&nbsp;
										</s:if>
										<s:else>0</s:else>
									</strong>
								
										<strong>累计佣金:
											<s:if test="team.allyongjin!=null">
												 ${team.allyongjin }
											</s:if>
											<s:else>0</s:else>
										</strong>
								</div>
						</div>
						</div>
						
					</div>
				</div>

				
					<table class="table table-hover" style="margin-top: 20px;width: 48%;float: left;">
						<tr>
							<th width="320" style="">
								返佣人昵称
							</th>
							<th width="320" style="">
								返佣事件
							</th>
							<th width="320" style="">
								返佣数量
							</th>
							<th width="320" style="">
								返佣时间
							</th>
						</tr>
					
                       <s:iterator value="teamAwards" var="teamAward">
                       <s:if test="type==4">
							<tr>
								<td style="">
									<s:property value="fanyongname" />
								</td>
								<td style="">
									<s:property value="yjcontent" />
								</td>
								<td style="">
									<s:property value="yongjinaward" />
								</td>
								<td style=""  >
									<s:property value="time" />
								</td>
							</tr>
						</s:if>
	                  </s:iterator>
					</table>
					
					<table class="table table-hover" style="margin-top: 20px;width: 48%;float: right;">
						<tr>
							
							<th width="320" style="">
								消费事件
							</th>
							<th width="320" style="">
								消费数量
							</th>
							<th width="320" style="">
								消费时间
							</th>
						</tr>
                       <s:iterator value="payRecords" >
                          <s:if test="style==2">
							<tr>
								<td style="">
									<s:property value="yjcontent" />
								</td>
								<td style="">
									<s:property value="yjpay" />
								</td>
								<td style=""  >
									<s:property value="time" />
								</td>
							</tr>
	                       </s:if>
						</s:iterator>
					</table>
				
				</div>
		

		</body>
</html>