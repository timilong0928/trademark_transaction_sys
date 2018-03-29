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
		我的收藏
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
		
	<s:if test="collects.size()!=0"> 
		<body style="width: 100%;height: auto;background-color: #F1F1F1;">
	</s:if>
	<s:else>
			<body style="width: 100%;height: auto;background-color: white;">
	</s:else>	
  		
  		
		<s:if test="collects.size()!=0">
		 
		   <s:iterator value="courses">
			  <!-- 内容 -->
		    	<div style="width: 100%;height: auto;">
			 		<div class="order" style="background-color: white;height: 100px;">
									<a href="course!thecourse.action?course.id=${id}&content.id=0&id1=${team.id}">
							        <div  style="margin-top: 13px;margin-left: 15px;position:absolute;"><img  src="<s:property value="img"/>" width="85" height="75"></img></div> 
							        <div  style="margin-top: 13px;font-size:14px;margin-left: 110px;position:absolute;"><s:property value="title"/></div> 
							        <div  style="margin-top: 38px;font-size:10px;margin-left: 110px;color: #999999;position:absolute;">播放次数：<s:property value="readNum"/> </div>
							        <div  style="margin-top: 55px;font-size:10px;margin-left: 110px;color: #999999;position:absolute; ">讲师：<s:property value="teacher"/> </div>
							        <div  style="margin-top: 70px;font-size:14px;margin-left: 108px;color: red;position:absolute;">￥<s:property value="money"/> </div>
							        <div  style="margin-top: 74px;font-size:10px;margin-left: 160px;color: #999999;position:absolute;text-decoration:line-through;">价格￥<s:property value="twomoney"/> </div>
							        </a>
							        <div  style="margin-top: 67px;  float: right;margin-right: 15px" onclick="location='team!deletecollect.action?collect.id=<s:property value="collectid"/>'"  ><img  src="/../images/03图层-6.png" width="20" height="20"></img></div> 
					</div>	 
			   </div>
			   <div style="border: 1px solid #F1F1F1; "></div>
		  </s:iterator> 
		  <div style=" width: auto;height: 90px;text-align: center;font-size: 12px;background-color: #F1F1F1;padding-top: 30px;color: #ACACAC" >没有更多记录~</div>  
		</s:if>
		<s:else>
		    <div style="width: 100%;">
		        <div  style="margin-top: 45%;margin-left: 15px;text-align: center;"><img src="/../images/小婴儿.png" width="100" height="100"></img></div> 
			    <div style=" width: auto;height: 80px;text-align: center;font-size: 12px;padding-top: 20px;color: #EE8401" >您还没有任何收藏哦~</div>
		    </div>
	    </s:else>
		   	  
   <SCRIPT type="text/javascript">
   	
   </script>
   	   	
	</body>
</html>
