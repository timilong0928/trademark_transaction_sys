<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
		<link rel="stylesheet" href="<%=path %>/admin/css/pintuer.css">
		<link rel="stylesheet" href="<%=path %>/admin/css/admin.css">
		<script src="<%=path %>/admin/js/jquery.js"></script>
		<script src="<%=path %>/admin/js/pintuer.js"></script>
		<script src="<%=path %>/admin/js/admin.js"></script>
	</head>

	<body>
		<%@ include file="/admin/topmenu.jsp" %>
		<SCRIPT type="text/javascript">
			showwhere("coursetop", 2, "课程分类")
		</SCRIPT>
		<div class="admin">
			<div class="panel admin-panel">
				<div class="panel-head">
					<strong>分类列表</strong>
				</div>
				<div class="padding border-bottom">
					<div class="line-middle">
						<div class="x4">
						</div>
						<form action="course!addClassify.action" method="post">
							<div class="x4">
								<input name="classify2.type" type="hidden" value="0"/>
								<input name="classify2.name" type="text"
									class="input" placeholder="请输入分类名" />
							</div>
							<div class="x4">
								<button type="submit" class="button bg-blue">
									添加
								</button>
							</div>
						</form>
					</div>
				</div>
				<table class="table table-hover">

					<tr>
						<th width="200"  style="text-align: center;">
							排列顺序
						</th>
						<th width="200"  style="text-align: center;">
							分类名称
						</th>
						<th width="200" style="text-align: center;">
							图片
						</th>
						<th width="200" style="text-align: center;">
							修改图片
						</th>
						<%--<th width="200" style="text-align: center;">
							选中图片
						</th>
						<th width="200" style="text-align: center;">
							修改选中
						</th>
						--%><th width="200" style="text-align: center;">
							操作
						</th>
					</tr>
					<s:iterator value="classify2s">
					<form action="course!updateClassify.action" method="post" enctype="multipart/form-data">
						<input  type="hidden" value="<s:property value="id" />" name="classify2.id">
						<input type="hidden" value="<s:property value="type" />" name="classify2.type">
						<tr style="text-align: center;">
							<td>
								<input class="input" name="classify2.orderid"  value="<s:property value="orderid" />" />
							</td>
							<td>
								<input class="input" name="classify2.name" value="<s:property value="name" />" />
							</td>
							<td>
								<img  name="classify2.img"  height="70"  src="<%=path %>/${img}" />
							</td>
							
							<td>
									<div class="field">
										<a class="button input-file" href="javascript:void(0);">+
											修改图片<%=request.getContextPath() %><input size="100" type="file" name="file"
												data-validate="required:请选择上传文件,regexp#.+.(jpg|jpeg|png|gif)$:只能上传jpg|gif|png格式文件" />
										</a>
									</div>
							</td>
							<%--<td>
								<img name="classify2.img2"  height="70"  src="<%=path %>/${img2}" />
							</td>
							
							<td>
									<div class="field">
										<a class="button input-file" href="javascript:void(0);">+
											修改图片<%=request.getContextPath() %><input size="100" type="file" name="file1"
												data-validate="required:请选择上传文件,regexp#.+.(jpg|jpeg|png|gif)$:只能上传jpg|gif|png格式文件" />
										</a>
									</div>
							</td>
							--%>
							<td>
								<button type="submit" class="button button-small bg-blue">
										修改
									</button>
								<a class="button border-yellow button-little"
									href="course!deleteClassify.action?classify2.id=<s:property value="id"/>"
									onclick="{if (confirm('确认删除?')) {return true;}return false;};">删除</a>
							</td>
						</tr>
					</form>
					</s:iterator>

				</table>

			</div>

			<br />

		</div>
		
	</body>
</html>