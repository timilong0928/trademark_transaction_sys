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
<SCRIPT type="text/javascript">showwhere("yewutop",0)</SCRIPT>
<div class="admin">
	
	
	<div class="panel">
  <div class="panel-head">业务管理</div>
  <div class="panel-body">
  		
  <table class="table table-hover">
        	<tr>
        	<th width="200">业务id</th>
        	<th width="200">主图</th>
        	<th width="300">标题</th>
        	<th width="300">业务价格</th>
        	<th width="300">业务小项价格</th>
        	<th width="300">销售量</th>
        	<th width="400">操作</th>
        	</tr>
        	
        	<s:iterator value="yewus">
           
            	
              	<tr>  
              	  <td>${id}</td>
	              <td><img height="70" width="100" src="<%=request.getContextPath() %>/<s:property value="img"/>" /></td>
	             	
	                <td>${biaoti}</td>
	             	<td>${price}</td>
	             	<td>${xiaoxiang}</td>
	             	<td>${xiaoshounum }</td>
	             	
	              <td>
	              <a class="button border-blue button-little"
							href="yewu!look.action?yewu.id=<s:property value="id"/>" />查看</a>
					<a class="button border-red button-little"
										href="yewu!xiugai.action?yewu.id=<s:property value="id"/>" />修改</a>					
	               <a class="button border-blue button-little" href="yewu!delete.action?yewu.id=<s:property value="id"/>"
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