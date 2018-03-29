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
				editor = K.create('textarea[name="taocan.introduce"]', {
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
		showwhere("coursetop", 3)
</SCRIPT>

		<div class="admin" >

			<div class="panel">
				<div class="panel-head">
					<strong>修改套餐</strong>
				</div>
				<div class="panel-body">

					<form action="course!updatetaocan.action" id="form" method="post" enctype="multipart/form-data">
						<input type="hidden" value="${taocan.id}" name="taocan.id">
						<table class="table table-hover" style="margin-top: 20px;">
						<tr>
							<th width="10">
								选择
							</th>
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
						</tr>

						<s:iterator value="taocan.taocancourses" >

							<tr>
								<td>
									<input type="checkbox" class="choose" name="courseids"
										value="<s:property value="id"/>" checked="checked"  />
								</td>
								
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
								
							</tr>

						</s:iterator>

					</table>
						
						<div class="form-group">
							<div class="label">
								<label for="sitename">
									套餐标题
								</label>
							</div>
							<div class="field">
								<input type="text" class="input" id="sitename"
									name="taocan.name" size="50" placeholder="请输入标题"
									placeholder="请标题名" data-validate="required:请输入标题名" value="${taocan.name}" />
							</div>
						</div><div style="height: 20px; clear: both;"></div>

						<div class="form-group">
							<div class="label">
								<label for="sitename">
									价格
								</label>
							</div>
							<div class="field">
								<input type="text" class="input" id="sitename"
									name="taocan.money" size="50" placeholder="请输入价格 "
									data-validate="required:请输入课程价格,plusdouble:请输入数字" value="${taocan.money}" />
							</div>
						</div>
						
						<%--<div class="form-group">
							<div class="label">
								<label for="sitename">
									购买人数
								</label>
							</div>
							<div class="field">
								<input type="text" class="input" id="sitename"
									name="taocan.payNum" size="50" placeholder="请输入购买人数 "
									data-validate="plusinteger:请输入整数" />
							</div>
							<div style="clear: both; height: 10px; width: 100%;"></div>
						</div>
						
						--%><!-- 封面 -->
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
						
						<div class="form-group">
							<div class="label">
								<label for="readme">
									课程介绍详情
								</label>
							</div>
							<div class="field">
								<textarea name="taocan.introduce" class="input"  id="sitename"
									style="height: 500px"  placeholder="请输入介绍详情" >${taocan.introduce}</textarea>
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