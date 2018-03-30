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
		
		
		<script type="text/javascript" src="<%=request.getContextPath()%>/admin/js/ajaxfileupload.js"></script>
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
				editor = K.create('textarea[name="sb.jieshao"]', {
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
		<br><%@ include file="/admin/topmenu.jsp"%>
		<SCRIPT type="text/javascript">showwhere("sbtop",1)</SCRIPT>
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

					<form name="form" action="sb!addsb.action" method="post" enctype="multipart/form-data">
					
					   <div class="form-group">
							<div class="label">
								<label for="sitename">
									商标编号：
								</label>
							</div>
							<div class="field">
								<input onchange="checkbianhao()" type="text" class="input" id="checkbh" name="sb.biaohao" size="50"
									placeholder="请输入编号" />
							</div>
						</div>
						 
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
								<input type="text" class="input" id="sitename" name="sb.title" size="50"
									placeholder="请输入标题" />
							</div>
						</div>
						
						<div class="form-group">
							<div class="label">
								<label for="sitename">
									商品价格：
								</label>
							</div>
							<div class="field">
								<input type="text" class="input" id="sitename" name="sb.price" size="50"
									placeholder="请输入价格" />
							</div>
						</div>
						<!-- Edit by Timilong(13896901804@qq.com) 2018年3月30日 -->
						<div class="form-group">
							<div class="label">
								<label for="sitename">
									成本(内部)价格：
								</label>
							</div>
							<div class="field">
								<input type="text" class="input" id="sitename" name="sb.cost_price" size="50"
									placeholder="请输入商品的成品价格" />
							</div>
						</div>						
						<div class="form-group">
							<div class="label">
								<label for="sitename">
									商标持有人：
								</label>
							</div>
							<div class="field">
								<input type="text" class="input" id="sitename" name="sb.sb_owner" size="50"
									placeholder="请输入商品的成品价格" />
							</div>
						</div>							
						<!-- Edit by Timilong(13896901804@qq.com) 2018年3月30日 -->
			                    
			              <div class="form-group">
							<div class="label">
								<label for="sitename">
									分类：
								</label>
							</div>
							<div class="field">
								<select name="key" class="button button-small border-blue">
									<s:iterator value="fenleis">
								        <option value="${id}" >${name}</option>
			                    	</s:iterator>
			                    </select>
							</div>
						</div>
						
						<div class="form-group">
							<div class="label">
								<label for="sitename">
									商标类型：
								</label>
							</div>
							<div class="field">
								<input type="text" class="input" id="sitename" name="sb.leixing" size="50"
									placeholder="请输入类型" />
							</div>
						</div>
						
						<div class="form-group">
							<div class="label">
								<label for="sitename">
									商标群组：
								</label>
							</div>
							<div class="field">
								<input type="text" class="input" id="sitename" name="sb.qunzu" size="50"
									placeholder="请输入商标群组" />
							</div>
						</div>
						
						<div class="form-group">
							<div class="label">
								<label for="sitename">
									专用期限：
								</label>
							</div>
							<div class="field">
							<input name="sb.time" id="startTime" type="text" class="input " size="35"
										onFocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'%y-%M-%d %H:%m:%s'})"
										placeholder="请输入活动开始时间" />
								
							</div>
						</div>
						
						<div class="form-group">
							<div class="label">
								<label for="readme">
									添加服务项目：
								</label>
							</div>
							<div class="field" >
								<textarea name="sb.jieshao" class="input"  id="sitename"
									style="height: 500px"  placeholder="请输 入" ></textarea>
							</div>
						</div>
						
			
						<button class="button bg-blue" onclick="return checkForm()"  style="margin-left: 95%">
							提交
						</button>
					</form>

				</div>
			</div>


		</div>



	</body>
	<SCRIPT type="text/javascript">
		function checkbianhao(){
			var qq=$("#checkbh").val();
			//alert(qq)
			
			 $.ajax({
					url:"sb!checkbianhao.action?sb.biaohao="+qq,
					type:"post",
					data:{},
					dataType:"json",
					success:function(json_msg){
					
					if(json_msg == "1")
						 alert("该商标编号已被使用!");
						 $("#checkbh").val("");
					},
					error:function(){
						alert("输入编号出错");
					}
					});
		
		}
	</SCRIPT>
</html>