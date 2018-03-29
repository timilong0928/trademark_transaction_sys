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
		<title>修改业务</title>
		<link rel="stylesheet" href="<%=path%>/admin/css/pintuer.css">
		<link rel="stylesheet" href="<%=path%>/admin/css/admin.css">
		<script type="text/javascript" src="../My97DatePicker/WdatePicker.js"></script>
		<script src="<%=path%>/admin/js/jquery.js"></script>
		<script src="<%=path%>/admin/js/pintuer.js"></script>
		<script src="<%=path%>/admin/js/admin.js"></script>
		<script type="text/javascript" src="<%=path%>/admin/My97DatePicker/WdatePicker.js"></script>
		
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
				editor = K.create('textarea[name="yewu.jianjie"]', {
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
		<SCRIPT type="text/javascript">showwhere("yewutop",1)</SCRIPT>
		<div class="admin">

			<div class="panel">
				<div class="panel-head">
					<div class="line-middle">
						<div class="x3">
							<strong>修改</strong>
						</div>
						<div class="x3"></div>
						<div class="x3"></div>
					</div>
				</div>
				<div class="panel-body">

					<form name="form" action="yewu!update.action?yewu.id=${yewu.id}" method="post" enctype="multipart/form-data">
						
						
						<div class="form-group">
							<div class="label">
								<label for="sitename">
									业务标题：
								</label>
							</div>
							<div class="field">
								<input type="text" class="input" id="sitename" name="yewu.biaoti" size="50"
									value="${yewu.biaoti }" />
							</div>
						</div>
						
						<div class="form-group">
							<div class="label">
								<label for="sitename">
									业务主图：
								</label>
							</div>
							<div class="field">
								<a class="button input-file" href="javascript:void(0);">+ 添加图片<input size="100"
										type="file" name="file"/>
								</a>
							</div>
						</div>
						
						<div class="form-group">
							<div class="label">
								<label for="sitename">
									业务价格：
								</label>
							</div>
							<div class="field">
								<input type="text" class="input" id="sitename" name="yewu.price" size="50"
									value="${yewu.price }" />
							</div>
						</div>
						
						<div class="form-group">
							<div class="label">
								<label for="sitename">
									业务小项价格：
								</label>
							</div>
							<div class="field">
								<input type="text" class="input" id="sitename" name="yewu.xiaoxiang" size="50"
									value="${yewu.xiaoxiang }" />
							</div>
						</div>
						
				<div class="form-group">
                     <!-- 图片上传8张 -->
					<div class="label">
								<label for="logo" style="font-weight:normal; ">
									详情图片&nbsp;&nbsp;&nbsp;
								</label>
								<br />
								 *最多上传8张照片
					</div>
					<div class="field">
						<div id="picture" class="field" style="width: 100%; ">
						
		                       <div id="scan0" class="fieldpic" style="width: 100%;float: left;" >
		                    	<a class="button input-file" href="javascript:void(0);">+ 浏览文件
		                    	<input  onchange="preview(0,this,0)" size="100" style="" type="file" name="files" multiple/></a>
		                       </div>
	                    
						</div>
							<div id="previewdiv"  style="width: 100%" ></div>	
					</div>
				</div>
				
				<div style="clear:both;width:100%;height:10px;"></div>
						
						<div class="form-group">
							<div class="label">
								<label for="readme">
									添加简介：
								</label>
							</div>
							<div class="field" >
								<textarea name="yewu.jianjie" class="input"  id="sitename" 
									style="height: 500px"   >${yewu.jianjie}</textarea>
							</div>
						</div>
						
			        <a>
                    <input type="submit" class="button border-blue button-little" style="width:auto ; height:auto;font-size:  15px" value="提交" /></a>
						
					</form>

				</div>
			</div>


		</div>
  <SCRIPT type="text/javascript">
         
		 var i=0;
			function preview(data,file,type) {
			if(type==0){
			  i++;
			  var c=document.getElementsByClassName("fieldpic");
			  if(c.length<9){
				for(var j=0;j<c.length;j++){
				   c[j].style.display="none";
				}
				if (file.files && file.files[0]) {
					var reader = new FileReader();
					reader.onload = function(evt) {
						$("#previewdiv").append('<div id="previewdiv'+i+'" style="float:left;"><img style="margin-left:15px;" src="' + evt.target.result + '" width="75" height="75"/><br/>'
						                     +'&nbsp;&nbsp;&nbsp;<button  style="margin-left:20px;border-radius:5px;color:#2c7;border:1px solid #2c7 ;background:#fff;margin-top:3px;" onclick="preview('+i+')" type="button">删除</button></div>');
					}
					reader.readAsDataURL(file.files[0]);
					if(c.length==8){
					$("#picture").append(' <div style="display:none;" id="scan'+i+'" class="fieldpic"><a class="button input-file" href="javascript:void(0);">+ 浏览文件<input onchange="preview('+i+',this,0)" size="100" type="file" name="files" data-validate="required:请选择上传文件,regexp#.+.(jpg|jpeg|png|gif)$:只能上传jpg|gif|png格式文件且不超过8张" /></a></div>');
					}else{
					$("#picture").append(' <div id="scan'+i+'" class="fieldpic"><a class="button input-file" href="javascript:void(0);">+ 浏览文件<input onchange="preview('+i+',this,0)" size="100" type="file" name="files" data-validate="required:请选择上传文件,regexp#.+.(jpg|jpeg|png|gif)$:只能上传jpg|gif|png格式文件且不超过8张" /></a></div>');
					}
					
				    
				}else{alert("文件异常！");} 
			  }else{
			      alert("最多上传8张图片！");
			  }
			 }else{
			    //删除预览
			    $('#previewdiv'+data).remove();
		        //删除上传
		        var a = $('#scan'+(data-1)).parent().children('div');
		        a[a.length-1].style.display="";
		        $('#scan'+(data-1)).remove();
			 }
			}
			
			
            
      </SCRIPT>


	</body>
</html>