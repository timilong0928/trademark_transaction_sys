<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
    <link rel="stylesheet" href="../css/pintuer.css">
    <link rel="stylesheet" href="../css/admin.css">
    <script src="../js/jquery.js"></script>
    <script src="../js/pintuer.js"></script>
    <script src="../js/respond.js"></script>
    <script src="../js/admin.js"></script>
   
</head>

<body>

<%@ include file="/admin/topmenu.jsp" %>
<script type="text/javascript">showwhere(2,4,"文章列表")</script>

<div class="admin">
	 <form id="form" method="post" action="keyword!delete.action">
    <div class="panel admin-panel">
    	<div class="panel-head"><strong>文章列表</strong></div>
        <div class="padding border-bottom">
            <input type="button" id="selectall" class="button button-small checkall"  checkfor="id" value="全选" />
            <a href="<%=request.getContextPath() %>/admin/weixin/addhuifu2.jsp"><input type="button" class="button button-small border-green" value="添加规则" /></a>
            <input type="button" onClick="submit()" class="button button-small border-yellow" value="批量删除" />
            
        </div>
       
        <table class="table table-hover">
        	<tr><th width="100">选择</th><th width="320">关键词</th><th width="300">封面</th><th width="400">标题</th><th width="200">操作</th></tr>
        
           <s:iterator value="keywords">
           
            <tr><td><input type="checkbox" class="choose" name="id" value="<s:property value="id"/>" /></td><td><s:property value="keyword"/></td><td><a href="#" target="_blank"><img height="70" width="70" src="<%=request.getContextPath() %>/<s:property value="img"/>"target="_blank" /></a></td><td><a href="#" target="_blank"><s:property value="title"/></a></td><td><a class="button border-blue button-little" href="keyword!update.action?keyword.id=<s:property value="id"/>&page=${page}" />修改</a> <a class="button border-yellow button-little" href="keyword!deleteone.action?keyword.id=<s:property value="id"/>&page=${page}" onclick="{if(confirm('确认删除?')){return true;}return false;}">删除</a></td></tr>
           
            </s:iterator>
            
        </table>
        </form>
        
       
        
    </div>
   
  
</div>


<script type="text/javascript">
function submit(){
var choose= document.getElementsByClassName("choose");
if($('#selectall').is(':checked')) {
choose[i].checked = true;
}else{
choose[i].checked = false;
}
document.getElementBy("form").submit();
}
</script>

</body>
</html>