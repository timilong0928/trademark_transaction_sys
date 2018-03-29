<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<s:property value="content" escapeHtml="false" />
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>洛奇教育</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="洛奇教育">
	<meta http-equiv="description" content="洛奇教育">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
	<link href="<%=path%>/css/pintuer.css" rel="stylesheet">
	<link href="<%=path%>/css/swiper.min.css" rel="stylesheet">
	<script src="<%=path%>/js/jquery.js"></script>
	<script src="<%=path%>/js/pintuer.js"></script>
	<script src="<%=path%>/js/swiper.min.js"></script>
	<script src="<%=path%>/js/main.js"></script>
	<style type="text/css">
		
		.mainbody>div{
			background-color: white;
		}
		.partzero img{
			width: 100%;
		}
	</style>
	<SCRIPT type="text/javascript">
		function xuanze(name){
				$("#suoyou").css("display","none");
				
				$("#huodong").css("display","none");
				$("#huodong1").css("color","black");
				$("#huodong1").css("border-bottom-color","white");
				
				$("#mianfei").css("display","none");
				$("#mianfei1").css("color","black");
				$("#mianfei1").css("border-bottom-color","white");
				
				$("#fufei").css("display","none");
				$("#fufei1").css("color","black");
				$("#fufei1").css("border-bottom-color","white");
				
				$("#"+name).css("display","");
				$("#"+name+"1").css("color","#ef8201");
				$("#"+name+"1").css("border-bottom-color","#ef8201");
			}
		
		  
	</SCRIPT>
	
	
  </head>
  
  <body >
		<!-- 这个是弹窗  -->
			<div id="tanchuang"  style="display:none;width: 100%;position: fixed; top:0px; bottom:0px; z-index: 10;background: rgba(44,44,44, 0.5);">
  		 		<div style="position: fixed;top:33%;left:20%;width: 60%;font-size: 15px;">
					<div style="width: 100%;background-color: white;border-radius:0.5em;">
						<div style="width: 100%;text-align: center;padding: 20px 5px;" id="alertmsg">${msg}</div>
						<a id="href"><div onclick="tanchuang();" style="width: 60%;text-align: center;margin:0 20%;background-color:#18aaee;padding: 5px;color: white; border-radius:0.3em;">确定</div></a>
						<div style="width: 100%;height: 20px;"></div>
					</div>
				</div>
			</div>
	  		<SCRIPT type="text/javascript">
	  			function tanchuang(){
	  				$("#tanchuang").css("display","none");
	  			}
	  			var msg = "${msg}0";
	  			if(msg!=0){
	  				$("#tanchuang").css("display","");
	  			}
	  			
	  		</SCRIPT>
	  		
		<div class="mainbody" style="background: #EEEEEE;">
			
			<!-- 搜索区域-->
			<div style=" width:100%; height:33px;  padding: 5px 2.5%; padding-top: 10px; height: 55px;" >
				<div style=" border: 0.5px solid #cccccc;height:37px; width: 100%; border-radius: 0.5em; background-color: white; ">
					<form name="sousuo" action="course!sousuo.action">
						<a href="javascript:sousuo.submit();">
							<div  style="float:left; width: 40px;"><img style="width: 18px; margin-left: 20%; margin-top: 7px;" src="<%=request.getContextPath()%>/images/sousuo.png"/></div>
						</a>
							<input style="float: left; width:75%; height: 30px; border:0; border-radius: 0.7em; font-size:16px;"  id="keyword" name="keyword" type="text" placeholder="搜索商品" value="${keyword}" />
					</form>
				</div>
			</div>
			<div style="clear: both;width: 100%;height: 5px;background-color: #efefef;"></div>
			
			
			<!-- 分类区域-->
			<div style="width: 100%;padding: 13px 2.5%;height: 46px;">
				<div style="background-color: #ef8201;width: 3px;height: 20px;float: left;border-radius:1em;margin-right: 10px; ">
					
				</div>
				<div style="height: 10px;color:#ef8201;float: left;font-size: 18px;margin-top: -2px;">
					课程分类
				</div>
			</div>
			
			<div style="clear: both;width: 100%;height: 1px;background-color:  #efefef;"></div>
			<div style="width: 100%;height: 15px;background-color:  white;"></div>
			<div  style="overflow:auto;display: block;padding-bottom: 10px;">
	    		<table style="min-width: 100%;">
	        		<tr>
	        			<s:iterator value="classify2s">
		           			<td style="min-width: 80px;">
				           		<div  onclick="location='course!sousuo.action?classify2.id=${id}'" style="text-align: center;" >
									<div><img src="<%=path%>/${img}"  style="width:40px;"/></div>
									<div style="margin-top:5px;padding:0px;"  >${name}</div>
								</div>  
		           			</td>
	        			</s:iterator>
	        		</tr>
	    		</table>
			</div>
			<div style="clear: both;width: 100%;height: 10px;background-color: #efefef;clear: both;"></div>
			<!-- 套餐区域-->
			
			<div style="width: 100%;height: 40px;text-align: center;font-size: 18px;color:#ef8201; padding: 5px 0;"> —— &nbsp; 课程套餐 &nbsp; —— </div>
				
			<div style="width: 100%;overflow:hidden;">
				<s:iterator value="taocans">
					<div style="width: 50%;border: 0.5px dotted #efefef;padding: 10px 0;float: left;height:80px;">
						<img src="<%=path%>/${img}"  style="width:35%;margin-left: 8px;float: left;" />
						<div style="width: 55%;float: right;">
							<div>${name}</div>
							<div style="padding-top: 10px;color: red;">￥${money}</div>
						</div>
					</div>
				</s:iterator>
			</div>
			<div style="clear: both;width: 100%;height:5px;background-color: #efefef;"></div>
			
			<!-- 课程区域-->
			<div style="width: 100%;height:45px;text-align: center;font-size: 15px;padding-top: 10px;" >
			
				<div style="min-width: 33.3%;height: 35px;float: left;">
					<div  id="huodong1" style="width: 75px;height: 35px;border-bottom: 2px solid white;margin: 0 auto;" onclick="xuanze('huodong')">活动课程</div>
				</div>
				<div style="min-width: 33.3%;height: 35px;float: left;">
					<div  id="mianfei1" style="width: 75px;height: 35px;border-bottom: 2px solid white;margin: 0 auto;" onclick="xuanze('mianfei')">免费课程</div>
				</div>
				<div style="min-width: 33.3%;height: 35px;float: left;">
					<div id="fufei1" style="width: 75px;height: 35px;border-bottom: 2px solid white;margin: 0 auto ;" onclick="xuanze('fufei')">付费课程</div>
				</div>
			
			</div>
			<div style="clear: both;width: 100%;height:1px;background-color: #efefef;"></div>
			
			<!--所有课程内容  -->
			<div style="width: 100%;"  id="suoyou" >
				
				<s:iterator value="courses">
					<div style="width: 100%;padding: 10px 2.5%;" onclick="location='course!thecourse.action?course.id=${id}&content.id=0&id1=${team.id}'">
						<img src="<%=path%>/${img}"  style="width:30%;float: left;" />
						<s:if test="status==-1">
							<img src="<%=path%>/img/chuxiao.png"  style="width:10%;float: left;z-index: 22;margin-left: -30%;" />
						</s:if>
						
						<div style="width:65%;float: right;">
							<div style="width: 100%;font-size: 15px;padding-bottom: 5px;">${title}</div>
							
							<div style="width: 100%;padding-bottom: 5px;font-size: 12px;color:#888888">
								播放次数：${readNum}
								<s:if test="money>0">
									<div style="font-size: 15px;color:red;float: right;width: auto;">￥${money}</div>
								</s:if><s:else>
									<div style="font-size: 15px;color:red;float: right;width: auto;">免费</div>
								</s:else>
							</div>
							<div style="width: 100%;padding-bottom: 5px;font-size: 12px;color:#888888">
								讲师：${teacher}
								<s:if test="status==1">
									<div style="font-size: 12px;float: right;width: auto;text-decoration:line-through;">价格：￥${twomoney}</div>
								</s:if>
							</div>
							
						</div>
					</div>
					<div style="clear: both;width: 100%;height:10px;"></div>
					<div style="width: 100%;height:1px;background-color: #efefef;"></div>
				</s:iterator>
			
			</div>
			<!-- 活动课程内容  -->
			<div style="width: 100%;display: none;"  id="huodong" >
				
				<s:iterator value="course0s">
					<div style="width: 100%;padding: 10px 2.5%;" onclick="location='course!thecourse.action?course.id=${id}&content.id=0&id1=${team.id}'">
						<img src="<%=path%>/${img}"  style="width:30%;float: left;" />
						
						<img src="<%=path%>/img/chuxiao.png"  style="width:10%;float: left;z-index: 22;margin-left: -30%;" />
						
						
						<div style="width:65%;float: right;">
							<div style="width: 100%;font-size: 15px;padding-bottom: 5px;">${title}</div>
							
							<div style="width: 100%;padding-bottom: 5px;font-size: 12px;color:#888888">
								播放次数：${readNum}
									<div style="font-size: 15px;color:red;float: right;width: auto;">￥${money}</div>
							</div>
							<div style="width: 100%;padding-bottom: 5px;font-size: 12px;color:#888888">
								讲师：${teacher}
								<div style="font-size: 12px;float: right;width: auto;text-decoration:line-through;">价格：￥${twomoney}</div>
							</div>
							
						</div>
					</div>
					<div style="clear: both;width: 100%;height:10px;"></div>
					<div style="width: 100%;height:1px;background-color: #efefef;"></div>
				</s:iterator>
			
			</div>
			
			<!-- 免费课程内容  -->
			<div style="width: 100%;display: none;"  id="mianfei">
				
				<s:iterator value="course1s">
					<div style="width: 100%;padding: 10px 2.5%;" onclick="location='course!thecourse.action?course.id=${id}&content.id=0&id1=${team.id}'">
						<img src="<%=path%>/${img}"  style="width:30%;float: left;" />
						
						<div style="width:65%;float: right;">
							<div style="width: 100%;font-size: 15px;padding-bottom: 5px;">${title}</div>
							
							<div style="width: 100%;padding-bottom: 5px;font-size: 12px;color:#888888">
								播放次数：${readNum}
							</div>
							<div style="width: 100%;padding-bottom: 5px;font-size: 12px;color:#888888">
								讲师：${teacher}
								<div style="font-size: 15px;color:red;float: right;width: auto;margin-top: -10px;">免费</div>
							</div>
							
						</div>
					</div>
					<div style="clear: both;width: 100%;height:10px;"></div>
					<div style="width: 100%;height:1px;background-color: #efefef;"></div>
				</s:iterator>
			
			</div>
			<!-- 付费课程内容  -->
			<div style="width: 100%;display: none;" id="fufei">
				
				<s:iterator value="course2s">
					<div style="width: 100%;padding: 10px 2.5%;" onclick="location='course!thecourse.action?course.id=${id}&content.id=0&id1=${team.id}'">
						<img src="<%=path%>/${img}"  style="width:30%;float: left;" />
						
						<div style="width:65%;float: right;">
							<div style="width: 100%;font-size: 15px;padding-bottom: 5px;">${title}</div>
							
							<div style="width: 100%;padding-bottom: 5px;font-size: 12px;color:#888888">
								播放次数：${readNum}
							</div>
							<div style="width: 100%;padding-bottom: 5px;font-size: 12px;color:#888888">
								讲师：${teacher}
								<div style="font-size: 15px;color:red;float: right;width: auto;margin-top: -10px;">￥${money}</div>
							</div>
							
						</div>
					</div>
					<div style="clear: both;width: 100%;height:10px;"></div>
					<div style="width: 100%;height:1px;background-color: #efefef;"></div>
				</s:iterator>
			
			</div>
			
			
			
			<div style="clear: both;width: 100%;height: 70px;"></div>
			
			
			<div style="margin-bottom: 70px;padding: 0;">
				<s:include value="bottom.jsp"></s:include>
			</div>
			
			<script src="<%=path%>/js/index.js"></script>
			
		</div>
	</body>
</html>
