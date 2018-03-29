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
    
    <title>我的订单</title>
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
	  		<!-- 这个是评分 -->
			<div id="pinglun" onclick="guanbi();" style="display:none;width: 100%;position: fixed; top:0px; bottom:0px; z-index: 10;background: rgba(44,44,44, 0.5);">
  		 		<div onclick="event.stopPropagation();"  style="position: fixed;top:30%;left:15%;width: 70%;font-size: 15px;z-index: 12; ">
					<input id="order1id" type="hidden" />
					<div style="width: 100%;background-color: white;border-radius:0.5em;">
						<div style="width: 100%;text-align: center;padding: 20px 5px 50px;" id="alertmsg">
							<div style="font-size: 18px;width: 100%;padding-bottom: 10px;">评分</div>
							<img alt="" class="a1 a2 a3 a4 a5" src="<%=path%>/images/xinxin2.png" style="width: 30px;" onclick="xuanze(1)">
							<img alt="" class="a2 a3 a4 a5" src="<%=path%>/images/xinxin2.png" style="width: 30px;" onclick="xuanze(2)">
							<img alt="" class="a3 a4 a5" src="<%=path%>/images/xinxin2.png" style="width: 30px;" onclick="xuanze(3)">
							<img alt="" class="a4 a5" src="<%=path%>/images/xinxin2.png" style="width: 30px;" onclick="xuanze(4)">
							<img alt="" class="a5" src="<%=path%>/images/xinxin2.png" style="width:30px;" onclick="xuanze(5)">
						</div>
						
						<a id="href"><div onclick="queren();" style="width: 60%;text-align: center;margin:0 20%;background-color:#18aaee;padding: 5px;color: white; border-radius:0.3em;">提交评分</div></a>
						<div style="width: 100%;height: 20px;"></div>
					</div>
				</div>
			</div>
			<SCRIPT type="text/javascript">
				var pingfennum = 0;
				function guanbi(){
					pingfennum=0;
					$("#order1id").val("");
					$("#pinglun").css("display","none");
	  			}
	  			function pingfen(id){
	  				$("#order1id").val(id);
	  				$(".a5").attr("src","images/xinxin2.png");
	  				$("#pinglun").css("display","");
	  				event.stopPropagation();
	  			}
	  			function xuanze(pingfen2){
	  				pingfennum = pingfen2;
	  				$(".a5").attr("src","images/xinxin2.png");
	  				$(".a"+pingfennum).attr("src","images/xinxin1.png");
	  			}
	  			function queren(){
	  				var order1id= $("#order1id").val();
	  				if(pingfennum>0){
	  					window.location="order!pingfen.action?order1.id="+order1id+"&order1.pingfen="+pingfennum;
		  			}
	  			}
	  		</SCRIPT>
			
		<div class="mainbody" style="">
			<!--所有课程内容  -->
			<div style="width: 100%;"  id="suoyou" >
			<s:iterator value="order2s">
				<div style="width: 100%;padding: 15px 2.5% 10px;font-size: 10px;height: 40px;color:#888888;">
					<div style="min-width: 40%;float: left;">订单编号：${oid}</div>
					<div style="min-width: 40%;float: right;text-align: right;">购买时间：${time}</div>
				</div>
				<div style="clear: both;width: 100%;height:1px;background-color: #efefef;"></div>
				
				<s:if test="type==1">
					<div onclick="location='course!totaocan.action?taocan.id=${typeid}&id1=${team.id}'" style="width: 100%;padding: 10px 2.5%;font-size: 15px;height: 40px;color:black;">
						<div style="min-width: 40%;float: left;">${title}</div>
						<div style="min-width: 40%;float: right;font-size: 15px;color:red;text-align: right;">${price}</div>
					</div>
					<div style="clear: both;width: 100%;height:1px;background-color: #efefef;"></div>
				</s:if><s:elseif test="type==2">
					<div style="width: 100%;padding: 10px 2.5%;font-size: 15px;height: 40px;color:black;">
						<div style="min-width: 60%;float: left;color:red;">活动报名</div>
					</div>
					<div style="clear: both;width: 100%;height:1px;background-color: #efefef;"></div>
				</s:elseif>
				
				<s:if test="type==2">
						<div style="width: 100%;padding: 10px 2.5%;" onclick="location='banner!thehuodong.action?banner.id=${banner.id}&id1=${team.id}'">
							<img src="<%=path%>/${banner.img}"  style="width:35%;float: left;" />
							
							<div style="width:60%;float: right;padding-top: 5px;">
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
				</s:if><s:else>
						<s:iterator value="courses">
							<div style="width: 100%;padding: 10px 2.5%;" onclick="location='course!thecourse.action?course.id=${id}&content.id=0&id1=${team.id}'">
								<img src="<%=path%>/${img}"  style="width:35%;float: left;" />
								<div style="width:60%;float: right;padding-top: 5px;">
									<div style="width: 100%;font-size: 15px;padding-bottom: 5px;">${title}</div>
									<div style="width: 100%;padding-bottom: 5px;font-size: 12px;color:#888888">
										播放次数：${readNum}
									</div>
									<div style="width: 100%;font-size: 12px;color:#888888">
										讲师：${teacher}
										<s:if test="collectid==null">
											<div style="font-size: 12px;float: right;width: auto;margin-top: 15px;background-color: #ef8201;padding: 5px 10px;color:white;border-radius:0.2em;" onclick="pingfen(${order1id});">去评分</div>
										</s:if><s:else>
											<div style="font-size: 12px;float: right;width: auto;margin-top: 15px;background-color: #aaaaaa;padding: 5px 10px;color:white;border-radius:0.2em;" >已评${collectid}分</div>
										</s:else>
									</div>
									<div style="font-size: 15px;color:red;float: left;width: auto;padding-top: 10px;">
										￥${money}
									</div>
								</div>
							</div>
							<div style="clear: both;width: 100%;height:10px;"></div>
							<div style="width: 100%;height:1px;background-color: #efefef;"></div>
						</s:iterator>
				</s:else>
				<div style="clear: both;width: 100%;height:5px;background-color: #efefef;"></div>
			</s:iterator>
		</div>
			
	</div>
</body>
</html>
