<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>  
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>订单支付</title>
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
	
  </head>
  
  <body style="background-color: #efefef;">
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
	  		
		<div class="mainbody" style="">
			
			
			<!--所有课程内容  -->
			<div style="width: 100%;"  id="suoyou" >
				<s:if test="#session.type==0">
					<s:iterator value="courses">
						<div style="width: 100%;padding: 10px 2.5%;" onclick="location='course!thecourse.action?course.id=${id}&content.id=0&id1=${team.id}'">
							<img src="<%=path%>/${img}"  style="width:40%;float: left;" />
							<s:if test="status==-1">
								<img src="<%=path%>/img/chuxiao.png"  style="width:10%;float: left;z-index: 22;margin-left: -30%;" />
							</s:if>
							
							<div style="width:55%;float: right;padding-top: 5px;">
								<div style="width: 100%;font-size: 15px;padding-bottom: 5px;">${title}</div>
								
								<div style="width: 100%;padding-bottom: 5px;font-size: 12px;color:#888888">
									播放次数：${readNum}
								</div>
								<div style="width: 100%;padding-bottom: 5px;font-size: 12px;color:#888888">
									讲师：${teacher}
								</div>
								<div style="font-size: 15px;color:red;float: left;width: auto;padding-top: 10px;">
									￥${money}
									<s:if test="status==1">	
										<span style="font-size: 12px;text-decoration:line-through;color:#888888;">价格￥${twomoney}</span>
									</s:if>
								</div>
							</div>
						</div>
						<div style="clear: both;width: 100%;height:10px;"></div>
						<div style="width: 100%;height:1px;background-color: #efefef;"></div>
					</s:iterator>
				</s:if>
				<s:elseif test="#session.type==1">
					<div style="width: 100%;padding: 10px 2.5%;" onclick="location='course!totaocan.action?taocan.id=${taocan.id}&id1=${team.id}'">
						<img src="<%=path%>/${taocan.img}"  style="width:40%;float: left;" />
						<div style="width:55%;float: right;padding-top: 5px;">
							<div style="width: 100%;font-size: 15px;padding-bottom: 5px;">${taocan.name}</div>
							
							<div style="width: 100%;padding-bottom: 5px;font-size: 12px;color:#888888">
								购买次数：${taocan.payNum}
							</div>
							<div style="width: 100%;padding-bottom: 5px;font-size: 12px;color:#888888">
							</div>
							<div style="font-size: 15px;color:red;float: left;width: auto;padding-top: 10px;">
								￥${taocan.money}
								<span style="font-size: 12px;text-decoration:line-through;color:#888888;">原价￥${taocan.twomoney}</span>
							</div>
						</div>
					</div>
					<div style="clear: both;width: 100%;height:10px;"></div>
					<div style="width: 100%;height:1px;background-color: #efefef;"></div>
				
				</s:elseif><s:else>
					<div style="width: 100%;padding: 10px 2.5%;" onclick="location='banner!thehuodong.action?banner.id=${banner.id}&id1=${team.id}'">
						<img src="<%=path%>/${banner.img}"  style="width:40%;float: left;" />
						
						<div style="width:55%;float: right;padding-top: 5px;">
							<div style="width: 100%;font-size: 15px;padding-bottom: 5px;">${banner.hdtitle}</div>
							
							<div style="width: 100%;padding-bottom: 5px;font-size: 12px;color:#888888">
							</div>
							<div style="width: 100%;padding-bottom: 5px;font-size: 12px;color:#888888">
							</div>
							<div style="font-size: 15px;color:red;float: left;width: auto;padding-top: 10px;">
								￥${banner.hdMoney}
							</div>
						</div>
					</div>
					<div style="clear: both;width: 100%;height:10px;"></div>
					<div style="width: 100%;height:1px;background-color: #efefef;"></div>
				
				</s:else>
				<div style="width: 100%;height:5px;background-color: #efefef;"></div>
			</div>
			
			<!-- 支付方式 -->
			<div style="width: 100%;">
				<div style="font-size: 16px;padding: 15px 2.5%;color:black">支付方式</div>
				
				<div style="width: 95%;height:1px;background-color: #efefef;margin: 0 2.5%"></div>
				
				<div style="width: 100%;padding: 20px 2.5%;font-size: 16px;background-color: white;height: 70px;">
					<img src="<%=path%>/images/weixin.png"  style="width:30px;float: left;" />
					<div style="margin:2px 0 0 10px; width: 80px;float: left;">微信支付</div>
					<img src="<%=path%>/images/gou.png"  style="width:20px;height:20px; float: right;" />
				</div>
			</div>
			<div style="clear: both;width: 100%;height:5px;background-color: #efefef;border-radius:0.3em;"></div>
			
			<!-- 使用积分  -->
			<div style="width: 100%;">
				<div style="width: 100%;padding: 20px 2.5%;font-size: 16px;background-color: white;" >
					使用${allpoint}积分抵扣￥<fmt:formatNumber type="number" value="${allpoint/award.award}" pattern="0.00" maxFractionDigits="2"/>
					<img onclick="shiyong(0);" id="xuanze1" src="<%=path%>/images/gou.png"  style="width:20px;height:20px; float: right;border-radius:0.3em;" /> 
					<img onclick="shiyong(1);" id="xuanze0" src="<%=path%>/images/gou2.png"  style="width:20px;height:20px; float: right;border-radius:0.3em;display: none;" /> 
					<input type="hidden" id="xuanze" value="1">
				</div>
			</div>
			<div style="clear: both;width: 100%;height:60px;background-color: #efefef;border-radius:0.3em;"></div>
			<SCRIPT type="text/javascript">
					function shiyong(id){
						$("#xuanze").val(id);
						if(id==1){
							$("#xuanze0").css("display","none");
							$("#xuanze1").css("display","");
							$("#price2").css("display","");
							$("#price1").css("display","");
							$("#price0").css("display","none");
						}else{
							$("#xuanze0").css("display","");
							$("#xuanze1").css("display","none");

							$("#price2").css("display","none");
							$("#price1").css("display","none");
							$("#price0").css("display","");
							
						}
						
					}
			</SCRIPT>
			
			<div style="width: 100%;height: 50px;background-color: white; position:fixed;bottom:0;">
					<div style="width: 60%;height: 50px;float: left;background-color: white;padding: 10px 0 0 2.5%;font-size:12px;">
						共计：<span id="price1" style="color:red;font-size:15px;">￥
						<s:if test="allpoint<team.point">
							0.01
						</s:if><s:else>
							<fmt:formatNumber type="number" value="${price-(allpoint/award.award)}" pattern="0.00" maxFractionDigits="2"/>
						</s:else>
						
						</span>
							<span id="price0" style="display:none;color:red;font-size:15px;">￥${price}</span>
							<span id="price2" style="color:#888888;font-size:8px;">积分抵扣￥<fmt:formatNumber type="number" value="${allpoint/award.award}" pattern="0.00" maxFractionDigits="2"/></span>
					</div>
					
					<div onclick="location='order!tijiaoorder.action?course.id=${course.id}&xuanze='+$('#xuanze').val()" style="width: 40%;height: 50px;float: right;background-color: #ef8201;text-align: center;font-size: 20px;padding: 13px 0; color:white;">
						去支付
					</div>
			</div>
			
			
		</div>
	</body>
</html>
