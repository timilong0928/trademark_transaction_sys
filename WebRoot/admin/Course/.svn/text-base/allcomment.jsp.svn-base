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
		<SCRIPT type="text/javascript">
			$(function(){
				$("#selectall").click();
			});
			function sousuo2(){
				var keyword = $("#keyword").val();
				window.location.href="course!sousuocomment.action?keyword="+keyword; //JS跳转页面
			}
			 function huifu1(){
					var key = $("#key").val();
					var huifu = $("#huifu").val();
					if(key=="all")
						window.location.href="course!allcomment.action?huifu="+huifu; //JS跳转页面
					else{
						$(".nohuifu").css("display","");
						$(".huifu").css("display","");
						if(huifu==0)
							$(".huifu").css("display","none");
						else if(huifu==1)
							$(".nohuifu").css("display","none");
							
					}
			}
				
			function chakan(name){
				$("#1"+name).css("display","none");
				$("#2"+name).css("display","");
			}
			function shouqi(name){
				$("#1"+name).css("display","");
				$("#2"+name).css("display","none");
			}
			
			function huifu2(id){
					var huifu = $("#huifuneirong"+id).val();
					alert(huifu);
					if(huifu!=""){
						$.ajax({
				             type :"post",  
				             url : "course!huifucomment.action",//路径  
				             data : {"comment.huifu":huifu,"comment.id":id}, 
				             success : function(data) {//返回数据根据结果进行相应的处理  
								window.location.href=window.location.href;
				             }
				        });
					}else{
						alert("请输入回复内容");
					}
			}
			
		</SCRIPT>
		
	</head>
<body>
<%@ include file="/admin/topmenu.jsp"%>
		<SCRIPT type="text/javascript">showwhere("coursetop",4)</SCRIPT>
	<div class="admin">
    	<div class="panel admin-panel">
    	<div class="panel-head"><strong>评论列表</strong></div>
    	
	 	<form id="form" method="post" action="course!deletecommentbyid.action">
        <div class="padding border-bottom">
        	<div class="line-middle">
        	 <div class="x2">
         	<input type="button" id="selectall"
			class="button button-small checkall"  checkfor="ids" value="全选" />
            
			<input type="button" onclick="submit();"
				class="button button-small border-yellow"  value="批量删除" />
			</div>
          	<div class="x2">
          		<input type="hidden" value="${id1}" id="courseid">
          		<input type="hidden" value="${key}" id="key">
				<select  class="button button-small border-blue" id="huifu" onchange="huifu1();" >
						<s:if test="huifu==0">
                    		<option >全部</option>
                    		<option selected="selected"  value="0">未回复</option>
                    		<option value="1">已回复</option>
                    	</s:if><s:elseif test="huifu==1">
                    		<option >全部</option>
                    		<option value="0">未回复</option>
                    		<option  selected="selected"  value="1">已回复</option>
                    	</s:elseif><s:else>
                    		<option >全部</option>
                    		<option value="0">未回复</option>
                    		<option value="1">已回复</option>
                    	</s:else>
	            </select>
	            <SCRIPT type="text/javascript">
	           
	            </SCRIPT>
			</div>
			
				<div class="x3">
					<input style="display: inline; width: 100%;" class="input" value="${keyword}" id="keyword" type="text"  placeholder="请输入评论内容" />
				</div>
				<div class="x2">
						<div style="" onclick="sousuo2();" class="button bg-blue">
								立即搜索
						</div>
				</div>
            </div>
       
        <table class="table table-hover">
        
        	<tr>
        		<th width="40">选择</th>
	        	<th width="100">课程标题</th>
	        	<th width="80">课时名</th>
	        	<th width="100">评论用户</th>
	        	<th width="200">评论内容</th>
	        	<th width="200">老师回复</th>
	        	<th width="100">评论时间</th>
	        	<th width="50">操作</th>
        	</tr>
        	
         	<s:iterator value="comments">
         	<s:if test="huifu==null">
        		<tr class="nohuifu">
        	</s:if><s:else>
        		<tr class="huifu">
        	</s:else>
	        	<td><input type="checkbox" class="choose" name="ids" value="<s:property value="id"/>" /></td>
	            <td>
		            <A href="course!toCourse.action?course.id=${courseid}">
		           		<input type="button" class="button button-small border-blue" style="border: 0;" value="${coursename}" />
		            </A>
	            </td>
	            <td>
	            	<A href="course!allcontent.action?course.id=${courseid}">
	            		<input type="button" class="button button-small border-blue" style="border: 0;" value="${contentname}" />
	            	</A>
	            </td>
	            <td>
		            <A href="team!toUser.action?team.id=${teamid}">
		            	<input type="button" class="button button-small border-blue" style="border: 0;" value="${name}"/>
		            </A>
	            </td>
	            
	            <td>
	           		<s:if test="content.length()>30">
	           			<div id="1content${id}">
	           			<s:property value="content.substring(0,30)"/>...
	           			<input  onclick="chakan('content${id}');" type="button" class="button button-small border-blue" style="border: 0;" value="查看全部" />
	           			</div>
	           			<div id="2content${id}" style="display: none">
	           				${content}
	           			<input  onclick="shouqi('content${id}');" type="button" class="button button-small border-blue" style="border: 0;" value="收起" />
	     					
	           			</div>
	            	</s:if><s:else>
	            		${content}
	            	</s:else>
	            </td>
	            
		        <td>
		        	<s:if test="huifu==null">
		        			<div id="1quhuifu${id}">
		        				未回复 <input  onclick="chakan('quhuifu${id}');" type="button" class="button button-small border-blue" style="border: 0;" value="编写回复内容" />
		            		</div>
		            		<div id="2quhuifu${id}" style="display: none">
		            			<textarea rows="5" cols="20" style="width: 100%;" id="huifuneirong${id}"></textarea>
		            			<input  onclick="huifu2(${id})" type="button" class="button button-small border-blue" style="border: 0;" value="发表回复" />
		            		</div>
		            </s:if>
		            <s:else>
			            <s:if test="huifu.length()>30">
		           			<div id="1huifu${id}">
		           			<s:property value="huifu.substring(0,30)"/>...
		           			<input  onclick="chakan('huifu${id}');" type="button" class="button button-small border-blue" style="border: 0;" value="查看全部" />
		           			</div>
		           			<div id="2huifu${id}" style="display: none">
		           					${huifu}
		           				<input  onclick="shouqi('huifu${id}');" type="button" class="button button-small border-blue" style="border: 0;" value="收起" />
		           			</div>
		            	</s:if><s:else>
		            		${huifu}
		            	</s:else>
		            </s:else>
	            </td>
	            <td><s:property value="time"/></td>
	            <td>
	           		<a class="button border-yellow button-little" href="course!deletecommentbyid.action?ids=<s:property value="id"/>" />删除</a>
	           		</td>
       		</tr>
            </s:iterator>
        </table>
        
        </div>
        </form>
         
        <div class="panel-foot text-center">
					<ul class="pagination">
						<li>
							<s:if test="page==1">
								<a href="#">上一页</a>
							</s:if>
							<s:else>
								<a href="course!allcomment.action?page=${page-1}&huifu=${huifu}">上一页</a>
							</s:else>
						</li>
					</ul>
					
					<ul class="pagination pagination-group">
						<s:iterator begin="1" end="allpage" var="i">
							<s:if test="#i==page">

								<li class="active">
									<a href="course!allcomment.action?page=<s:property value="#i"/>&huifu=${huifu}"><s:property
											value="#i" /> </a>
								</li>
							</s:if>
							<s:else>

								<li>
									<a href="course!allcomment.action?page=<s:property value="#i"/>&huifu=${huifu}"><s:property
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
								<a href="course!allcomment.action?page=${page+1}&huifu=${huifu}">下一页</a>
							</s:else>
						</li>
					</ul>
				</div>
        </div>
    </div>
   
    <br />

</body>
</html>