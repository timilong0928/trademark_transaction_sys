<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page import="pojo.Admin" %>
<% 
Admin admin=(Admin)session.getAttribute
("admin");
if(admin==null){
response.sendRedirect(request.getContextPath()+"/admin/login.jsp");
}
%>

<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="renderer" content="webkit">
    <title>后台管理</title>
    <link rel="stylesheet" href="<%=path%>/admin/css/pintuer.css">
    <link rel="stylesheet" href="<%=path%>/admin/css/admin.css">
    <script src="<%=path%>/admin/js/jquery.js"></script>
    <script src="<%=path%>/admin/js/pintuer.js"></script>
    <script src="<%=path%>/admin/js/respond.js"></script>
    <script src="<%=path%>/admin/js/admin.js"></script>
   
<link rel="stylesheet" href="<%=request.getContextPath() %>/admin/kindeditor/themes/default/default.css" />
	<link rel="stylesheet" href="<%=request.getContextPath() %>/admin/kindeditor/plugins/code/prettify.css" />
	<script charset="utf-8" src="<%=request.getContextPath() %>/admin/kindeditor/kindeditor.js"></script>
	<script charset="utf-8" src="<%=request.getContextPath() %>/admin/kindeditor/lang/zh_CN.js"></script>
  	<script type="text/javascript">
  	    var editor;
		KindEditor.ready(function(K) {
			editor = K.create('textarea[name="admin.qianming"]', {
			    cssPath : '<%=request.getContextPath() %>/admin/kindeditor/plugins/code/prettify.css',//指定编辑器iframe document的CSS，用于设置可视化区域的样式。
				uploadJson : '<%=request.getContextPath() %>/admin/kindeditor/jsp/upload_json.jsp',
				fileManagerJson : '<%=request.getContextPath() %>/admin/kindeditor/jsp/file_manager_json.jsp',
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
		

	</script>
</head>

<body>

<%@ include file="/admin/topmenu.jsp" %>
<script type="text/javascript">showwhere("shezhitop",1)</script>
<div class="admin">

    <div class="panel">
  <div class="panel-head"><strong>修改登录信息</strong></div>
  <div class="panel-body">
  
<form action="<%=request.getContextPath()%>/admin/admin!update.action" id="form" method="post" enctype="multipart/form-data" >
                <input type="hidden" name="admin.id" value="${admin.id}"/>
                
                <div class="form-group">
                    <div class="label"><label for="sitename">用户名</label></div>
                    <div class="field">
                    	<input disabled="disabled" value="${admin.name}" type="text" class="input" id="sitename" name="admin.name" size="50"  />
                    </div>
                </div>
                 <div class="form-group">
                    <div class="label"><label for="bianma">旧密码</label></div>
                    <div class="field">
                    	<input type="password" class="input"  name="pwd" size="50" />
                    </div>
                </div>
                
                <div class="form-group">
                    <div class="label"><label for="bianma">新密码</label></div>
                    <div class="field">
                    	<input type="password" class="input" id="bianma"  name="admin.password" size="50" />
                    </div>
                </div>
                
                 <div class="form-group">
                    <div class="label"><label for="logo">头像</label></div>
                    <div class="field">
                    	<a class="button input-file" href="javascript:void(0);">+ 浏览文件<input size="100" type="file" name="file"  /></a>
                    </div>
                </div>
                
                <div class="form-group">
                    <div class="label"><label for="bianma">客服热线</label></div>
                    <div class="field">
                    	<input class="input" id="bianma"  name="admin.phone" size="50" value="${admin.phone}"  />
                    </div>
                </div>
                
                <div class="form-group">
                    <div class="label"><label for="bianma">投诉电话</label></div>
                    <div class="field">
                    	<input class="input" id="bianma"  name="admin.phone1" size="50" value="${admin.phone1}" />
                    </div>
                </div>
                
                     <div class="form-group">
                    <div class="label"><label for="sitename">个性签名</label></div>
                    <div class="field">
                    	<textarea rows="20" class="input" name="admin.qianming" >${admin.qianming }</textarea>
                    </div>
                </div>
                
                <button type="submit" class="button bg-blue" >修改</button>
        </form>
  </div>
</div>
                
                
</div>


</body>
</html>