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
		个人中心
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
		<script type="text/javascript">
			$(function(){
				$(".navbt").removeClass("act");
				$(".nav2").addClass("act");
				
			});
		</script>
		
		</head>

	<body style="width: 100%;height: auto;background-color: #F0F0F0;"> 
		<input type="hidden" id="fenxiaohide" value="${award.fenxiao }"/>
		<input type="hidden" id="zhucehide" value="${team.phone }"/>
		
  		<div style="width: 100%;">
    	<div style="height: 95px;width:100%;background-color: #EF8200;">
    	  <img  alt="..." src="${team.img }" style="width:55px; 
    	  height:55px; margin-top: 21px;margin-left: 10px" >
    	  <div style=" height:50px;width: auto;font-size: 15px;margin-left:70px ; margin-top: -35px;color: white;">${team.nickName }</div>
    	</div>
    	
 		<!-- 内容 -->
   		<div class="mid" style="height: 70%;background-color: white;">
   		
	   			<div class="order" onclick="window.location='order!myorder.action'">
				    <div class="or" >	
				        <div class="o1" style="margin-top: 5px"><img src="/../images/订单.png" width="17" height="17"></img></div> 
				        <div class="o2" style="font-size:15px;margin-top: 5px">我的订单</div> 
				        <div class="o3" ><img src="/../images/arrows-right.png" width="9" height="13" style="margin-top: 7px"></div> 
				    </div> 
				</div>
				<div style="border: 2px solid #F1F1F1; "></div>
   			 <div class="order" onclick="window.location='team!collect.action'">
				    <div class="or">	
				        <div class="o1"style="margin-top: 5px"><img src="/../images/图层-3.png" width="17" height="17"></img></div> 
				        <div class="o2" style="font-size:15px;margin-top: 5px">我的收藏</div> 
				        <div class="o3"><img src="/../images/arrows-right.png" width="9" height="13" style="margin-top: 7px"></div> 
				    </div> 
			</div>
	   			<div id="fxhide2" style="border: 1px solid #F1F1F1; "></div>
	   			<div id="fxhide" class="order" onclick="window.location='team!group.action'">
				    <div class="or">	
				        <div class="o1"style="margin-top: 5px"><img src="/../images/客户.png" width="17" height="17"></img></div> 
				        <div class="o2" style="font-size:15px;margin-top: 5px">我的团队</div> 
				        <div class="o3"><img src="/../images/arrows-right.png" width="9" height="13" style="margin-top: 7px"></div> 
				    </div> 
				</div>
	   			
	   		   <div style="border: 1px solid #F1F1F1; "></div>
	   			<div class="order" onclick="window.location='team!point.action'">
				    <div class="or">	
				        <div class="o1"style="margin-top: 5px"><img src="/../images/图层-9.png" width="17" height="17"></img></div> 
				        <div class="o2" style="font-size:15px;margin-top: 5px">我的积分</div> 
				        <div class="o3"><img src="/../images/arrows-right.png" width="9" height="13"style="margin-top: 7px"></div> 
				    </div> 
				</div>
				<div style="border: 2px solid #F1F1F1; "></div>
	   			<div id="fxhide1" class="order" onclick="window.location='team!yongjin.action'">
				    <div class="or">	
				        <div class="o1"style="margin-top: 5px"><img src="/../images/钱03.png" width="17" height="17"></img></div> 
				        <div class="o2" style="font-size:15px;margin-top: 5px">我的佣金</div> 
				        <div class="o3"><img src="/../images/arrows-right.png" width="9" height="13" style="margin-top: 7px"></div> 
				    </div> 
				</div>
				<div style="border: 2px solid #F1F1F1; "></div>
	   			<div id="fxhide1" class="order" onclick="window.location='team!fenxiao.action?id1=${team.id}'">
				    <div class="or">	
				        <div class="o1"style="margin-top: 5px"><img src="/../images/钱03.png" width="17" height="17"></img></div> 
				        <div class="o2" style="font-size:15px;margin-top: 5px">我要分享</div> 
				        <div class="o3"><img src="/../images/arrows-right.png" width="9" height="13" style="margin-top: 7px"></div> 
				    </div> 
				</div>
				
				
				
		</div>
		
	   	<img alt="..." src="/../images/洛奇教育.png" style="width: 20%;height: 20%;margin-top: 15%;margin-left: 40%">
   	
   	</div>
   	<s:include value="bottom.jsp"></s:include>
   	
   	<script type="text/javascript">
   	   $(function(){
   	    // alert($("#zhucehide").val());
   	     var obj=$("#fenxiaohide").val();
   	     var obj1=$("#zhucehide").val();
   	     if(obj==1||obj1==""){
   	     //alert(1111);
   	      $("#fxhide").hide();
   	      $("#fxhide1").hide();
   	      $("#fxhide2").hide();
   	     
   	     }
   	  });
   	</script>
   	  
  </body>
</html>
