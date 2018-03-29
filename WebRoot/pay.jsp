<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

String appId = (String)session.getAttribute("appid");
String timeStamp =(String)session.getAttribute("timeStamp");
String nonceStr =(String)session.getAttribute("nonceStr");
String packageValue =(String)session.getAttribute("package");
String paySign =(String)session.getAttribute("sign");
%>

<!DOCTYPE HTML >
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>支付</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" >
	<link rel="stylesheet" href="<%=request.getContextPath()%>/admin/css/pintuer.css">
    <script src="<%=request.getContextPath()%>/admin/js/jquery.js"></script>
    <script src="<%=request.getContextPath()%>/admin/js/pintuer.js"></script>
  </head>
  
  <body style="font-size:14px;background:#F5F5F5;">
 		<!-- 这个是弹窗  -->
			<div id="tanchuang"  style="display:none;width: 100%;position: fixed; top:0px; bottom:0px; z-index: 2;background: rgba(44,44,44, 0.5);">
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
	  		
    <div style="position:fixed;top:0px;background:#000;width:100%;line-height:35px;font-weight:bold;color:#fff;font-size:16px;text-align:center;">
           <span style="clear:both;margin-right:5%;">洛奇教育课程购买</span>
    </div>
    <div style="margin-top:35px;height:60px;">
        <div style="text-align:center;height:26px;line-height:26px;font-style:italic;font-size:13px;"><span style="color:#32CD32;" class="icon-shield"> 您正在安全支付环境中，请放心付款</span></div>
        <div style="text-align:center;height:30px;line-height:30px;font-size:22px;font-weight:bold;">￥${order2.price}</div>
    </div>
    <div style="background:#fff;height:100px;">
        <div style="font-size:13px;height:23px;line-height:23px;text-algin:right;"><span style="float:left;margin-left:3px;">订单编号</span><span style="float:right;margin-right:3px;">${order2.oid}</span></div>
        <div style="font-size:13px;height:23px;line-height:23px;text-algin:right;"><span style="float:left;margin-left:3px;">交易类型</span><span style="float:right;margin-right:3px;">即时交易</span></div>
        <div style="font-size:13px;height:23px;line-height:23px;text-algin:right;"><span style="float:left;margin-left:3px;">附加内容</span><span style="float:right;margin-right:3px;">${order2.beizhu}</span></div>
    </div>
    <div class="form-button" style="text-align:center;margin-top:15px;">
			<a href="javascript:void(0)" onclick="callpay()"><button class="button" style="width:90%;background:#32CD32;color:#fff;" >
				立即支付</button></a>
	</div>
    
    
    <form name="form" action="order!pay.action" method="post">
       <input type="hidden" name="oid" value="${order2.oid}"/>
    </form>
	<script type="text/javascript">

  	function callpay(){

		 WeixinJSBridge.invoke('getBrandWCPayRequest',{
  		 "appId" : "<%=appId%>","timeStamp" : "<%=timeStamp%>", "nonceStr" : "<%=nonceStr%>", "package" : "<%=packageValue%>","signType" : "MD5", "paySign" : "<%=paySign%>" 
   			},function(res){
				WeixinJSBridge.log(res.err_msg);
 				//alert(res.err_code + res.err_desc + res.err_msg);
	            if(res.err_msg == "get_brand_wcpay_request:ok"){  
	            	$("#alertmsg").html("微信支付成功!");
					$("#tanchuang").css("display","");
					$('#href').attr('href','order!myorder.action');
	            }else if(res.err_msg == "get_brand_wcpay_request:cancel"){  
	                $("#alertmsg").html("用户取消支付!");
					$("#tanchuang").css("display",""); 
	            }else{  
	            	$("#alertmsg").html("微信支付失败!");
					$("#tanchuang").css("display","");
	            } 
			})
			

		}
  </script>
  </body>
</html>
