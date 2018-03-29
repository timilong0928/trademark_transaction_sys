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
				

				<form id="form2" method="post" action="team!deletebyid.action">
					


					<table class="table table-hover" style="margin-top: 20px;">
						<tr>
							
							<th width="50">
								分销级别
							</th>
							<th width="60" style="">
								头像
							</th>
							<th width="60" style="">
								昵称
							</th>
							
							<th width="60" style="">
								电话
							</th>
							<th width="60" style="">
								可用积分
							</th>
							<th width="60" style="">
								可用佣金
							</th>
							
							
							
                        </tr>

						
						
                          <!--下一级显示 -->
                          
                           <s:iterator value="allyiji">
                             <tr>
							
								
								<td style=""   >
									下一级用户
								</td>

								<td style="">
									<s:if test="img.substring(0,4)=='http'">
										<img height="70" width="70" src="<s:property value="img" />" />
									</s:if>
									<s:elseif test='img!=null&&img!="" '>
										<img height="70" width="70"
											src="<%=path%>/<s:property value="img" />" />
									</s:elseif>
									<s:else>
										<img height="70" width="70"
											src="<%=path%>/${award.img}" />									
									</s:else>
								</td>
								<td style="">
								      <a class="button border-blue button-little"
										href="team!toUser.action?team.id=<s:property value="id"/>" />
										<s:property value="nickName" /></a>
								</td>
								
								<td style=""   >
									<s:property value="phone" />
								</td>
								
								<td style=""   >
									<s:property value="point" />
								</td>
								<td style=""   >
									<s:property value="yongjin" />
								</td>
								
							</tr>
                          </s:iterator>
                          
                          <!--下二级显示 -->
                          
                           <s:iterator value="allerji">
                             <tr>
							    <td style=""   >
									下二级用户
								</td>

								<td style="">
									<s:if test="img.substring(0,4)=='http'">
										<img height="70" width="70" src="<s:property value="img" />" />
									</s:if>
									<s:elseif test='img!=null&&img!="" '>
										<img height="70" width="70"
											src="<%=path%>/<s:property value="img" />" />
									</s:elseif>
									<s:else>
										<img height="70" width="70"
											src="<%=path%>/${award.img}" />									
									</s:else>
								</td>
								
								<td style="">
								      <a class="button border-blue button-little"
										href="team!toUser.action?team.id=<s:property value="id"/>" />
										<s:property value="nickName" /></a>
								</td>
								
								<td style=""   >
									<s:property value="phone" />
								</td>
								<td style=""   >
									<s:property value="point" />
								</td>
								<td style=""   >
									<s:property value="yongjin" />
								</td>
								
							</tr>
                          </s:iterator>
                         
					</table>
				</form>
				

				
				
					
			
			
			</div>
			<br />
		</div>

	</body>
</html>