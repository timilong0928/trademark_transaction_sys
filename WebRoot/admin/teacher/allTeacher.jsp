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
		<link rel="stylesheet" href="../css/pintuer.css">
		<link rel="stylesheet" href="../css/admin.css">
		<script src="../js/jquery.js"></script>
		<script src="../js/pintuer.js"></script>
		<script src="../js/admin.js"></script>
		<script src="<%=path%>/js/diqu.js"></script>
		<SCRIPT type="text/javascript">
			$(function(){
				$("#selectall").click();
			});
		</SCRIPT>
		
	</head>

	<body>
   <%@ include file="/admin/topmenu.jsp" %>
<SCRIPT type="text/javascript">showwhere("coursetop",2)</SCRIPT>
		<div class="admin">

			<div class="panel admin-panel">
				<div class="panel-head">
					讲师列表
				</div>
				
				<form id="form2" method="post" action="teacher!deletebyid.action">
					<div class="padding border-bottom">
					
						<input type="button" id="selectall"
							class="button button-small checkall" checkfor="ids" value="全选" />
						<input type="button" onclick="submit2();"
							class="button button-small border-yellow" value="批量删除" />
						
					</div>

					<table class="table table-hover" style="margin-top: 20px;">
						<tr>
							<th width="50">
								选择
							</th>
							<th width="100" style="">
								照片
							</th>
							<th width="60" style="">
								讲师
							</th>
							<th width="100" style="">
								排序
							</th>
							<th width="80"  style="">
								操作
							</th>
						</tr>

						<s:iterator value="teachers" >

							<tr>
								<td>
									<input type="checkbox" class="choose" name="ids"
										value="<s:property value="id"/>" />
								</td>
								
								<td style="">
									<s:if test="img.substring(0,4)=='http'">
										<img height="70" width="70" src="<s:property value="img"/>" />
									</s:if>
									<s:else>
										<img height="70" width="70" src="<%=path%>/<s:property value="img"/>" />
									</s:else>
								</td>
								
								<td style="">
									<s:property value="name"/>
								</td>
								<td style="">
									<input id="seq<s:property value="id"/>" name="teacher.seq" type="text" class="input" style="width: 50%;float: left;" value="<s:property value="seq"/>" />
									<div onclick="location='teacher!seq.action?teacher.id=<s:property value="id"/>&seq='+$('#seq<s:property value="id"/>').val()" style="float: left;height: 34px;padding-top: 8px;" class="button border-blue button-little">交换排序</div>
								</td>
								
								<td style="">
									<a class="button border-blue button-little"
										href="teacher!theteacher.action?teacher.id=<s:property value="id"/>" />查看</a>
									<a class="button border-blue button-little"
										href="teacher!toupdate.action?teacher.id=<s:property value="id"/>" />修改</a>
									<a class="button border-yellow button-little"
										href="teacher!deletebyid.action?ids=<s:property value="id"/>"
										onclick="{if (window.confirm('确认删除?')){return true;}else{return false;}}">删除</a>
								</td>
							</tr>

						</s:iterator>

					</table>
				</form>
				<div class="panel-foot text-center">
					<ul class="pagination">
						<li>
							<s:if test="page==1">
								<a href="#">上一页</a>
							</s:if>
							<s:else>
								<a href="teacher!findAllTeacher.action?page=${page-1}">上一页</a>
							</s:else>
						</li>
					</ul>

					<ul class="pagination pagination-group">
						<s:iterator begin="1" end="allpage" var="i">
							<s:if test="#i==page">

								<li class="active">
									<a href="teacher!findAllTeacher.action?page=<s:property value="#i"/>"><s:property
											value="#i" /> </a>
								</li>
							</s:if>
							<s:else>

								<li>
									<a href="teacher!findAllTeacher.action?page=<s:property value="#i"/>"><s:property
											value="#i" /> </a>
								</li>
							</s:else>
						</s:iterator>
					</ul>


					<ul class="pagination">
						<li>
							<s:if test="page==allpage">
								<a href="#">下一页</a>
							</s:if>
							<s:else>
								<a href="teacher!findAllTeacher.action?page=${page+1}">下一页</a>
							</s:else>
						</li>
					</ul>
				</div>
			</div>
			<br />
		</div>

		<script type="text/javascript">
			function submit2() {
				if (confirm("确认删除选定的数据？")) {
					form2.submit();
				} else {
					return false;
				}
			}

			function submit3() {
				$("#xuanze").val("1");
				
				form2.submit();
				}
			function submit4() {
				$("#xuanze").val("2");
				
				form2.submit();
				}
		</script>
	</body>
</html>