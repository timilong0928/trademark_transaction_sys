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
		<script src="../js/respond.js"></script>
		<script src="../js/admin.js"></script>

		<link rel="stylesheet" type="text/css"
			href="../My97DatePicker/myCSS.css" />
		<script type="text/javascript" src="../My97DatePicker/WdatePicker.js"></script>
		<script type="text/javascript"
			src="../My97DatePicker/jquery-1.4.2.min.js"></script>


	</head>

	<body>
<%@include file="../topmenu.jsp" %>
<SCRIPT type="text/javascript">showwhere("producttop",8)</SCRIPT>

		<div class="admin">
			<form action="order!exportOrder2.action" method="post" id="form">
				<div class="panel">
					<div class="panel-head">
						<strong>导出商品订单</strong>
					</div>
						
					<div class="panel-body">
						<div class="form-group">
							<div class="label">
								<label for="sitename">
									订单状态
								</label>
							</div>
							<div class="field">
								<select name="order2.fhStatus" class="button bg-blue"  >
									<option value="-1">全部订单</option>
									<option value="0">待付款</option>
									<option value="1">待发货</option>
									<option value="2">已发货</option>
									<option value="3">已完成</option>
								</select>
							</div>
						</div>
					
						<div class="form-group">
							<div class="label">
								<label for="sitename">
									开始时间
								</label>
							</div>
							<div class="field">
								<input name="time1" id="startTime" type="text" class="input"
									placeholder="请输入开始时间"
									onFocus="WdatePicker({dateFmt:'yyyy-MM-dd ',maxDate:'#F{$dp.$D(\'endTime\')}'})" />
							</div>
						</div>

						<div class="form-group">
							<div class="label">
								<label for="sitename">
									结束时间
								</label>
							</div>
							<div class="field">
								<input name="time2" id="endTime" type="text" class="input"
									placeholder="请输入结束时间"
									onFocus="WdatePicker({dateFmt:'yyyy-MM-dd ',minDate:'#F{$dp.$D(\'startTime\')}',maxDate:'%y-%M-%d %H:%m:%s'})" />
							</div>
						</div>
						<button class="button bg-sub" name="cx" >
							导出
						</button>
					</div>
				  </div>
				</div>
			</form>
		</div>
		<script type="text/javascript">
		function getResult() {
			var condition = "";
			var startTime = document.getElementById("startTime").value;
			var endTime = document.getElementById("endTime").value;
			if(startTime==""&&endTime==""){
				return $("#form").submit() ;
			}
			if (startTime == "" || endTime == "") {
				alert("请输入开始和结束时间！");
				return false;
			} else {
				return $("#form").submit() ;
			}
		}
		</script>
	</body>
</html>