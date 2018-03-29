<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML >
<html>
	<head>
		<base href="<%=basePath%>">
		<title>
		注册界面
		</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<meta name="viewport"
			content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
		<link rel="stylesheet" href="<%=path%>/css/pintuer.css">
		<link rel="stylesheet" href="<%=path%>/css/main.css">
		<link rel="stylesheet" href="<%=path%>/css/office.css">
		<link rel="stylesheet" href="style/index.css" />
		<link rel="stylesheet" href="style/common.css" />
		<link rel="stylesheet" href="style/swiper.min.css" />
		<link rel="stylesheet" href="style/sp.css" />
		<script src="<%=path%>/js/jquery.js"></script>
		<script src="<%=path%>/js/pintuer.js"></script>
		
		
</head>

	<body >
		<div style="width: 100%;height: 35px;" >
		</div>
		
		<div style="width: 100%;height: 55px;border-bottom: 1px solid #F1F1F1;" >
		<div style="width: 35px;height: auto;font-size: 16px;float: left;margin-left: 10px;margin-top: 15px" > +86</div>
			
			<input type="text" placeholder="请输入手机号码" id="send"
			      style="margin-left: 10px ;font-size: 16px;padding-left: 10px;width: 70%;height: 30px;margin-top: 10px;border: 0;background-color: white;"  value=""/>
			
		</div>
		
		<div style="width: 100%;height: 55px;border-bottom: 1px solid #F1F1F1;">
		
		      <img alt="..." src="/../images/验证码.png" style="width: 18px;height: 18px;float: left;margin-left: 10px;margin-top: 15px">
		      
			  <div style="height: 55px;width: 82%;margin-left: 25px ;float: left;" >
			  <input type="text" placeholder="请输入验证码" id="sendyanzhengma" 
				     style="float: left;font-size: 16px;padding-left: 10px;height: 30px;margin-top: 10px;border: 0;background-color: white;width: 50%"  value=""/>
				      
			  <div  style="text-align:center; float: right;width:auto;height: 55px;padding-top: 14px;" >
			  <input  type="button" style="width: 100%;border: 0;background-color: white;color: #EF8200;font-size: 16px;" 
			        onclick="send(this);" value="获取验证码" /></div>
			  
			  <!-- 这的div是验证码旁边的竖线 -->
	          <div style="position:absolute;z-index:1;width:2px;background:#F1F1F1;height:40px;left:70%;top:98px" align="center"></div>
	          </div>
		</div>
		<div onclick="send1()" style="width: 86%;height: 50px;text-align: center; 
		     background-color: #EF8200;color: white; margin-top: 50px;font-size: 17px;line-height: 50px;border-radius:5px;margin-left: 6%">注册
		</div>
		
	<input type="hidden" id="teamid" value="${team.id}">
		
		
  		
  <SCRIPT type="text/javascript">
   	function send(val){
   		var obj = $("#send").val();
   		
    	//window.location.href="team!yanzhengma.action?team.phone="+obj;
    
    	if(obj==""){
			alert("请输入手机号码");
			return false;
		}
    	if(!(/^1[0-9][0-9]\d{4,8}$/.test(obj))){
			  alert("请输入正确的手机号码"); 
			  return false; 
		}
    
    	$.ajax({
   	                url:"team!yanzhengma.action",
					type:"post",
					data:{"team.phone":obj},
					dataType:"json",
					success:function(msg){
					
					if(msg == "该手机号已被注册！"){
					   alert("该手机号已被注册！"); 
					}
					if(msg=="1"){
					settime(val);
					alert("验证码发送成功，请注意查收");
					}
				},
					error:function(){
					    
						alert("注册失败！");
					}
				});
   	
    }
    
    function send1(){
    var obj = $("#sendyanzhengma").val();
    var obj1 = $("#send").val();
    var teamid = $("#teamid").val();
    if(!(/^1[0-9][0-9]\d{4,8}$/.test(obj1))){
			  alert("请输入正确的手机号码"); 
			  return false; 
		}
		
	if (obj=="") {
			 alert("请先输入验证码");
		}
		
    //window.location.href="team!zhuce.action?team1.phone="+obj1+"&num="+obj;
    /* */
    $.ajax({
   	                url:"team!zhuce.action",
					type:"post",
					data:{"num":obj,"team1.phone":obj1},
					dataType:"json",
					success:function(msg){
					if(msg=="0"){
					    alert("恭喜注册成功！");  
					    window.location.href="index!index.action?id1="+teamid;
						
					}else if(msg=="1"){
						alert("验证码错误，请重新输入！");
					}else if(msg=="2"){
						alert("该手机号已被注册！");
					}else if(msg=="3"){
						alert("手机号不一致！");
					}
					},
					error:function(){
					    
						alert("注册失败");
					}
					});
   	
    }
	</script>
	
	<SCRIPT type="text/javascript">
	   var countdown=60; 
	 function settime(val) { 
	  
			if (countdown == 0) { 
				val.removeAttribute("disabled"); 
				val.value="获取验证码"; 
				countdown = 60; 
				
			} else { 
				val.setAttribute("disabled", true); 
				val.value="重新发送(" + countdown + ")"; 
				countdown--; 
			setTimeout(function() { 
				settime(val) 
				},1000) 
			} 
		}
	</SCRIPT>
   	
	</body>
</html>
