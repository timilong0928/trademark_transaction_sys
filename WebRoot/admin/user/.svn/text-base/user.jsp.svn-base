<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
		
		<script type="text/javascript" src="<%=path%>/admin/My97DatePicker/WdatePicker.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/admin/js/ajaxfileupload.js"></script>

		<link rel="stylesheet"	href="<%=request.getContextPath()%>/admin/kindeditor/themes/default/default.css" />
		<link rel="stylesheet" href="<%=request.getContextPath()%>/admin/kindeditor/plugins/code/prettify.css" />
		<script charset="utf-8" src="<%=request.getContextPath()%>/admin/kindeditor/kindeditor.js"></script>
		<script charset="utf-8" src="<%=request.getContextPath()%>/admin/kindeditor/lang/zh_CN.js"></script>
		<style type="text/css">
			table{
			}
			table img{
				width: 20%;
			}
		</style>
		
		
		<script type="text/javascript">
		
		
		$(function(){
			editoreditor();
		});
		function editoreditor(){
	  	    var editor;
			KindEditor.ready(function(K) {
				editor = K.create('textarea[name="team.tuijian"]', {
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

		<%@ include file="/admin/topmenu.jsp" %>
		<SCRIPT type="text/javascript">
			showwhere("teamtop", 0, "会员详情")
		</SCRIPT>
		<div class="admin">
		<input type="hidden" id="teamid" value="${team.id}" />
			<div class="panel">
				<div class="panel-head">
					<div class="line-big">
						<div class="x6"><strong>会员详情</strong></div>
					</div>
				</div>
				<div class="panel-body">

					<div class="media" style="text-align:center;margin-bottom:10px">
						<s:if test="team.img.substring(0,4)=='http'">
							<img height="70" width="70" src="${team.img}" />
						</s:if>
						<s:else>
							<img height="70" width="70" src="<%=path%>/${team.img}" />
						</s:else>

						<div class="media-body">
							<strong>头像</strong>
						</div>
						
						<div>
							<a href="add.jsp" style="float:left;">
									<input type="button"  class="button border border-green" value="添加权利密码" style="width:120px;"/>
							</a>
						</div>
						
						<div>
							<a href="team!yongjinAward.action?team.id=${team.id}" style="float:right;">
									<input type="button"  class="button border border-blue" value="返佣记录" style="width:90px;"/>
							</a>
						</div>
				    </div>

					<table class="table">
						<tr>
							<td style="width: 15%;"><strong>昵&nbsp; &nbsp; &nbsp; &nbsp;称：</strong></td>
							<td>${team.nickName}</td>
						</tr>
						<tr>
							<td><strong>手&nbsp;机&nbsp; 号：</strong></td>
							<td>${team.phone}</td>
						</tr>
						<tr>
							<td><strong>可用佣金：</strong></td>
							<td>${team.yongjin}</td>
						</tr>
						<tr>
							<td><strong>可用佣金：</strong></td>
							<td>${team.allyongjin}</td>
						</tr>
						
						
						<tr>
							<td><strong>上一级昵称：</strong></td>
							<td>  
								<s:if test="team.yijiId==null||team.yijiId==''">
								无上级
								</s:if>
								  <s:else>
								    <a class="button border-blue button-little" href="team!toUser.action?team.id=${team.yijiId}" />
								         ${team.yijiname} </a> 
								  </s:else>
							</td>
						</tr>
						
						
						
						
					</table>
					
					<table class="table">
						<tr>
							<td style="font-size: 15px;color: blue;"><strong>推荐文章列表</strong> </td>
							<td ></td>
						</tr>
					<s:iterator value="articles">
						
							<tr>
								<td><strong>权利密码标题：${title}</strong> </td>
								<td>操作：<a class="button border-blue button-little" href="team!looktj.action?article.id=${id}"> 
						           		 察看</a>
						           		 
						           		 <a class="button border-blue button-little" href="team!xiugaitj1.action?article.id=${id}"> 
						           		 修改</a>
								
										<a class="button border-blue button-little" href="team!deletetj.action?article.id=${id}"
						             	 onclick="{if (confirm('确认删除?')) {return true;}return false;};"> 
						           		 删除</a></td>
							</tr>
					</s:iterator>
					</table>
							
				</div>
				<!--<form name="form" action="team!addtj.action" method="post" enctype="multipart/form-data">
					<input type="hidden" value="${team.id}" name="team.id"/>
							<div class="field" >
								<textarea name="team.tuijian" class="input"  id="sitename"
									style="height: 500px"  placeholder="请输 入" >${team.tuijian }</textarea>
							</div>
							
							<input type="submit" class="button border-blue button-little" style="width:auto ; height:auto;margin-top: 8px;margin-left: 5px" value="添加或更新" /></a>
							<a class="button border-blue button-little" href="team!deletetj.action?team.id=${team.id}"
			             	 onclick="{if (confirm('确认删除?')) {return true;}return false;};"> 
			           		 删除</a>
				</form>
				--><div style="clear: both;height: 10px"></div>
			</div>

		</div>

	</body>

</html>