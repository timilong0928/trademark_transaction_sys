<%@ page language="java" import="java.util.*,pojo.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>  

<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	Peizhi peizhi = (Peizhi)request.getAttribute("peizhi");
	String appid = peizhi.getAppid();
	
	Banner banner = (Banner)request.getAttribute("banner");
	String title ="洛奇教育线下活动";
	String img =request.getScheme()+"://"+request.getServerName()+"/"+banner.getImg();
	String yinwen =banner.getHdtitle();
	
	Map<String, String> ret = (Map<String, String>)request.getAttribute("ret");
	String jsapi_ticket =(String)ret.get("jsapi_ticket");
	String nonceStr =(String)ret.get("nonceStr");
	String timestamp =(String)ret.get("timestamp");
	String sign =(String)ret.get("signature");
	String u =(String)ret.get("url"); 
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html class="body_bg">
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
	<title>活动详情</title>
	<link rel="stylesheet" href="style/index.css" />
	<link rel="stylesheet" href="style/common.css" />
	<link rel="stylesheet" href="style/swiper.min.css" />
	<link rel="stylesheet" href="style/sp.css" />
	<script type="text/javascript" src="js/jquery.min.js" ></script>
	<script type="text/javascript" src="js/swiper.min.js" ></script>
	<script type="text/javascript" src="font/iconfont.js" ></script>
</head>
<body class="body_bg"  style="background-color: #efefef;">
	<div class="page" style="background-color: white;" >
			<div>
				<img alt="" src="<%=path %>/${banner.img}" style="width:100%;">
			</div>
			 
			 <div class="news_dis" style="font-size: 13px;">
		        <div class="" style="margin-bottom: 5px;text-align: center;">
		            	<span style="font-size: 15px;word-wrap: break-word; word-break: break-all;color:black;">
		            		${banner.hdtitle}
		            	</span>
		        </div>
		        <div class="news_dis_text" style="color:#6c6c6c">
		           ${banner.hdcontent}
		        </div>
		    </div>
	</div>
	<div style="clear: both;width: 100%;height: 60px;background-color: #efefef;clear: both;"></div>
	<!-- 菜单 -->
	<div style="position: fixed;bottom:1px;z-index: 2;width: 100%; text-align: center;height: 50px;font-size: 16px;color: white;background-color: white;">
		<div id="kaishi"  style="display:none; float: left;width: 90%;background-color:#ef8201;height: 40px;padding-top: 7px;margin:5px 5%;border-radius:0.3em;" onclick="location='order!baoming.action?banner.id=${banner.id}'">我要报名（${banner.hdMoney}元）</div>
		<div id="jieshu" onclick="alert('活动已结束');" style="float: left;width: 90%;background-color:#aaaaaa;height: 40px;padding-top: 7px;margin:5px 5%;border-radius:0.3em;" >报名已截止</div>
	</div>
	<input type="hidden" value="${banner.hdtime}" id="hdtime"/>
	<input type="hidden" id="teamid" value="${team.id}">
	<input type="hidden" id="bannerid" value="${banner.id}">
	<script type="text/javascript">
		$(function(){
			var hdtime = new Date(Date.parse($("#hdtime").val()));
			var myDate = new Date();
			if(myDate>hdtime){
            }else{
				$("#kaishi").css("display","");
				$("#jieshu").css("display","none");
            }
			
		});
	</script>
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
		var bannerid = $("#bannerid").val();
		
        location="http://l9lqjy.xmyunxin.com/banner!thehuodong.action?banner.id="+bannerid+"&id1="+teamid;
      });
</script>

</body>
</html>
