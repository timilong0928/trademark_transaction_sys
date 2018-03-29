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
		<title>添加红包规则</title>
		<link rel="stylesheet" href="<%=path%>/admin/css/pintuer.css">
		<link rel="stylesheet" href="<%=path%>/admin/css/admin.css">
		<script type="text/javascript" src="../My97DatePicker/WdatePicker.js"></script>
		<script src="<%=path%>/admin/js/jquery.js"></script>
		<script src="<%=path%>/admin/js/pintuer.js"></script>
		<script src="<%=path%>/admin/js/admin.js"></script>
		<script type="text/javascript" src="<%=path%>/admin/My97DatePicker/WdatePicker.js"></script>
		
		<script type="text/javascript" src="<%=request.getContextPath()%>/admin/js/ajaxfileupload.js"></script>
		<script type="text/javascript" src="<%=path%>/admin/My97DatePicker/WdatePicker.js"></script>
		
		
		<link rel="stylesheet"	href="<%=request.getContextPath()%>/admin/kindeditor/themes/default/default.css" />
		<link rel="stylesheet" href="<%=request.getContextPath()%>/admin/kindeditor/plugins/code/prettify.css" />
		<script charset="utf-8" src="<%=request.getContextPath()%>/admin/kindeditor/kindeditor.js"></script>
		<script charset="utf-8" src="<%=request.getContextPath()%>/admin/kindeditor/lang/zh_CN.js"></script>
		
		<script type="text/javascript">
		
		
		$(function(){
			editoreditor();
		});
		function editoreditor(){
	  	    var editor;
			KindEditor.ready(function(K) {
				editor = K.create('textarea[name="article.content"]', {
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
		<SCRIPT type="text/javascript">showwhere("articletop",2)</SCRIPT>
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

					<form name="form" action="article!addl.action" method="post" enctype="multipart/form-data">
						
						
						<div class="form-group">
							<div class="label">
								<label for="sitename">
										规则标题：
								</label>
							</div>
							<div class="field">
								<input type="text" class="input" id="sitename" name="article.title" size="50"placeholder="请输入标题" value="${article.title} "/>
							</div>
						</div>
						
						
					
				
				<div style="clear:both;width:100%;height:10px;"></div>
						
						<div class="form-group">
							<div class="label">
								<label for="readme">
									红包规则内容：
								</label>
							</div>
							<div class="field" >
								<textarea name="article.content" class="input"  id="sitename"
									style="height: 500px"  placeholder="请输 入" >${article.content}</textarea>
							</div>
						</div>
						
			        <a>
                    <input type="submit" class="button border-blue button-little" style="width:auto ; height:auto;font-size:  15px" value="提交" /></a>
						
					</form>

				</div>
			</div>


		</div>
  


	</body>
</html>