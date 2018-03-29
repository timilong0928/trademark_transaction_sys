<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="/struts-tags" prefix="s" %>
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

<s:if test="msg=='success'">

  <script >alert("菜单创建成功")</script>
   </s:if> 
   
   <s:if test="msg=='fail'">
  <script >alert("菜单创建失败，稍后再试")</script>
   </s:if> 

<%@ include file="/admin/topmenu.jsp" %>

<div class="admin">

	<div class="panel">
  <div class="panel-head">自动回复</div>

  <div class="padding border-bottom">
  
  <button class="button button-small border-red" >添加回复规则</button>
  </div>
  
  <div class="panel-body">


  

  </div>
</div>
	
	
  </div>
  
  
  <script type="text/javascript">
  
function addsuper(){

   var num=0;
   var zi=document.getElementsByClassName("zi");
   
   	for(var i=0;i<zi.length;i++){
   	     num=num+1; 
   	}
   	//alert(num);
   	 var id=num+1;
   		 
   		 if(num<3){
   
		
							$('.caidan').append(
							
							'<table id="'
							+id
							+'"><tr class="zi"><td style="width:15%"><input type="text"  name="mainBtn'
							+id
							+'" class="input"   placeholder="请输父子菜单名称" /></td><td style="width:15%"></td><td style="width:20%"></td><td style="width:30%"></td><td style="width:20%"><button class="button button-small border-main" onclick="deletesuper('
							+id
							+')">删除</button>&nbsp;<button class="button button-small border-green" type="button" onclick="addchild('
							+id
							+')">添加子菜单</button></td></tr></br></table>'
							
							);
		   
		    
		    }else{
		      alert("对不起，父菜单最多只能3个！");
		    }	
   
}


function addchild(id){


    var num=0;
    
   var child= document.getElementsByClassName("zizi"+id);

   	for(var i=0;i<child.length;i++){
   	
   	     num=num+1;
   	    
   	}
   	
  id1=num+1;
   	
   	if(num<5){
   
		$('#'+id).append(
							
			'<tr class="zizi'
			+id 
			+'" id="'
			+id
			+id1
			+'"><td style="width:15%" align="right">∟ </td><td style="width:15%"><input type="text"  name="btn'
			+id
			+'['
			+num
			+'].name" class="input"  placeholder="请输入子菜单名称" /></td><td style="width:20%"><select name="btn'
			+id
			+'['
			+num
			+'].type" class="input"  ><option>view</option><option>click</option></select></td><td style="width:30%"><input type="text" name="btn'
			+id
			+'['
			+num
			+'].url" class="input"  placeholder="请输入url链接或者key值" /></td><td style="width:20%"><button class="button button-small border-main" onclick="return deletechild('
			+id
			+id1
			+')">删除</button></td></tr>'
							
				);
		    }else{
		    
		    alert("对不起，子菜单最多只能5个！");
		    
		    }
		    
}

function deletechild(id1){

document.getElementById(id1).remove();

}

function deletesuper(id){

document.getElementById(id).remove();

}



function checkForm(){
var input=document.getElementsByClassName("input");

for(var i=0;i<input.length;i++){
   
   var value=(input[i]).value;
  
   if(value==""){
      alert("菜单的相关内容不能为空！");
      return false;
   }
}

   var num=0;
   var zi=document.getElementsByClassName("zi");
   
   	for(var i=0;i<zi.length;i++){
   	     num=num+1; 
   	}
   	if(num==0){ 	
   	return false;
   	}
   	
   	
   	var a=document.getElementById("1");
   	if(a!=null&&a!=""){
   	   	var aa=document.getElementById("11");
   	   	if(aa==null||aa==""){
   	   	alert("请添加相关子菜单！");
   	   	return false;
   	   	}
   	   	 
   	}
   	
   	var b=document.getElementById("2");
   	if(b!=null&&b!=""){
   	var bb=document.getElementById("21");
   	   	if(bb==null||bb==""){	
   	   	alert("请添加相关子菜单！");
   	   	return false;
   	   	}
   	}
   	
   	var c=document.getElementById("3");
   		if(c!=null&&c!=""){
   		var cc=document.getElementById("31");
   	   	if(cc==null||cc==""){
   	   	alert("请添加相关子菜单！");
   	   	return false;
   	   	}
   	}
  
   	
return true;
}




</script>
</body>
</html>