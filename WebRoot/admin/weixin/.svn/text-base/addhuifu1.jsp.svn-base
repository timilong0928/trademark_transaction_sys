<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page import="pojo.Admin" %>
<% 
Admin admin=(Admin)session.getAttribute("admin");
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
    <link rel="stylesheet" href="../css/pintuer.css">
    <link rel="stylesheet" href="../css/admin.css">
    <script src="../js/jquery.js"></script>
    <script src="../js/pintuer.js"></script>
    <script src="../js/respond.js"></script>
    <script src="../js/admin.js"></script>
   
<link rel="stylesheet" href="<%=request.getContextPath() %>/admin/kindeditor/themes/default/default.css" />
	<link rel="stylesheet" href="<%=request.getContextPath() %>/admin/kindeditor/plugins/code/prettify.css" />
	<script charset="utf-8" src="<%=request.getContextPath() %>/admin/kindeditor/kindeditor.js"></script>
	<script charset="utf-8" src="<%=request.getContextPath() %>/admin/kindeditor/lang/zh_CN.js"></script>
  	<script type="text/javascript">
  	    var editor;
		KindEditor.ready(function(K) {
			editor = K.create('textarea[name="guanzhu.content"]', {
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
		
		function checkForm(){
		   
  	        var value =editor.html();//获取文本域的值。
  	        
  	        return true;
  	    }
	</script>
</head>

<body>

<s:if test="msg=='success'">
  <script >alert("修改成功")</script>
   </s:if> 
   
   <s:if test="msg=='fail'">
  <script >alert("修改失败，稍后再试")</script>
   </s:if> 
   
<%@ include file="/admin/topmenu.jsp" %>
<SCRIPT type="text/javascript">showwhere(2,3,"关注回复规则")</SCRIPT>
<div class="admin">

    <div class="panel">
  <div class="panel-head"><strong>关注回复规则</strong></div>
  <div class="panel-body">
  
<form action="guanzhu!update.action" id="form" method="post" enctype="multipart/form-data" >
               
                <div class="form-group">
                    <div class="label"><label for="sitename">标题</label></div>
                    <div class="field">
                    	<input type="text" class="input" id="sitename" name="guanzhu.title" value="${guanzhu.title}" size="50" placeholder="请输入标题" data-validate="required:请输入标题" />
                    </div>
                </div>
                
                     <div class="form-group">
                    <div class="label"><label for="sitename">描述</label></div>
                    <div class="field">
                    	<textarea rows="5" class="input" name="guanzhu.miaoshu"  placeholder="请输入描述" data-validate="required:请输入描述">${guanzhu.miaoshu}</textarea>
                    </div>
                </div>
                

                <div class="form-group">
                    <div class="label"><label for="logo">封面</label></div>
                    <div class="field">
                    	<a class="button input-file" href="javascript:void(0);">+ 浏览文件<input size="100" type="file" name="file" data-validate="required:请选择上传文件,regexp#.+.(jpg|jpeg|png|gif)$:只能上传jpg|gif|png格式文件" /></a>
                    </div>
                </div>
                
                
                  <div class="form-group">
                    <div class="label"><label for="readme">内容</label></div>
                    <div class="field">
                    	<textarea name="guanzhu.content" class="input" rows="20" cols="50"  >${guanzhu.content}</textarea>
                    </div>
                </div>
                <input type="hidden" value="${guanzhu.id}" name="guanzhu.id"/>
                <button class="button bg-blue" onclick="return checkForm()">提交</button>
        </form>
  </div>
</div>
                
                
</div>


</body>
</html>