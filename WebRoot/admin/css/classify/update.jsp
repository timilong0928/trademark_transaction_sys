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
  <div class="lefter">
    <div class="logo"><a href="" target="_blank"><img src="../images/logo5.png" width="100" height="40" alt="后台管理系统" /></a></div>
</div>
<div class="righter nav-navicon" id="admin-nav">
    <div class="mainer">
        <div class="admin-navbar">
            <span class="float-right">
            	 <a class="button button-little bg-yellow"  target="_blank" href="https://mp.weixin.qq.com/cgi-bin/loginpage?url=%2Fadvanced%2Fadvanced%3Faction%3Ddev%26t%3Dadvanced%2Fdev%26token%3D1486609534%26lang%3Dzh_CN">公众号登录</a>
            </span>
            <ul class="nav nav-inline admin-nav">
                <li><a href="<%=request.getContextPath() %>/admin/index.jsp" class="icon-home"> 开始</a>
                  
                </li>
                 <li><a href="<%=request.getContextPath() %>/admin/weixin/peizhi!find.action" class="icon-cog"> 公众号</a>
                <li class="active"><a href="product!findall.action" class="icon-cog"> 商品</a>
            		<ul><li><a href="classify!productclassify.action">添加商品</a></li><li ><a href="product!findall.action">商品管理</a></li><li class="active"><a href="<%=request.getContextPath() %>/admin/classify/classify!findall.action">分类管理</a></li><li><a href="yunfei!findall.action">运费管理</a></li></ul>
                </li>
                <li><a href="<%=request.getContextPath() %>/admin/order/order!findall.action" class="icon-file-text"> 订单</a>
					
                </li>
                <li><a href="<%=request.getContextPath()%>/admin/seller/team!findall.action" class="icon-shopping-cart"> 分销</a></li>
                 <li><a href="<%=request.getContextPath()%>/admin/tongji/tongji!findbytime1.action" class="icon-shopping-cart">统计</a>
                 <ul><li ><a href="<%=request.getContextPath()%>/admin/tongji/tongji!findbytime1.action">统计管理</a></li><li class="active"><a href="<%=request.getContextPath()%>/admin/tongji/daochu.jsp">导出数据</a></li></ul>
                 </li>
                <li><a href="<%=request.getContextPath() %>/admin/post/post!findall.action" class="icon-user"> 文章</a></li>
                <li><a href="lunbo!findall.action" class="icon-file"> 装修</a></li>
                 <li><a href="<%=request.getContextPath() %>/admin/admin/shezhi.jsp" class="icon-user"> 设置</a></li>
            </ul>
        </div>
        <div class="admin-bread">
            <span>您好，admin，欢迎您的光临。</span>
            <ul class="bread">
                <li><a href="" class="icon-home"> 开始</a></li>
                <li><a href="">商品分类</a></li>
                <li>修改</li>
            </ul>
        </div>
    </div>
</div>

<div class="admin">

    <div class="panel">
  <div class="panel-head"><strong>修改分类</strong></div>
  <div class="panel-body">
  
<form action="classify!update1.action" method="post" >
               <input type="hidden" name="classify.id" value="${classify.id }"/>
                <div class="form-group">
                    <div class="label"><label for="sitename">排列顺序</label></div>
                    <div class="field">
                    	<input type="text" class="input" id="sitename" name="classify.orderid" size="50" placeholder="请输分类名称" value="${classify.orderid }" data-validate="required:请输入排列顺序" />
                    </div>
                </div>
                
                     <div class="form-group">
                    <div class="label"><label for="sitename">分类名称</label></div>
                    <div class="field">
                    	<input type="text" class="input" id="sitename" name="classify.cname" size="50" placeholder="请输入分类名称" value="${classify.cname }"data-validate="required:请输入分类名称" />
                    </div>
                </div>
                <button class="button bg-blue" onclick="return checkForm()">提交</button>
             </form>    
                
                
</div>


</body>
</html>