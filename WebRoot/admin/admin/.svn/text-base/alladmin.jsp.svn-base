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
		<link rel="stylesheet" href="<%=path%>/admin/css/pintuer.css">
		<link rel="stylesheet" href="<%=path%>/admin/css/admin.css">
		<script src="<%=path%>/admin/js/jquery.js"></script>
		<script src="<%=path%>/admin/js/pintuer.js"></script>
		<script src="<%=path%>/admin/js/admin.js"></script>
		<SCRIPT type="text/javascript">
			$(function(){
				$("#selectall").click();
			});
		</SCRIPT>
		
	</head>

	<body>
   <%@ include file="/admin/topmenu.jsp" %>
<SCRIPT type="text/javascript">showwhere("shezhitop",2)</SCRIPT>
		<div class="admin">

			<div class="panel admin-panel">
				
				
				<form id="form" method="post" action="admin!deletebyid.action">
					<div class="padding border-bottom">

						<input type="button" id="selectall"
							class="button button-small checkall" checkfor="ids" value="全选" />
						<input type="button" onclick="if (confirm('确认删除选定的数据？'))return submit();"
							class="button button-small border-yellow" value="批量删除" />

					</div>


					<table class="table table-hover" style="margin-top: 20px;">
						<tr>
							<th width="50">
								选择
							</th>
							<th width="100" style="text-align:center;">
								头像
							</th>
							<th width="100" style="text-align:center;">
								账号
							</th>
							<th width="100" style="text-align:center;">
								姓名
							</th>	
							<th width="100" style="text-align:center;">
								手机
							</th>
							<th width="100" style="text-align:center;">
								操作
							</th>
						</tr>

						<s:iterator value="admins" var="team">

							<tr>
								<td>
									<input type="checkbox" class="choose" name="ids"
										value="<s:property value="id"/>" />
								</td>
								<td style="text-align: center;">
									<s:if test="img.substring(0,4)=='http'">
										<img height="70" width="70" src="<s:property value="img"/>" />
									</s:if>
									<s:else>
										<img style="cursor:pointer" onclick="location='product!findTeamProduct.action?tid=${id}'" height="70" width="70" src="<%=path%>/<s:property value="img"/>" />
									</s:else>
								</td>
								<td style="text-align: center;">
									<s:property value="name"/>
								</td>
								
								<td style="text-align: center;">
									<s:property value="rname"/>
								</td>
								<td style="text-align: center;">
									<s:property value="phone"/>
								</td>
								
								<td style="text-align: center;">
									<a class="button border-blue button-little"
										href="admin!toAdmin.action?admin.id=<s:property value="id"/>" />查看</a>
									<a class="button border-red button-little"
										href="admin!toUpdate.action?admin.id=<s:property value="id"/>" />修改</a>
									<a class="button border-yellow button-little"
										href="admin!deletebyid.action?ids=<s:property value="id"/>"
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
								<a href="admin!findAll.action?page=${page-1}">上一页</a>
							</s:else>
						</li>
					</ul>

					<ul class="pagination pagination-group">
						<s:iterator begin="1" end="allpage" var="i">
							<s:if test="#i==page">

								<li class="active">
									<a href="admin!findAll.action?page=<s:property value="#i"/>"><s:property
											value="#i" /> </a>
								</li>
							</s:if>
							<s:else>

								<li>
									<a href="admin!findAll.action?page=<s:property value="#i"/>"><s:property
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
								<a href="admin!findAll.action?page=${page+1}">下一页</a>
							</s:else>
						</li>
					</ul>
				</div>
			</div>
			<br />
		</div>

		<script type="text/javascript">
			function submit() {
				if (confirm("确认删除选定的数据？")) {
					var choose = document.getElementsByClassName("choose");
					if ($('#selectall').is(':checked')) {
						choose[i].checked = true;
					} else {
						choose[i].checked = false;
		
					}
					document.getElementBy("form").submit();
				} else {
					return false;
				}
			}
		</script>
	</body>
</html>