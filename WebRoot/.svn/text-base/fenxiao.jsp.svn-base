<%@ page language="java" import="java.util.*,pojo.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>  

<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	Peizhi peizhi = (Peizhi)request.getAttribute("peizhi");
	String appid = peizhi.getAppid();
	
	Fenxiao fenxiao = (Fenxiao)request.getAttribute("fenxiao");
	String title =fenxiao.getTitle();
	String img =request.getScheme()+"://"+request.getServerName()+"/"+fenxiao.getImg();
	String yinwen =fenxiao.getHead();
	
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
	<title>我的分销</title>
	<link rel="stylesheet" href="style/index.css" />
	<link rel="stylesheet" href="style/common.css" />
	<link rel="stylesheet" href="style/swiper.min.css" />
	<link rel="stylesheet" href="style/sp.css" />
	<script type="text/javascript" src="js/jquery.min.js" ></script>
	<script type="text/javascript" src="js/swiper.min.js" ></script>
	<script type="text/javascript" src="font/iconfont.js" ></script>
	<STYLE type="text/css">
	img{
		width: 100%;
	}
	
	</STYLE>
	
</head>
<body class="body_bg"  style="background-color: #efefef;">
	<div class="page" style="background-color: white;" >
			${fenxiao.content}
	</div>
	
	
	

	<input type="hidden" id="teamid" value="${team.id}">
	
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
		
        location="http://l9lqjy.xmyunxin.com/team!fenxiao.action?id1="+teamid;
      });
</script>

</body>
</html>
