<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
		<link rel="stylesheet" href="<%=path%>/admin/css/pintuer.css">
		<link rel="stylesheet" href="<%=path%>/admin/css/admin.css">
		<script src="<%=path%>/admin/js/jquery.js"></script>
		<script src="<%=path%>/admin/js/pintuer.js"></script>
		<script src="<%=path%>/admin/js/admin.js"></script>
		<script type="text/javascript"
			src="<%=request.getContextPath()%>/admin/js/ajaxfileupload.js"></script>

		<link rel="stylesheet"
			href="<%=request.getContextPath()%>/admin/kindeditor/themes/default/default.css" />
		<link rel="stylesheet"
			href="<%=request.getContextPath()%>/admin/kindeditor/plugins/code/prettify.css" />
		<script charset="utf-8"
			src="<%=request.getContextPath()%>/admin/kindeditor/kindeditor.js"></script>
		<script charset="utf-8"
			src="<%=request.getContextPath()%>/admin/kindeditor/lang/zh_CN.js"></script>
		<script type="text/javascript">
		$(function(){
			editoreditor();
		});
		function editoreditor(){
	  	    var editor;
			KindEditor.ready(function(K) {
				editor = K.create('textarea[name="course.introduce"]', {
				    cssPath : '<%=request.getContextPath()%>/admin/kindeditor/plugins/code/prettify.css',//指定编辑器iframe document的CSS，用于设置可视化区域的样式。
					uploadJson : '<%=request.getContextPath()%>/admin/kindeditor/jsp/upload_json.jsp',
					fileManagerJson : '<%=request.getContextPath()%>/admin/kindeditor/jsp/file_manager_json.jsp',
					allowImageRemote : false,//为true则上传图片时显示“网络图片”功能，为false则上传图片时不显示“网络图片”功能。
					//items : ['source', '|','undo', 'redo','cut', 'copy', 'paste', 'plainpaste', 'wordpaste', 'about'],//根据自己的需求设定工具栏
					resizeType : 0,//2或1或0，2时可以拖动改变文本编辑域的宽度和高度，1时只能改变高度，0时不能拖动。
					allowFileManager : true,
					afterCreate : function() {
						var self = this;
						K.ctrl(document, 13, function() {//应对鼠标焦点在文本编辑域外时的快捷键（Ctrl + Enter）提交。
							self.sync();//同步KindEditor的值到textarea文本框
							document.forms['example'].submit();
						});
						K.ctrl(self.edit.doc, 13, function() {//应对鼠标焦点在文本编辑域内部时的快捷键（Ctrl + Enter）提交。
							self.sync();//同步KindEditor的值到textarea文本框
							document.forms['example'].submit();
						});
					}
				});
			});
			
		}

</script>
	</head>

	<body>
		<%@ include file="/admin/topmenu.jsp"%>
		<SCRIPT type="text/javascript">
		showwhere("coursetop", 1)
</SCRIPT>

		<div class="admin" >

			<div class="panel">
				<div class="panel-head">
					<strong>添加课程</strong>
				</div>
				<div class="panel-body">

					<form action="course!addCourse.action" id="form" method="post" enctype="multipart/form-data">
						<div class="form-group">
							<div class="label">
								<label for="sitename">
									课程标题
								</label>
							</div>
							<div class="field">
								<input type="text" class="input" id="sitename"
									name="course.title" size="50" placeholder="请输入标题"
									placeholder="请标题名" data-validate="required:请输入标题名" />
							</div>
						</div><div style="height: 20px; clear: both;"></div>
						
						
						
						
						<!-- 下拉选（类型,状态,推荐，特惠） -->
						<div  style="float:left;margin-right:20px">
							<div class="label" style="margin: 0 0 6px 0;">
								<label for="type" >
									讲师
								</label>
							</div>
							
							<div>
								<SELECT name="course.teacherId" style="float: left; margin-right: 65px;" class="button-small">
									<s:iterator value="teachers">
										<option value="${id}">${rname}</option>
									</s:iterator>
								</SELECT>
							</div>
						</div>
						
						<div  style="float:left;margin-right:20px">
							<div class="label" style="margin: 0 0 6px 0;">
								<label for="type" >
									分类
								</label>
							</div>
							
							<div >
								<SELECT name="course.classify2id" style="float: left; margin-right: 65px;" class="button-small">
									<s:iterator value="classify2s">
										<option value="${id}">${name}</option>
									</s:iterator>
								</SELECT>
							</div>
						</div>
						
						
						<div class="form-group" style="float:left;margin-right:20px">
							<div class="label" style="margin: 0 0 6px 0;">
								<label for="type" >
									状态
								</label>
							</div>
							<div class="field">
								<select name="course.status" class="button-small"  style="float: left; float: left; margin-right: 65px;" id="status">
									<option value="0">普通商品</option>
									<option value="1">活动商品</option>
									<option value="2">下架</option>
								</select>
							</div>
						</div>
						
						
						<div style="clear: both; height: 10px; width: 100%;"></div>
				

						<div class="form-group">
							<div class="label">
								<label for="sitename">
									价格
								</label>
							</div>
							<div class="field">
								<input type="text" class="input" id="sitename"
									name="course.twomoney" size="50" placeholder="请输入价格 "
									data-validate="required:请输入课程价格,plusdouble:请输入数字" />
							</div>
						</div>
						<%--
						
						<div class="form-group">
							<div class="label">
								<label for="sitename">
									购买人数
								</label>
							</div>
							<div class="field">
								<input type="text" class="input" id="sitename"
									name="course.payNum" size="50" placeholder="请输入购买人数 "
									data-validate="plusinteger:请输入整数" />
							</div>
							<div style="clear: both; height: 10px; width: 100%;"></div>
						</div>
						<div class="form-group">
							<div class="label">
								<label for="sitename">
									观看人数
								</label>
							</div>
							<div class="field">
								<input type="text" class="input" id="sitename"
									name="course.readNum" size="50" placeholder="请输入观看人数 "
									data-validate="plusinteger:请输入整数" />
							</div><div style="clear: both; height: 10px; width: 100%;"></div>
							
						</div>
						

						--%>
						<!-- 封面 -->
						<div class="form-group">
							<div class="label">
								<label for="logo" style="margin-right: 220px;">
										上架封面
								</label>
							</div>
							<div class="field">
								<a class="button input-file" href="javascript:void(0);">+ 浏览文件
										<input size="100" type="file" name="file"
											data-validate="regexp#.+.(jpg|jpeg|png|gif)$:只能上传jpg|gif|png格式文件" />
								</a>
							</div>
						</div>
						<%--<div class="form-group">
							<div class="label">
								<label for="logo" style="margin-right: 220px;">
										活动封面
								</label>
							</div>
							<div class="field">
								<a class="button input-file" href="javascript:void(0);" style="margin-right: 170px;">+ 浏览文件
									<input size="100" type="file" name="file1"  
										data-validate="regexp#.+.(jpg|jpeg|png|gif)$:只能上传jpg|gif|png格式文件" />
								</a>
							</div>
						</div>
						<div class="form-group">
							<div class="label">
								<label for="logo" style="margin-right: 220px;">
										已下架封面
								</label>
							</div>
							<div class="field">
								<a class="button input-file" href="javascript:void(0);" >+ 浏览文件
									<input size="100" type="file" name="file2"
										data-validate="regexp#.+.(jpg|jpeg|png|gif)$:只能上传jpg|gif|png格式文件" />
								</a>
							</div>
						</div>
						
						--%><%--
						<div class="form-group">
							<div class="label">
								<label for="readme">
									简介
								</label>
							</div>
							<div class="field">
								<textarea name="course.details" class="input"  id="sitename"
									style="height: 100px"  placeholder="请输入简介"></textarea>
							</div>
						</div>
						<div style="clear: both; height: 10px; width: 100%;"></div>
						--%>
						
						<div class="form-group">
							<div class="label">
								<label for="readme">
									课程介绍详情
								</label>
							</div>
							<div class="field">
								<textarea name="course.introduce" class="input"  id="sitename"
									style="height: 500px"  placeholder="请输入介绍详情"></textarea>
							</div>
						</div>
						<div style="clear: both; height: 10px; width: 100%;"></div>
						
						
						<button id="btstatus" class="button bg-blue" onclick="return checkForm()">
							提交
						</button>
				</form>
				</div>
			</div>


		</div>

		<!-- 提交 -->
		<SCRIPT type="text/javascript">
			function checkForm() {
				return true;
			}
		</SCRIPT>
	</body>
</html>