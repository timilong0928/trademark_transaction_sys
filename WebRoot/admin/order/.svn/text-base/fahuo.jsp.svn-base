<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<%@ page import="pojo.Order1" %>

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
<SCRIPT type="text/javascript">showwhere("producttop",5,"发货")</SCRIPT>
<div class="admin">
	 
   <div class="panel">
  <div class="panel-head">
  
  <div class="line-middle">
  
  <div class="x3"><strong>订单号：</strong>${order2.oid} </div>
  
  <div class="x3"></div>
  
  <div class="x3"></div>
  
</div>

  </div>
  
  <div class="panel-body">
  
  <form name="form" action="order!fahuo.action" method="post">
  
   <div class="form-group">
                    <div class="label"><label for="sitename">快递公司</label></div>
                    <div class="field">
                    	<select class="input" id="company" name="order2.postcompany">
                    	
                    	   <option value="请选择">请选择</option>
                           <option value="EMS">EMS</option>
                           <option value="申通快递">申通快递</option>
                           <option value="圆通快递">圆通快递</option>
                           <option value="顺丰快递">顺丰快递</option>
                           <option value="天天快递">天天快递</option>
                           <option value="星晨急便">星晨急便</option>
                           <option value="宅急送快递">宅急送快递</option>
                           <option value="汇通快递">汇通快递</option>
                           <option value="中通快递">中通快递</option>
                           <option value="韵达快递">韵达快递</option>
                           
                           <option value="民航快递">民航快递</option>
                           <option value="希伊艾斯快递">希伊艾斯快递</option>
                           <option value="亚风快递">亚风快递</option>
                           <option value="全日通快递">全日通快递</option>
                           <option value="华运物流">华运物流</option>
                           <option value="新邦物流">新邦物流</option>
                           <option value="佳吉快运">佳吉快运</option>
                           <option value="中铁快运">中铁快运</option>
                           <option value="德邦物流">德邦物流</option>
                           <option value="华宇物流">华宇物流</option>
                           
                           <option value="大田物流">大田物流</option>
                           <option value="长宇物流">长宇物流</option>
                           <option value="中外运空运">中外运空运</option>
                           <option value="全一快递">全一快递</option>
                           <option value="飞康达快递">飞康达快递</option>
                           <option value="UPS">UPS</option>
                           <option value="DHL">DHL</option>
                           <option value="TNT">TNT</option>
                           <option value="FedEx">FedEx</option> 
                           <option value="AAE">AAE</option>
                           
                           <option value="DPEX">DPEX</option>
                           <option value="BHT">BHT</option>
                           <option value="其他">其他</option>
                      
                       </select>
                    </div>
                </div>
                
                <div class="form-group">
                    <div class="label"><label for="sitename">运单号：</label></div>
                    <div class="field">
                    	<input type="text" class="input" id="sitename" name="order2.postnum" size="50" placeholder="请输入运单号" data-validate="required:请输入运单号" />
                    </div>
                </div></br>
                
                <input type="hidden" name="order2.id" value="${order2.id}"/>
          <button class="button bg-blue" onclick="return checkForm()">提交</button>       
     </form>           
  </div>
</div>
</div>

<script type="text/javascript">
function checkForm(){

var company= document.getElementById("company").value;

if(company=="请选择") {

alert("请选择快递公司！");
return false;
}else{
document.getElementBy("form").submit();
return true;
}
}

</script>

</body>
</html>