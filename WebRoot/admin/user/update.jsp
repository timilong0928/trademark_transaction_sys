<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<%@ page import="pojo.Admin" %>
<% 
String path = request.getContextPath();
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
    <script src="<%=path%>/admin/js/respond.js"></script>
    <script src="<%=path%>/admin/js/admin.js"></script>

</head>

<body>

<%@ include file="/admin/topmenu.jsp" %>
<SCRIPT type="text/javascript">showwhere("teamtop",1)</SCRIPT>
<div class="admin">

<!-- 课程修改界面 -->
	<div class="panel">
  <div class="panel-head"></div>

  <div class="panel-body">
 
<form action="award!update.action" method="post">
 
	<div class="form-group">
	  <label class="label">:</label>
	<div class="field">
	  <input type="text"  name="award.signAward" data-validate="required:必填" value="${award.signAward}" class="input" placeholder="请输入appid" /></br>
	</div>
	</div>
	
	<div class="form-group">
	<label class="label">运费:</label>
	<div class="field">
	<input type="text" name="award.freight" data-validate="required:必填" value="${award.freight}" class="input"  /></br>
	 </div>
	 </div>
	
	<div class="form-group">
	<label class="label">分享积分:</label>
	<div class="field">
	<input type="text" name="award.shareAward" data-validate="required:必填" value="${award.shareAward}" class="input"  /></br>
	 </div>
	 </div>
	 
	   <div class="form-group">
	  <label class="label">非会员折扣:</label>
	<div class="field">
	  <input type="text"  name="award.discount" data-validate="required:必填" value="${award.discount}" class="input" /></br>
	</div>
	</div>

	<div class="form-group">
	<label class="label">非付费会员折扣:</label>
	<div class="field">
	<input type="text" name="award.discount1" data-validate="required:必填" value="${award.discount1}" class="input" /></br>
	 </div>
	 </div>

<div class="form-group">
	<label class="label">付费会员折扣:</label>
	<div class="field">
	<input type="text" name="award.discount2" data-validate="required:必填" value="${award.discount2}" class="input"  /></br>
	 </div>
	 </div>
	 

	<input type="hidden" name="award.id" value="${award.id}"/>
<br/>
<button class="button bg-main">提交</button>
</form>
  </div>
</div>
	
	
  </div>
</body>
</html>