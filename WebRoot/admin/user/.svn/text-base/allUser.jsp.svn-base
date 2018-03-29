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
		<%@ include file="/admin/topmenu.jsp"%>
		<SCRIPT type="text/javascript">showwhere("teamtop",0)</SCRIPT>
		<div class="admin">

			<div class="panel admin-panel">
				<div class="panel-head">
					<div class="line-middle">
						<form method="post" action="team!searchKeyword.action"
							enctype="multipart/form-data">
							<div class="x4" style="text-align: right;padding-top: 2px;">
								<select name="key" class="button button-small border-blue">
			                    		<option value="user">昵称</option>
			                    		<!--<option value="phone">电话号</option>	
			                    		
			                    --></select>
							</div>
							<div class="x3">
			                    <div>
			                    	<input style="display: inline;" class="input" name="keyword" type="text" />
			                    </div>
							</div>
							<button  type="submit" class="button bg-blue">
								立即搜索
							</button>
						</form>
						
					</div>
				</div>

				
					
					<table class="table table-hover" style="margin-top: 20px;">
						<tr>
							
							<th width="80" style="">
								头像
							</th>
							<th width="60" style="">
								昵称
							</th>
							<!--<th width="60" style="">
								电话
							</th>
							
							--><th width="60" style="">
								可用佣金
							</th>
							<th width="60" style="">
								总佣金
							</th>
							
							<th width="60" style="">
								上一级
							</th>
							
							<th width="80" style="">
								操作
							</th>
						</tr>

						
						<s:iterator value="teams" var="team">

							<tr>
								<td style="">
									<s:if test="img.substring(0,4)=='http'">
										<img height="70" width="70" src="<s:property value="img"/>" />
									</s:if>
									<s:elseif test='img!=null&&img!="" '>
										<img height="70" width="70" src="<%=path%>/<s:property value="img"/>" />
									</s:elseif>
									<s:else>
										<img height="70" width="70"
											src="<%=path%>/${team.img}" />									
									</s:else>
								</td>
								<td style="">
									<s:property value="nickName" />
								</td>
								<!--<td style="">
									<s:if test="phone==null||phone==''">
										<span style="color:#888888">无</span>
									</s:if><s:else>
										<s:property value="phone" />
									</s:else>
								</td>
								
								--><td style=""   >
									<s:property value="yongjin" />
								</td>
								<td style=""   >
									<s:property value="allyongjin" />
								</td>
								
								
								<td style=""   >
								   <s:if test="yijiname==null||yijiname==''">
									无
									</s:if>
									<s:else><a class="button border-blue button-little"
										href="team!toUser.action?team.id=<s:property value="yijiId"/>" />
										<s:property value="yijiname" /></a>
									</s:else>
								</td>
								
								
								
                               <td style="">
									<a class="button border-blue button-little"
										href="team!toUser.action?team.id=<s:property value="id"/>" />查看</a>
									
									<a class="button border-blue button-little"
										href="team!findxiaji.action?team.id=<s:property value="id"/>" />查看下级</a><!--

									<a class="button border-yellow button-little"
										href="team!deletebyid.action?ids=<s:property value="id"/>"
										onclick="{if(window.confirm('确认删除?')) {return true;} else {return false;}}";>
										删除</a>
								--></td>
							</tr>
	
						</s:iterator>
					</table>
				
				
					<div class="panel-foot text-center">
						<s:if test="status!=null">
							<ul class="pagination">
								<li>
									<s:if test="page==1">
										<a href="#">上一页</a>
									</s:if>
									<s:else>
										<a href="team!findAll1.action?page=${page-1}">上一页</a>
									</s:else>
								</li>
							</ul>
	
							<ul class="pagination pagination-group">
								<s:iterator begin="1" end="allpage" var="i">
									<s:if test="#i==page">
	
										<li class="active">
											<a href="team!findAll1.action?page=<s:property value="#i"/>"><s:property
													value="#i" /> </a>
										</li>
									</s:if>
									<s:else>
	
										<li>
											<a href="team!findAll1.action?page=<s:property value="#i"/>"><s:property
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
										<a href="team!findAll1.action?page=${page+1}">下一页</a>
									</s:else>
								</li>
							</ul>
						</s:if>
						
						<s:else>
							<ul class="pagination">
								<li>
									<s:if test="page==1">
										<a href="#">上一页</a>
									</s:if>
									<s:else>
										<a href="team!findAll.action?page=${page-1}">上一页</a>
									</s:else>
								</li>
							</ul>
	
							<ul class="pagination pagination-group">
								<s:iterator begin="1" end="allpage" var="i">
									<s:if test="#i==page">
	
										<li class="active">
											<a href="team!findAll.action?page=<s:property value="#i"/>"><s:property
													value="#i" /> </a>
										</li>
									</s:if>
									<s:else>
	
										<li>
											<a href="team!findAll.action?page=<s:property value="#i"/>"><s:property
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
										<a href="team!findAll.action?page=${page+1}">下一页</a>
									</s:else>
								</li>
							</ul>
						</s:else>
					</div>
			  </div>
			<br />
		</div>

	</body>
</html>