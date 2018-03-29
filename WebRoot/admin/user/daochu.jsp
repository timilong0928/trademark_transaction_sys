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
<SCRIPT type="text/javascript">showwhere("teamtop",3)</SCRIPT>
		
		<div class="admin">
			
				<div class="panel">
					<div class="panel-head">
						<select class="button button-small border-blue" onchange="changeform();"  id="sel">
							<option value="1">导出会员信息</option>
							<option value="2">导出会员订单</option>
						</select>
					</div>
					<div class="panel-body" id="f1" >
						<form action="team!exportTeam.action" method="post" id="form1">
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
						<button  class="button  bg-sub " name="cx"    style="width:70px">导出</button>
						</form>
					</div>
					
					<div class="panel-body" id="f2" style="display:none;">
						<form action="team!exportOrder4.action" method="post" id="form2">
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
						<button class="button  bg-sub " name="cx"    style="width:70px">导出</button>
					  </form>
						
					</div>
				</div>
			
		</div>
		<script type="text/javascript">
			function changeform(){
				if($("#sel").val()==1){
					$("#f1").css("display","");
					$("#f2").css("display","none")
				}else {
					$("#f2").css("display","");
					$("#f1").css("display","none")
				}
				
			}
		
		</script>
	</body>
</html>