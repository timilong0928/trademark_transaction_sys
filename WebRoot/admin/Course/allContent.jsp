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
		<script type="text/javascript" src="<%=request.getContextPath() %>/admin/js/ajaxfileupload.js"></script>
	</head>

	<body>
		<%@ include file="/admin/topmenu.jsp" %>
		<SCRIPT type="text/javascript">
			showwhere("coursetop", 0, "课时管理")
		</SCRIPT>
		<div class="admin">
			<div class="panel admin-panel">
				<div class="panel-head">
					<strong>课时列表</strong>
				</div>
				<div class="padding border-bottom">
					<div class="line-middle">
						<div class="x4">
						</div>
						<form action="course!addcontent.action" method="post">
							<div class="x4">
								<input type="hidden" name="content.courseId" value="${course.id}">
								<input name="content.title" type="text"
									class="input" placeholder="请输入课时名" />
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
							课时排序
						</th>
						<th width="200"  style="text-align: center;">
							课时名称
						</th>
						<th width="200"  style="text-align: center;">
							是否试看
						</th>
						<th width="200" style="text-align: center;">
							课时视频
						</th>
						<th width="200" style="text-align: center;">
							修改视频
						</th>
						<th width="200" style="text-align: center;">
							操作
						</th>
					</tr>
					<s:iterator value="contents">
					<form action="course!updatecontent.action" method="post" enctype="multipart/form-data">
						<input  type="hidden" value="<s:property value="id" />" name="content.id">
						<input type="hidden" id="courseid" name="course.id" value="${course.id}">
						<input type="hidden" name="content.courseId" value="${course.id}">
						<tr style="text-align: center;">
							<td>
								<input class="input" name="content.seq"  value="<s:property value="seq" />" />
							</td>
							<td>
								<input class="input" name="content.title" value="<s:property value="title" />" />
							</td>
							<td>
								<s:if test="isTest==0">
									<input type="checkbox"  name="content.isTest" value="1" />
								</s:if><s:else>
									<input type="checkbox"  name="content.isTest" checked="checked" value="1" />
								</s:else>
							</td>
							<td>
								<s:if test="content1==null||content1==''">
											无 
								</s:if><s:else>
									<a target="_blank" href="<%=basePath %><s:property value="content1" />">
										<div class="button bg-blue">
											查看视频
										</div>
									</a>
								</s:else>
							</td>
							
							<td>
									<div class="field">
										<a class="button input-file" href="javascript:void(0);">+
											选择视频<%=request.getContextPath() %><input size="100" type="file" name="file" id="fileToUpload${id}"
												data-validate="required:请选择上传文件,regexp#.+.(rm|rmvb|wmv|avi|mp4|3gp|mkv|cd|mp3|rm|wav)$:只能上传rm|rmvb|wmv|avi|mp4|3gp|mkv|cd|mp3|rm|wav格式文件"/>
										</a>
										<input class="button" style="position:relative;bottom:10px;margin-left:3%;display:block-inline;height:35px;" type="button" value="上传并修改" onclick="ajaxFileUpload(${id})"/>
									</div>
									<div class="progress" id="progressbar0${id}" style="width:40%;display:none;">
										<div id="progressbar${id}" class="progress-bar" >
											进度：<span id="progressbar1${id}">0%</span>
										</div>
			   						</div>
			   						<div style="clear:both;height:10px;width:100%;"></div>
							</td>
							<td>
								<button type="submit" class="button button-small bg-blue">
										修改
								</button>
								<a class="button border-yellow button-little"
									href="course!deletecontent.action?content.id=<s:property value="id"/>"
									onclick="{if (confirm('确认删除?')) {return true;}return false;};">删除</a>
							</td>
						</tr>
					</form>
					</s:iterator>

				</table>

			</div>

			<br />

		</div>
		<script type="text/javascript">  
		var id = 0;
		var time = 0;  
		function ajaxFileUpload(id2){  
			id = id2;
		    var file = $('#fileToUpload'+id2).val();//文件全名
		    var geshi = file.substr(file.lastIndexOf("."));//获取后缀如：.mp4
		    if(file.length>0){//可以判断有无文件
		    
		    if(geshi=='.mp4'||geshi=='.ogg'||geshi=='.webm'){//判断文件格式是否正确
		    
		    $("#progressbar0"+id2).show();
		    $("#progressbar"+id2).css('width','20%');
		    $("#progressbar1"+id2).html('0%');
		    time = window.setInterval(progress,1000);  
		    $.ajaxFileUpload({  
		            url:'uploadfile!execute.action', 
		            secureuri:false,
		            fileElementId:'fileToUpload'+id2,//fileToUpload是input file 标签的id值  
		            data : {"id":id2},
		            dataType: 'multipart/form-data',
		            success: function (data){
		            	 alert("上传成功");
		            },  
		            error: function (){  
		                alert("上传失败");  
		            }  
		        });  
		        return false;
		    }else{
		     alert("请上传格式正确的文件：mp4|ogg|webm");
		    }
		   }else{
		    alert("请选择文件！");
		   }
		}  
  
		function progress(){
			 
		    $.ajax({  
		        'url':"progress!execute.action", 
		        'data':{},
		        'type':'post', 
		        'dataType':'json',  
		        success:function(data){  
			        $("#progressbar"+id).css('width',(data.rate+20)+'%');
			        $("#progressbar1"+id).html(data.rate+'%'); 
			        if(data.rate == 100){  
			            clearInterval(time);  
			        	alert("上传并且修改成功");
			        	var courseid = $("#courseid").val();
			        	window.location = "course!allcontent.action?course.id="+courseid;
			        }  
		        },  
		        error:function(){  
		            alert("error");  
		        }  
		    });  
		}  
</script> 
	</body>
</html>