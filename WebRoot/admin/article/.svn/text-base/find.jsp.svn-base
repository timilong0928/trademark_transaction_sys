<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
    <link rel="stylesheet" href="<%=path%>/admin/css/pintuer.css">
	<link rel="stylesheet" href="<%=path%>/admin/css/admin.css">
	<script src="<%=path%>/admin/js/jquery.js"></script>
	<script src="<%=path%>/admin/js/pintuer.js"></script>
	<script src="<%=path%>/admin/js/admin.js"></script>
   
</head>

<body>

<%@ include file="/admin/topmenu.jsp" %>
<SCRIPT type="text/javascript">showwhere("articletop",0)</SCRIPT>	
	<div class="admin">
	
	
	<div class="panel">
  <div class="panel-head">
  					<div class="line-middle">
						<form method="post" action="article!searchtitle.action"
							enctype="multipart/form-data">
							<div class="x4" style="text-align: right;padding-top: 2px;">
								<select name="key" class="button button-small border-blue">
			                    		<option value="user">标题</option>
			                    		
			                    </select>
							</div>
							<div class="x3">
			                    <div>
			                    	<input value="${keyword}" style="display: inline;" class="input" name="keyword" type="text" />
			                    </div>
							</div>
							<button  type="submit" class="button bg-blue">
								立即搜索
							</button>
						</form>
						
					</div>
  
  </div>
  <div class="panel-body">
  		
  <table class="table table-hover">
        	<tr>
        	<th width="200">主图</th>
        	<th width="300">标题</th>
        	<th width="300">上传时间</th>
        	
        	<th width="400">操作</th>
        	</tr>
        	
        	<s:iterator value="articles">
           
            	
              	<tr>  
	              <td><img height="70" width="100" src="<%=request.getContextPath() %>/<s:property value="img"/>" /></td>
	             
	                <td>${title}</td>
	             	<td>${time}</td>
	             	
	              <td>
	              <a class="button border-blue button-little"
							href="article!look.action?article.id=<s:property value="id"/>" />查看</a>
					<a class="button border-red button-little"
										href="article!xiugai.action?article.id=<s:property value="id"/>" />修改</a>					
	               <a class="button border-blue button-little" href="article!delete.action?article.id=<s:property value="id"/>"
	             	 onclick="{if (confirm('确认删除?')) {return true;}return false;};"> 
	           		 删除</a>
	              </td>
               </tr>
       
           
            
            </s:iterator>
           
    </table>
  </div>
</div>
</div>


</body>
</html>