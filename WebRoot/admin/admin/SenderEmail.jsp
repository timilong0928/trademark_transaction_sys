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
<SCRIPT type="text/javascript">showwhere("shezhitop",3)</SCRIPT>
<div class="admin">
	
	
	<div class="panel">
  <div class="panel-head">邮箱</div>
  <div class="panel-body">
  
           <form action="senderEmail!update.action" method="post" enctype="multipart/form-data">
  			<table class="table table-hover">
        	<tr>
	        	<th width="600">邮箱地址</th>
	        	<th width="600">密码</th>
	        	<th width="600">操作</th>
        	</tr>
           
          	 <tr>
             <td>
                <input type="hidden" value="<s:property value="email.id"/>" name="email.id"/>    
                <input name="email.address" type="text" class="input" value="<s:property value="email.address"/>" />     
             </td>
             <td>
               <input name="email.pwd" type="text" class="input" value="<s:property value="email.pwd"/>" />
             </td>
              <td>
                <button type="submit" class="button button-small bg-blue">提交</button>
              </td>
            </tr>
            
            </table>
            </form>
        <div><span>注意：请确认在修改邮箱服务器的密码后再来修改此处的密码，不允许随便修改数据库里面的邮箱密码。</span></div> 
  </div>
</div>
</div>


</body>
</html>