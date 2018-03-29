<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<%@ page import="pojo.Admin" %>
<% 
String path=request.getContextPath();
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
    <link rel="stylesheet" type="text/css" href="My97DatePicker/myCSS.css" />
	<script type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>
    <script src="<%=path%>/admin/js/jquery.js"></script>
    <script src="<%=path%>/admin/js/pintuer.js"></script>
    <script src="<%=path%>/admin/js/respond.js"></script>
    <script src="<%=path%>/admin/js/admin.js"></script>

</head>

<body>

<%@ include file="/admin/topmenu.jsp" %>
<script type="text/javascript">showwhere("indextop",0);</script>
<div class="admin">
	<div class="line-big">
    	<div class="xm3" >
        	<div class="panel border-back"  style="height:250px;"  >
            	<div class="panel-body text-center">
                	<img src="<%=request.getContextPath()%>/${sessionScope.admin.img}" width="120" height="120" class="radius-circle" /><br/>
                   ${sessionScope.admin.name}
                </div>
                <div class="panel-foot bg-back border-back">您好，${sessionScope.admin.name}，这是您第 ${sessionScope.admin.num} 次登录，上次登录为 ${sessionScope.admin.lasttime}。</div>
            </div>
            <br />
        
            <br />
        </div>
        <div class="xm9">

            <div class="alert" style="height:250px;">
                <h4>个性签名/备注</h4>
                <p class="text-gray padding-top"> ${sessionScope.admin.qianming} </p>

            </div>
        </div>
    </div>
    
</body>
</html>
    

    