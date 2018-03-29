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
		<link rel="stylesheet" type="text/css" href="../My97DatePicker/myCSS.css" />
		<script type="text/javascript" src="../My97DatePicker/WdatePicker.js"></script>
		<script src="../js/jquery.js"></script>
		<script src="../js/pintuer.js"></script>
		<script src="../js/admin.js"></script>
		<SCRIPT type="text/javascript">
			$(function(){
				$("#selectall").click();
			});
		</SCRIPT>
		
	</head>

	<body>
   <%@ include file="/admin/topmenu.jsp" %>
	<SCRIPT type="text/javascript">showwhere("ordertop",0)</SCRIPT>
		<div class="admin">
			<div class="panel admin-panel">
				
				<div class="panel-head" style="height:70px">
				  <div class="padding line-middle"  style="text-align: center">
						<form method="post" action="order!findbytime.action" class="form-inline" >
							<div class="form-group">
								<div class="label">
									<label for="username">
										开始时间:
									</label>
								</div>
								&nbsp;
								<div class="field">
									<input name="time1" value="${time1}" id="startTime" type="text" class="input input-auto" size="35"
										onFocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',maxDate:'#F{$dp.$D(\'endTime\')}'})"
										placeholder="请输入开始时间" />
								</div>
							</div>
							&nbsp;&nbsp;
							<div class="form-group">
								<div class="label">
									<label for="password">
										结束时间:
									</label>
								</div>
								&nbsp;
								<div class="field">
									<input name="time2" value="${time2}" id="endTime" type="text" class="input" size="35"
										onFocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'#F{$dp.$D(\'startTime\')}',maxDate:'%y-%M-%d %H:%m:%s'})"
										placeholder="请输入结束时间" />
								</div>
							</div>
							<button class="button bg-sub button-small" name="cx" onclick="return getResult()">
								查看
							</button>
	
						</form>
				</div>
			</div>
			<div class="panel-head">
					<div class="line-middle">
						<form method="post"  action="order!findbyoid.action" enctype="multipart/form-data">
							<div class="x4" style="text-align: right;padding-top: 2px;">
								
							</div>
							<div class="x3">
			                    <div>
			                    	<input style="display: inline;" class="input" name="keyword" type="text"
			                    			placeholder="请输入订单号" value="${keyword}" />
			                    </div>
							</div>
							<button  type="submit" class="button bg-blue">
								立即搜索
							</button>
						</form>
						
					</div>
			</div>
				
				
					<div class="padding border-bottom" style="height: 50px;">
						<div style="" onclick="location='<%= path %>/admin/order/order!findAll.action'" class="button button-small border-yellow">全部订单</div>
						<div style="margin-left: 10px" onclick="location='<%= path %>/admin/order/order!findAll.action?type=0'" class="button button-small border-yellow">待付款订单</div>
						<div style="" onclick="location='<%= path %>/admin/order/order!findAll.action?type=1'" class="button button-small border-yellow">已完成订单</div>
						<div style="" onclick="location='<%= path %>/admin/order/order!findAll.action?type=2'" class="button button-small border-yellow">退款订单</div>
						
						<div style="float: right;" class="button button-small border-yellow"  > 已收入 ${allprice} 元</div>
					</div>

					<table class="table table-hover" style="margin-top: 20px;">
						<tr>
							<th min-width="80" style="">
								订单号
							</th>
							<th min-width="100" style="">
								购买人
							</th>
							
							<th min-width="100" style="">
								订单价格
							</th>
							<th min-width="60" style="">
								商品图片
							</th>
							<th min-width="60" style="">
								商品分类
							</th>
							<th min-width="60" style="">
								商品名称
							</th>
							<th min-width="60" style="">
								下单时间
							</th>
							<th min-width="60" style="">
								订单状态
							</th>
							<th min-width="100" style="">
								操作
							</th>
						</tr>

						<s:iterator value="order2s">

							<tr>
								
								<td style="">
									<s:property value="oid"/>
								</td>
								
								<td style="" >
								<a href="team!toUser.action?team.id=<s:property value="teamid"/>">
									<s:property value="team"/>
									
									</a>
								</td>
								
								
								<td style="">
									<s:property value="price"/>
								</td>
								
								<td style="">
									<img height="50" width="50" src="<%=path%>/<s:property value="courseimg"/>" />
								</td>
								<td style="">
									<s:if test="type==0">业务</s:if>
									<s:if test="type==1">商标</s:if>
									
								</td>
								<td style="">
									<s:property value="coursetitle"/>
								</td>
								
								<td style="">
								
									<s:property value="time1"/>
								
								</td>
								<td style="">
									<s:if test="status==0">未付款</s:if>
									<s:if test="status==1">已付款</s:if>
									<s:if test="status==2">
										<s:if test="tuikuanstatus==3">
										<a class="button border-blue button-little"	href="<%=path %>/admin/order/order!tongyi.action?order2.id=<s:property value="id"/>" />审核通过</a>
										<a class="button border-blue button-little"	href="<%=path %>/admin/order/order!jujue.action?order2.id=<s:property value="id"/>" />审核不通过</a>
										</s:if><s:else>
												<s:if test="tuikuanstatus==0">退款中</s:if>
												<s:if test="tuikuanstatus==1">已完成退款</s:if>
												<s:if test="tuikuanstatus==2">拒绝退款</s:if>
											
										</s:else>
									</s:if>
								
								</td>
								<td style="">
									
									<s:if test="#session.admin.quanxian=='supermen'">
										<a class="button border-red button-little" onclick="{if (window.confirm('删除订单后将无法恢复，确认删除?')){location='order!deleteById.action?deid=<s:property value="id"/>';}else{return false;}}"
											/>删除</a>
									</s:if>
								</td>
							</tr>

						</s:iterator>

					</table>
				<div class="panel-foot text-center">
					<ul class="pagination">
						<li>
							<s:if test="page==1">
								<a href="#">上一页</a>
							</s:if>
							<s:else>
								<a href="order!findAll.action?type=${type}&page=${page-1}">上一页</a>
							</s:else>
						</li>
					</ul>

					<ul class="pagination pagination-group">
						<s:iterator begin="1" end="allpage" var="i">
							<s:if test="#i==page">

								<li class="active">
									<a href="order!findAll.action?type=${type}&page=<s:property value="#i"/>"><s:property
											value="#i" /> </a>
								</li>
							</s:if>
							<s:else>

								<li>
									<a href="order!findAll.action?type=${type}&page=<s:property value="#i"/>"><s:property
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
								<a href="order!findAll.action?type=${type}&page=${page+1}">下一页</a>
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
			new PCAS("team.province","team.city");
		</script>
	</body>
</html>