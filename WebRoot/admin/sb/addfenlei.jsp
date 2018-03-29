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
		<link rel="stylesheet" type="text/css" href="<%=path%>/admin/My97DatePicker/myCSS.css" />
		<link rel="stylesheet" href="<%=path%>/admin/css/pintuer.css">
		<link rel="stylesheet" href="<%=path%>/admin/css/admin.css">
		<script src="<%=path%>/admin/js/jquery.js"></script>
		<script src="<%=path%>/admin/js/pintuer.js"></script>
		<script src="<%=path%>/admin/js/admin.js"></script>
		<script type="text/javascript" src="<%=path%>/admin/My97DatePicker/WdatePicker.js"></script>
		<script type="text/javascript" src="<%=path%>/admin/My97DatePicker/jquery-1.4.2.min.js"></script>

	</head>

	<body>
		<%@ include file="/admin/topmenu.jsp"%>
		<SCRIPT type="text/javascript">showwhere("sbtop",0)</SCRIPT>
		<div class="admin">

			<div class="panel">
				<div class="panel-head">
					<div class="line-middle">
						<div class="x3">
							<strong>添加</strong>
						</div>
						<div class="x3"></div>
						<div class="x3"></div>
					</div>
				</div>
				<div class="panel-body">

					<form name="form" action="sb!add.action" method="post" enctype="multipart/form-data">
					
					
						
						<div class="form-group">
							<div class="label">
								<label for="sitename">
									图标：
								</label>
							</div>
							<div class="field">
								<a class="button input-file" href="javascript:void(0);">+ 修改图片<input size="100"
										type="file" name="file"
										data-validate="required:请选择上传文件,regexp#.+.(jpg|jpeg|png|gif)$:只能上传jpg|gif|png格式文件" />
								</a>
							</div>
						</div>

						<div class="form-group">
							<div class="label">
								<label for="sitename">
									标题：
								</label>
							</div>
							<div class="field">
								<input type="text" class="input" id="sitename" name="fenlei.name" size="50"
									placeholder="请输入标题" />
							</div>
						</div>
						
			
						<button class="button bg-blue" onclick="return checkForm()">
							提交
						</button>
					</form>

				</div>
			</div>


		</div>



	</body>
</html>