<%@ page language="java" import="java.util.*,pojo.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>  

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
Peizhi peizhi = (Peizhi)request.getAttribute("peizhi");
String appid = peizhi.getAppid();



Taocan taocan = (Taocan)request.getAttribute("taocan");
String title ="洛奇教育课程套餐";
String img =request.getScheme()+"://"+request.getServerName()+"/"+taocan.getImg();
String yinwen =taocan.getName();

Map<String, String> ret = (Map<String, String>)request.getAttribute("ret");
String jsapi_ticket =(String)ret.get("jsapi_ticket");
String nonceStr =(String)ret.get("nonceStr");
String timestamp =(String)ret.get("timestamp");
String sign =(String)ret.get("signature");
String u =(String)ret.get("url"); 

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>套餐详情</title>
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
		img{
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
			<div style="width: 100%;padding: 10px 2.5%;height: 90px;" >
					<img src="<%=path%>/${taocan.img}"  style="max-width:90px;float: left;" />
					<div style="width:65%;float: right;">
						<div style="width: 100%;font-size: 15px;padding-bottom: 20px;">${taocan.name}</div>
						<div style="font-size: 15px;color:red;float: left;width: auto;">￥${taocan.money}</div>
					</div>
			</div>
			<div style="width: 100%;height: 40px;padding: 9px 2.5%;background-color: #efefef;clear: both;">套餐课程内容</div>
			<div style="width: 100%;"  id="suoyou" >
				<s:iterator value="taocan.taocancourses">
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
				<div style="width: 100%;height:5px;background-color: #efefef;"></div>
			</div>
			
			<div style="width: 100%;height: 40px;padding: 9px 2.5%;background-color: #efefef;clear: both;">套餐介绍</div>
			<div>
				${taocan.introduce}
			</div>
			
			<div style="width: 100%;height:60px;padding: 9px 2.5%;background-color: #efefef;clear: both;"></div>
			<div style="width: 100%;height: 50px;background-color: white; position:fixed;bottom:0;">
				<div style="width: 50%;height: 50px;float: left;background-color: white;text-align: center;">
					<img  src="<%=path%>/img/bottom1.png" onclick="location='index!index.action?id1=${team.id}'" style="width: 26px;margin-top: 5px;">
				</div>
				<div onclick="location='order!buytaocan.action?taocan.id=${taocan.id}'" style="width: 50%;height: 50px;float: right;background-color: #ef8201;text-align: center;font-size: 18px;padding: 13px 0; color:white;">
					立即购买
				</div>
			</div>
			
			
		</div>
		
		<input type="hidden" value="${team.id}" id="teamid">
		<input type="hidden" value="${taocan.id}" id="taocanid">
		
		<script src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
			<script>
 wx.config({
      debug: false,
      appId: '<%=appid%>',
      timestamp: <%=timestamp%>,
      nonceStr: '<%=nonceStr%>',
      signature: '<%=sign%>',
      jsApiList: [
        'checkJsApi',
        'onMenuShareTimeline',
        'onMenuShareAppMessage',
        'onMenuShareQQ',
        'onMenuShareWeibo',
        'onMenuShareQZone',
        'hideMenuItems',
        'showMenuItems',
        'hideAllNonBaseMenuItem',
        'showAllNonBaseMenuItem',
        'translateVoice',
        'startRecord',
        'stopRecord',
        'onVoiceRecordEnd',
        'playVoice',
        'onVoicePlayEnd',
        'pauseVoice',
        'stopVoice',
        'uploadVoice',
        'downloadVoice',
        'chooseImage',
        'previewImage',
        'uploadImage',
        'downloadImage',
        'getNetworkType',
        'openLocation',
        'getLocation',
        'hideOptionMenu',
        'showOptionMenu',
        'closeWindow',
        'scanQRCode',
        'chooseWXPay',
        'openProductSpecificView',
        'addCard',
        'chooseCard',
        'openCard'
      ]
  });
  
   wx.ready(function(){
     
    wx.onMenuShareAppMessage({//分享给朋友
    title: '<%=title%>', // 分享标题
    desc: '<%=yinwen%>', // 分享描述
    link: location.href.split('#')[0], // 分享链接
    imgUrl: '<%=img%>', // 分享图标
    type: '', // 分享类型,music、video或link，不填默认为link
    dataUrl: '', // 如果type是music或video，则要提供数据链接，默认为空
    success: function (){
        // 用户确认分享后执行的回调函数
        alert("分享给朋友成功！");
    },
    cancel: function () {
        // 用户取消分享后执行的回调函数
        alert("分享给朋友失败！");
    },
    fail:function(){
   		alert("分享给朋友失败！"); 
    }
  });//
  
  
	wx.onMenuShareTimeline({//分享到朋友圈
	    title: '<%=title%>', // 分享标题
	    link: '<%=u%>', // 分享链接
	    imgUrl: '<%=img%>', // 分享图标
	    success: function () {
	        // 用户确认分享后执行的回调函数
	        alert("分享朋友圈成功！");
	    },
	    cancel: function () {
	        // 用户取消分享后执行的回调函数
	        alert("取消分享朋友圈！");
	    },
	    fail:function(){
	        alert("分享朋友圈失败！");
	    }
		});//
		
		 wx.onMenuShareQQ({//分享到qq
    title: '<%=title%>', // 分享标题
    desc: '<%=yinwen%>', // 分享描述
    link: '<%=u%>', // 分享链接
    imgUrl: '<%=img%>', // 分享图标
   success: function (){ 
        // 用户确认分享后执行的回调函数
        alert("分享给到qq成功！");
    },
    cancel: function () { 
        // 用户取消分享后执行的回调函数
        alert("分享给到qq失败！");
    },
    fail:function(){
    alert("分享给到qq失败！"); 
    }
  });//

wx.onMenuShareWeibo({//分享到腾讯微博
    title: '<%=title%>', // 分享标题
    desc: '<%=yinwen%>', // 分享描述
    link: '<%=u%>', // 分享链接
    imgUrl: '<%=img%>', // 分享图标
    success: function (){ 
        // 用户确认分享后执行的回调函数
        alert("分享给到腾讯微博成功！");
    },
    cancel: function () { 
        // 用户取消分享后执行的回调函数
        alert("分享给到腾讯微博失败！");
    },
    fail:function(){
    alert("分享给到腾讯微博失败！"); 
    }
  });//


wx.onMenuShareQZone({//分享到qq空间
    title: '<%=title%>', // 分享标题
    desc: '<%=yinwen%>', // 分享描述
    link: '<%=u%>', // 分享链接
    imgUrl: '<%=img%>', // 分享图标
    success: function (){ 
        // 用户确认分享后执行的回调函数
        alert("分享给到qq空间成功！");
    },
    cancel: function () { 
        // 用户取消分享后执行的回调函数
        alert("分享给到qq空间失败！");
    },
    fail:function(){
    alert("分享给到qq空间失败！"); 
    }
  });//

   });
   
    wx.error(function(res){
            // config信息验证失败会执行error函数，如签名过期导致验证失败，具体错误信息可以打开config的debug模式查看，也可以在返回的res参数中查看，对于SPA可以在这里更新签名。
         //alert(location.href.split('#')[0])
		var teamid = $("#teamid").val();
		var taocanid = $("#taocanid").val();
        location="http://l9lqjy.xmyunxin.com/course!totaocan.action?taocan.id="+taocanid+"&id1="+teamid;
      });
</script>

	</body>
</html>
