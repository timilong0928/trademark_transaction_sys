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
                <li class="active"><a href="<%=request.getContextPath() %>/admin/product/product!findall.action" class="icon-cog"> 商品</a>
            		<ul><li><a href="<%=request.getContextPath() %>/admin/product/classify!productclassify.action">添加商品</a></li><li><a href="<%=request.getContextPath() %>/admin/product/product!findall.action">商品管理</a></li><li class="active"><a href="classify!findall.action">分类管理</a></li><li><a href="yunfei!findall.action">运费管理</a></li></ul>
                </li>
                <li ><a href="<%=request.getContextPath() %>/admin/order/order!findall.action" class="icon-file-text"> 订单</a>
					
                </li>
                <li><a href="<%=request.getContextPath()%>/admin/seller/team!findall.action" class="icon-shopping-cart"> 分销</a></li>
                 <li><a href="<%=request.getContextPath()%>/admin/tongji/tongji!findbytime1.action" class="icon-shopping-cart">统计</a>
                 <ul><li ><a href="<%=request.getContextPath()%>/admin/tongji/tongji!findbytime1.action">统计管理</a></li><li class="active"><a href="<%=request.getContextPath()%>/admin/tongji/daochu.jsp">导出数据</a></li></ul>
                 </li>
                <li><a href="<%=request.getContextPath() %>/admin/post/post!findall.action" class="icon-user"> 文章</a></li>
                <li><a href="<%=request.getContextPath() %>/admin/product/lunbo!findall.action" class="icon-file"> 装修</a></li>
                 <li><a href="<%=request.getContextPath() %>/admin/admin/shezhi.jsp" class="icon-user"> 设置</a></li>
            </ul>
        </div>
        <div class="admin-bread">
            <span>您好，admin，欢迎您的光临。</span>
            <ul class="bread">
                <li><a href="" class="icon-home"> 开始</a></li>
                <li><a href="">商品分类</a></li>
                <li>分类管理</li>
            </ul>
        </div>
    </div>
</div>

<div class="admin">
	
    <div class="panel admin-panel">
    	<div class="panel-head"><strong>分类列表</strong></div>
        <div class="padding border-bottom">
        
        <div class="line-middle">
  <div class="x4">
            
  </div>
 
  
          <form action="classify!add.action" method="post">
          
           <div class="x4">
          <input name="classify.cname" type="text" class="input radius-rounded" placeholder="请输入分类名称" />
          </div>
          
          <div class="x4">
           <button type="submit" class="button bg-blue">添加</button>
          </div>
        
          </form>
    
  </div>
  
        </div>
        <table class="table table-hover">
        
        	<tr><th width="200">排列顺序</th><th width="200">分类名称</th><th width="200">操作</th></tr>

            <s:iterator value="classifys">
            <tr><td><s:property value="orderid"/></td><td><s:property value="cname"/></td><td><a class="button border-blue button-little" href="classify!update.action?classify.id=<s:property value="id"/>">修改</a> <a class="button border-yellow button-little" href="classify!delete.action?classify.id=<s:property value="id"/>" onclick="{if(confirm('确认删除?')){return true;}return false;}">删除</a></td></tr>
            </s:iterator>
            
        </table>
    
    </div>
  
    <br />
   
</div>

<div class="hidden"><script src="http://s4.cnzz.com/stat.php?id=5952475&web_id=5952475" language="JavaScript"></script></div>
</body>
</html>