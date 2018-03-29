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
    <link rel="stylesheet" type="text/css" href="<%=path%>/admin/My97DatePicker/myCSS.css" />
    <script src="<%=path%>/admin/js/jquery.js"></script>
    <script src="<%=path%>/admin/js/pintuer.js"></script>
    <script src="<%=path%>/admin/js/respond.js"></script>
    <script src="<%=path%>/admin/js/admin.js"></script>
    <script type="text/javascript" src="<%=path%>/admin/My97DatePicker/WdatePicker.js"></script> 

</head>

<body>

<%@ include file="/admin/topmenu.jsp" %>
<SCRIPT type="text/javascript">showwhere("shezhitop",3)</SCRIPT>
<div class="admin">

	<div class="panel">
  <div class="panel-head">积分设置</div>

  <div class="panel-body">
 
<form action="point!update.action" method="post">
 
	<div class="form-group">
	  <label class="label">签到积分基数:</label>
	<div class="field">
	  <input type="text"  name="point.signBase" data-validate="required:必填" value="${point.signBase}" class="input" placeholder="请输入基数" /></br>
	</div>
	</div>
	
	<div class="form-group">
	<label class="label">积分比例 XX积分=1元</label>
	<div class="field">
	<input type="text" name="point.rate" data-validate="required:必填" value="${point.rate}" class="input" placeholder="请输入比例,如100 代表100积分=1元" /></br>
	 </div>
	 </div>
	 
	 <div class="form-group">
	  <label class="label">积分抵扣上限百分比(0.05代表5%)</label>
	<div class="field">
	  <input type="text"  name="point.limitNum" data-validate="required:必填" value="${point.limitNum}" class="input" placeholder="请输入积分抵扣上限" /></br>
	</div>
	</div>
	
	<div class="form-group">
        <div class="label"><label for="sitename">积分有效期</label></div>
        <div class="field">
        	<input type="text" class="input" value="${point.endTime}" name="point.endTime" size="50" data-validate="required:请输入有效期" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"/>
        </div>
    </div>

	<input type="hidden" name="point.id" value="${point.id}"/>
<br/>
<button class="button bg-main">提交</button>
</form>
  </div>
</div>
	
	
  </div>
</body>
</html>