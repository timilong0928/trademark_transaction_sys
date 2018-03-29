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
<SCRIPT type="text/javascript">showwhere("coursetop",0)</SCRIPT>
		<div class="admin">

			<div class="panel admin-panel">
				<div class="panel-head">
					<div class="line-middle">
					<s:if test="#session.admin.quanxian=='supermen'">
						<form method="post"  action="course!searchTitleWord.action" enctype="multipart/form-data">
							<%--<div class="x4" style="text-align: right;padding-top: 2px;">
								<select name="key" class="button button-small border-blue">
			                    		<option value="title">课程名称</option>
			                    		<option value="teacher">讲师名称</option>
			                    		<option value="author">作者名称</option>
			                    </select>
							</div>
							--%>
							<div class="x3">
							</div>
							<div class="x3">
			                    <div>
			                    	<input style="display: inline;" class="input" name="keyword" type="text" placeholder="按标题搜索" />
			                    </div>
							</div>
							<button  type="submit" class="button bg-blue">
								立即搜索
							</button>
						</form>
						</s:if>
					</div>
					
				</div>
				<form id="form5"  method="post" action="course!findAllCourse.action">
					<div class="padding border-bottom">
						<select name="classify2id" class="button button-small border-blue">
                    			<option  >全部分类</option>
							<s:iterator value="classify2s">
								<s:if test="id==classify2id">
                    				<option selected="selected" value="${id}">${name}</option>
								</s:if><s:else>
                    				<option value="${id}">${name}</option>
								</s:else>
							</s:iterator>
	                    </select>
						<select name="teacherid" class="button button-small border-blue">
								<option selected="selected">全部讲师</option>
							<s:iterator value="teachers">
								<s:if test="id==teacherid">
                    				<option selected="selected" value="${id}">${rname}</option>
								</s:if><s:else>
                    				<option value="${id}">${rname}</option>
								</s:else>
							</s:iterator>
	                    </select>
						<select name="status" class="button button-small border-blue" >
								<s:if test="status==0">
									<option >全部</option>
		                    		<option selected="selected" value="0">上架课程</option>
		                    		<option value="1">活动课程</option>
		                    		<option value="2">已下架</option>
								</s:if><s:elseif test="status==1">
									<option >全部</option>
		                    		<option value="0">上架课程</option>
		                    		<option selected="selected" value="1">活动课程</option>
		                    		<option value="2">已下架</option>
								</s:elseif><s:elseif test="status==2">
									<option >全部</option>
		                    		<option value="0">上架课程</option>
		                    		<option value="1">活动课程</option>
		                    		<option selected="selected" value="2">已下架</option>
								</s:elseif><s:else>
									<option selected="selected">全部</option>
		                    		<option value="0">上架课程</option>
		                    		<option value="1">活动课程</option>
		                    		<option value="2">已下架</option>
		                    	</s:else>
	                    </select>
	                    
						<input type="submit" class="button button-small border-yellow" value="筛选" />
					</div>
				</form>
				<form id="form2" method="post" action="course!addtaocan1.action">
				<s:if test="#session.admin.quanxian=='supermen'">
					<div class="padding border-bottom">
						<input type="button" id="selectall"
							class="button button-small checkall" value="全选" />
						<a href="/admin/course/course!toAddCourse.action"><input type="button"
								class="button button-small border-green" value="添加课程 " /> </a>
						<input type="submit" class="button button-small border-yellow" value="添加课程到套餐" />
						<input type="button" class="button button-small border-green" value="添加套餐" onclick="location='course!addtaocan2.action'" />
					</div>
					</s:if>
					<table class="table table-hover" style="margin-top: 20px;">
						<tr>
							<th width="10">
								选择
							</th>
							<th width="60" style="">
								封面
							</th>
							<th width="80" style="">
								标题
							</th>
							<th width="30" style="">
								状态
							</th>
							<th width="60" style="">
								讲师
							</th>
							<th width="60" style="">
								课时
							</th>
							<th width="60" style="">
								观看次数
							</th>
							<th width="60" style="">
								购买人数
							</th>
							<th width="60" style="">
								价格(￥)
							</th>
							<th width="60" style="">
								上传时间
							</th>
							<th width="150" style="">
								操作
							</th>
						</tr>

						<s:iterator value="courses" var="course">

							<tr>
								<td>
									<input type="checkbox" class="choose" name="courseids"
										value="<s:property value="id"/>" />
								</td>
								
								<td style="">
									<img height="70" width="70" src="<%=path%>/<s:property value="img"/>" />
								</td>
								
								<td style="width:80px">
									<s:property value="title"/>
								</td>
								
								<td style="">
									<s:if test="status==0">
										普通
									</s:if>
									<s:elseif test="status==1">
										<span style="color:red;">活动</span>
									</s:elseif>
									<s:else>
										<span style="color:#888888;">下架</span>
									</s:else>
								</td>
								
								<td style="">
									${teacher}
								</td>
								
								<td style="">
									${period}
								</td>
								<td style="">
									${readNum}
								</td>
								<td style="">
									${payNum}
								</td>
								
								<td style="">
									${money}<s:if test="status==1"><span style="color:#888888;">(原价：${twomoney})</span></s:if>
								</td>
								
								<td style="">
									<s:property value="time"/>
								</td>
								
								
								<td style="">
									<a class="button border-blue button-little" href="course!toCourse.action?course.id=<s:property value="id"/>" />查看</a>
									<a class="button border-yellow button-little" href="course!thecoursecomment.action?id1=<s:property value="id"/>" />评论</a>
									<a class="button border-blue button-little" href="course!allcontent.action?course.id=<s:property value="id"/>" />查看课时</a>
									<a class="button border-blue button-little" href="course!toUpdateCourse.action?course.id=<s:property value="id"/>" />修改</a>
									<a class="button border-yellow button-little" href="course!deletebyid.action?ids=<s:property value="id"/>"
										onclick="{if (window.confirm('确认删除?')){return true;}else{return false;}}">删除</a>
									<a class="button border-blue button-little" href="course!tixinkc.action?course.id=<s:property value="id"/>"
										onclick="{if (window.confirm('确认通知所有注册用户?')){return true;}else{return false;}}">通知</a>
								</td>
							</tr>

						</s:iterator>

					</table>
				</form>
				
				<div class="panel-foot text-center">
				
						<ul class="pagination">
							<li>
								<s:if test='page==1'>
									<a href="#">上一页</a>
								</s:if>
								<s:else>
									<a href="course!findAllCourse.action?page=${page-1}&teacherid=${teacherid}&classify2id=${classify2id}&status=${status}">上一页</a>
								</s:else>
							</li>
						</ul>
	
						<ul class="pagination pagination-group">
							<s:iterator begin="1" end="allpage" var="i">
								<s:if test="#i==page">
									<li class="active">
										<a href="course!findAllCourse.action?page=<s:property value="#i"/>&teacherid=${teacherid}&classify2id=${classify2id}&status=${status}"><s:property
												value="#i" /> </a>
									</li>
								</s:if>
								
								<s:else>
									<li>
										<a href="course!findAllCourse.action?page=<s:property value="#i"/>&teacherid=${teacherid}&classify2id=${classify2id}&status=${status}"><s:property
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
									<a href="course!findAllCourse.action?page=${page+1}&teacherid=${teacherid}&classify2id=${classify2id}&status=${status}">下一页</a>
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