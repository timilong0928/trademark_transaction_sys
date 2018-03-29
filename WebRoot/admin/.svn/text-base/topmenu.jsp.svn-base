<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<div class="lefter" style="position: relative; top: 25px;">
	<img src="<%=request.getContextPath()%>/admin/images/18shangbiao.png" width="100" height="40" alt="后台管理系统" />
</div>

<div class="righter nav-navicon" id="admin-nav">
	<div class="mainer">
		<div class="admin-navbar">
			<ul id="maintop" class="nav nav-inline admin-nav">
				<li id="indextop">
					<a  href="<%=request.getContextPath()%>/admin/index.jsp" >开始 </a>
					<ul>
						<li>
							<a href="<%=request.getContextPath()%>/admin/index.jsp">后台首页 </a>
						</li>
						
						<li>
							<a href="<%=request.getContextPath()%>/admin/pruduct/banner!findall.action">轮播管理 </a>
						</li>
						<li>
							<a href="<%=request.getContextPath()%>/admin/user/team!findAll.action">用户和佣金</a> 
						</li>
						
						<li>
							<a href="<%=request.getContextPath()%>/admin/yewu/yewu!find.action">业务管理</a> 
						</li>
						
						<li>
							<a href="<%=request.getContextPath()%>/admin/sb/sb!find.action">分类和商标</a> 
						</li>
						
						<!--<li>
							<a href="<%=request.getContextPath()%>/admin/course/course!findAllCourse.action">课程管理</a>
						</li>
						--><li>
							<a href="<%=request.getContextPath()%>/admin/order/order!findAll.action" >订单和提现 </a>
						</li>
						<li>
							<a href="<%=request.getContextPath()%>/admin/article/article!find.action" >文章管理 </a>
						</li>
						<li>
							<a href="<%=request.getContextPath()%>/admin/admin/shezhi.jsp" >系统设置</a>
						</li>
					</ul>
				</li>
				
				<li id="lunbotop">
					<a href="<%=request.getContextPath()%>/admin/pruduct/banner!findall.action" >轮播管理</a>
					<ul>
						<li>
							<a href="<%=request.getContextPath()%>/admin/pruduct/banner!findall.action">首页轮播</a>
						</li>
						
					</ul>
				</li>
				<li id="teamtop">
					<a href="<%=request.getContextPath()%>/admin/user/team!findAll.action" >
						用户和佣金 </a>
					<ul>
						<li>
						    <a href="<%=request.getContextPath()%>/admin/user/team!findAll.action" >用户列表</a>
						</li>
						<li>	
							<a href="<%=request.getContextPath()%>/admin/user/award!find.action" >佣金设置</a>
						</li>
						<!--<li>
							<a href="<%=request.getContextPath()%>/admin/user/team!toupdatefenxiao.action" >分销页面</a>
						</li>
					--></ul>		
				</li>
				
				<li id="yewutop">
					<a href="<%=request.getContextPath()%>/admin/yewu/yewu!find.action" >业务管理</a>
					
					<ul>
						<li ><a href="<%=request.getContextPath()%>/yewu!find.action" >业务管理</a></li>
						<li ><a href="<%=request.getContextPath()%>/admin/yewu/addyewu.jsp">业务添加</a></li>
						
					</ul>
				</li>
				
				<li id="sbtop">
					<a href="<%=request.getContextPath()%>/admin/sb/sb!find.action" >分类和商标</a>
					
					<ul>
						<li ><a href="<%=request.getContextPath()%>/admin/sb/sb!find.action"  >商标分类</a></li>
						<li ><a href="<%=request.getContextPath()%>/admin/sb/sb!find1.action">商标管理</a></li>
						
					</ul>
				</li>
				
				<!--<li id="coursetop">
					<a href="<%=request.getContextPath()%>/admin/course/course!findAllCourse.action">
						课程管理 </a>
					<ul>
					
					<li ><a href="<%=request.getContextPath()%>/admin/course/course!findAllCourse.action">课程列表</a></li>
					<li ><a href="<%=request.getContextPath()%>/admin/course/course!toAddCourse.action">添加课程</a></li>
					
					<li >
						<s:if test="#session.admin.quanxian=='supermen'">
							<a href="<%=request.getContextPath()%>/admin/course/course!findClassify.action">课程分类</a>
						</s:if>
					</li>
					<li >
						<s:if test="#session.admin.quanxian=='supermen'">
							<a href="<%=request.getContextPath()%>/admin/course/course!alltaocan.action">课程套餐</a>
						</s:if>
					</li>
					
					
					<li ><a href="<%=request.getContextPath()%>/admin/course/course!allcomment.action">课程评论管理</a></li>
					</ul>
				</li>
				
				--><li id="ordertop">
					<a href="<%=request.getContextPath()%>/admin/order/order!findAll.action" >
						订单和提现 </a>
					<ul>
					
					<li ><a href="<%=request.getContextPath()%>/admin/order/order!findAll.action">所有订单</a></li>
					<s:if test="#session.admin.quanxian=='supermen'">
					<li ><a href="<%=request.getContextPath()%>/admin/order/team!findalltixian.action">用户提现</a></li>
					</s:if>
					<!--<li ><a href="<%=request.getContextPath()%>/admin/order/daochu.jsp">导出订单</a></li>
					-->
					</ul>		
				</li>
				<li id="articletop">
					<a href="<%=request.getContextPath()%>/admin/article/article!find.action" >文章管理</a>
					
					<ul>
						<li ><a href="<%=request.getContextPath()%>/admin/article/article!find.action"  >行业新闻</a></li>
						<li ><a href="<%=request.getContextPath()%>/admin/article/add.jsp">添加新闻</a></li>
						<li ><a href="<%=request.getContextPath()%>/admin/article/article!find1.action">红包规则 
						</a></li>
						
					</ul>
				</li>
				<li id="shezhitop">
					<a href="<%=request.getContextPath()%>/admin/admin/shezhi.jsp" >系统设置</a>
					<ul>
						<li>	
							<s:if test="#session.admin.quanxian=='supermen'">
								<a href="<%=request.getContextPath()%>/admin/admin/peizhi!findall.action" >参数设置</a>
							</s:if>
						</li>
						<li>	
							<a href="<%=request.getContextPath()%>/admin/admin/shezhi.jsp" >管理员设置</a>
						</li>
						<!--<s:if test="#session.admin.quanxian=='supermen'">
							<li><a href="<%=request.getContextPath()%>/admin/admin/admin!findAll.action" >讲师列表</a></li>
							<li><a href="<%=request.getContextPath()%>/admin/admin/addadmin.jsp" >添加讲师</a></li>
							
							<li>
								<a href="<%=request.getContextPath()%>/admin/weixin/menu!find.action">菜单设置</a>
							</li>
						
						</s:if>
						 
					--></ul>
				</li>
				<li id="hahatop">
					<a href="<%=request.getContextPath()%>/admin/admin/admin!loginOut.action" >退出</a>
				</li>
				
				
			</ul>
		</div>
			
	

		<div class="admin-bread">
			<span>您好，管理员，欢迎您的光临。</span>
			<ul id="textbread" class="bread">
				<li><a href="<%=request.getContextPath()%>/admin/index.jsp" class="icon-home">开始</a></li>
			</ul>
		</div>
	</div>
	<input type="hidden" id="alertmsg" value="${msg}">
</div>
<script type="text/javascript">
	function showwhere(id,num,last){
		var $litp=$("<li></li>");
		if(last){
			var $a=$("<a href='#'>"+last+"</a>");
			$("#"+id).addClass("active").find("li").eq(num).addClass("active");
			$("#textbread").append($litp.append($("#"+id+" >a").clone()));
			$("#textbread").append($("<li></li>").append($("#"+id).find("li").eq(num).find("a").clone()));
			$("#textbread").append($a);
		}else{
			$("#"+id).addClass("active").find("li").eq(num).addClass("active");
			$("#textbread").append($litp.append($("#"+id+" >a").clone()));
			$("#textbread").append($("#"+id).find("li").eq(num).find("a").clone());
		}
		var msg=$("#alertmsg").val().trim();
		if(msg!=""){
			alert(msg);
		}
	}
	
</script>