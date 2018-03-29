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
<SCRIPT type="text/javascript">showwhere("sbtop",0)</SCRIPT>
<div class="admin">
	
	
	<div class="panel">
  <div class="panel-head">分类管理</div>
  <div class="panel-body">
  		<a href="<%=request.getContextPath()%>/admin/sb/addfenlei.jsp">
            <input type="button" class="button button-small border-green" value="添加商标分类" /></a>
  <table class="table table-hover">
        	<tr>
        	<th width="200">类别</th>
        	<th width="200">图标</th>
        	<th width="200">修改</th>
        	<th width="300">标题</th>
        	<th width="300" >操作</th>
        	</tr>
        	
        	<s:iterator value="fenleis">
        	
           <form action="sb!update.action" method="post" enctype="multipart/form-data">
            	 <input type="hidden" value="<s:property value="id"/>" name="fenlei.id"/>
              	<tr>  
              		<td><div style="margin-top: 20px"   /><s:property value="id"/></div></td> 
	              <td><img height="70" width="100" src="<%=request.getContextPath() %>/<s:property value="img"/>" /></td>
	            
	              <td>
	              	  <div class="field">
	                    	<a class="button input-file" href="javascript:void(0);">+ 修改图标<input size="100" type="file" name="file" data-validate="required:请选择上传文件,regexp#.+.(jpg|jpeg|png|gif)$:只能上传jpg|gif|png格式文件" /></a>
	                  </div>
	              </td>
	                 
	              <td><input name="fenlei.name" type="text" class="input" value="<s:property value="name"/>" /></td>
	              <td>
	                
	           	    <a class="button border-blue button-little" 
	           	    		href="sb!look.action?fenlei.id=<s:property value="id"/>">  查看</a> 
	           		
	           		 <button  type="submit" class="button border-red button-little">更新</button>
	           		 <!--<a class="button border-blue button-little" href="sb!delete.action?fenlei.id=<s:property value="id"/>"
	             	 onclick="{if (confirm('确认删除?')) {return true;}return false;};"> 
	             	 
	           		 删除</a>
	              --></td>
               </tr>
        </form>
           
            
            </s:iterator>
           
    </table>
  </div>
</div>
</div>


</body>
</html>