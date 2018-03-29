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
<SCRIPT type="text/javascript">showwhere("shezhitop",5)</SCRIPT>
<div class="admin">

	<div class="panel">
  <div class="panel-head">微信配置</div>

  <div class="panel-body">
 
<form action="weixinpay!update.action" method="post">
 <div class="form-group">
  <label class="label">公众号名称:</label>
<div class="field">
  <input type="text"  name="weixinpay.gzname" data-validate="required:必填" value="${weixinpay.gzname}" class="input" placeholder="请输入公众号名称" /></br>
</div>
</div>

<div class="form-group">
<label class="label">公众号原始id:</label>
<div class="field">
<input type="text" name="weixinpay.gzid" data-validate="required:必填" value="${weixinpay.gzid}" class="input" placeholder="请输入公众号原始id" /></br>
 </div>
 </div>
 
 <div class="form-group">
<label class="label">微信号:</label>
<div class="field">
<input type="text" name="weixinpay.weixin" data-validate="required:必填" value="${weixinpay.weixin}" class="input" placeholder="请输入公众账号的微信号" /></br>
</div>
</div>

<div class="form-group">
<label class="label">AppID:</label>
<div class="field">
<input type="text" name="weixinpay.appid" data-validate="required:必填" value="${weixinpay.appid}" class="input" placeholder="请输入AppID" /></br>
 </div>
 </div>
 
 <div class="form-group">
<label class="label">AppSecret:</label>
<div class="field">
<input type="text" name="weixinpay.appsecret" data-validate="required:必填" value="${weixinpay.appsecret}" class="input" placeholder="请输入AppSecret" />
</div>
</div>

  <div class="form-group">
  <label class="label">商户号:</label>
<div class="field">
  <input type="text"  name="weixinpay.partner" data-validate="required:必填" value="${weixinpay.partner}" class="input" placeholder="请输入微信支付商户号" /></br>
</div>
</div>

<div class="form-group">
<label class="label">API秘钥:</label>
<div class="field">
<input type="text" autocomplete="off" name="weixinpay.partnerkey" data-validate="required:必填" value="${weixinpay.partnerkey}" class="input" placeholder="请输入API秘钥" /></br>
 </div>
 </div>
 
 



<input type="hidden" name="weixinpay.id" value="${weixinpay.id}"/>
</br>
<button class="button bg-main">提交</button>
</form>
  </div>
</div>
	
	
  </div>
</body>
</html>