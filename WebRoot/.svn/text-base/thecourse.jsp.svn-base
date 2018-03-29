<%@ page language="java" import="java.util.*,pojo.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
Peizhi peizhi = (Peizhi)request.getAttribute("peizhi");
String appid = peizhi.getAppid();



Course course = (Course)request.getAttribute("course");
String title ="洛奇教育课程";
String img =request.getScheme()+"://"+request.getServerName()+"/"+course.getImg();
String yinwen =course.getTitle();
int id1 = course.getId();

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
	  		
	  	<div>
	  		<!-- 视频 -->
			<div class="mainbody" style="background: #EEEEEE;width: 100%;overflow:hidden;">
				<s:if test="content!=null">
					<video id="video" style=" background:transparent url('${course.img}') 50% 50% no-repeat; background-size:cover;width:100%;"  controls="controls" poster="images/tm_bg.png">
			            <source src="${content.content1}" type="video/mp4">
			            <source src="${content.content1}" type="video/webm">
			            <source src="${content.content1}" type="video/ogg">
			            	您的浏览器不支持Video标签。
			        </video>
				</s:if>
				<s:else>
					<img style="width: 100%;" src="${course.img}" onclick="alert('请先购买课程')"/>
				</s:else>
			</div>
			
			<!-- 标题部分 -->
			<div style="width: 100%;padding:10px 2.5%;">
				<div style="font-size: 18px;color:black;">${course.title}</div>
				<div style="font-size: 12px;color:#888888;padding-top: 5px;">播放次数：${course.readNum}</div>
				
				<div style="font-size: 16px;color:red;margin: 10px 0 5px;">￥${course.money}
				<s:if test="course.status==1">
					<span style="font-size: 12px;color:#888888;text-decoration:line-through;">价格：￥${course.twomoney}</span>
				</s:if>
				</div>
				
			</div>
			<div style="clear: both;width: 100%;height:5px;background-color: #efefef;"></div>
			
			<!-- 目录部分 -->
			<div style="width: 100%;">
				<div style="font-size: 18px;padding: 15px 2.5%;"><span style="color:black">目录摘要</span> &nbsp; 共${course.period}章</div>
				
				<div style="width: 100%;height:1px;background-color: #efefef;"></div>
				<s:iterator value="contents">
					<s:if test="id==content.id">
						<div style="width: 100%;padding: 10px 2.5%;color:black">
							<img src="images/xuanzhong.png" style="width: 15px;margin-right: 10px;"/>
							${title}
						</div>
					</s:if><s:else>
						<s:if test="order1==null&&isTest==0">
							<div style="width: 100%;padding: 10px 2.5%;color:#888888;" onclick="alert('该课程需要购买才可以观看。请先购买')" >
								<img src="images/xuanzhong2.png" style="width: 15px;margin-right: 10px;"/>
								${title}
							</div>
						</s:if><s:else>
							<div style="width: 100%;padding: 10px 2.5%;color:#888888;" onclick="location='course!thecourse.action?course.id=${course.id}&content.id=${id}&id1=${team.id}'">
								<img src="images/xuanzhong2.png" style="width: 15px;margin-right: 10px;"/>
								${title}
							</div>
						</s:else>
					</s:else>
				</s:iterator>
				
			</div>
			<div style="clear: both;width: 100%;height:5px;background-color: #efefef;"></div>
			
			<!-- 讲师部分 -->
			<div style="width: 100%;">
				<div style="font-size: 18px;padding: 15px 2.5%;color:black">讲师</div>
				
				<div style="width: 100%;height:1px;background-color: #efefef;"></div>
				
				<div style="width: 100%;padding: 10px 2.5%;height: 100px;font-size: 16px;" onclick="location='course!sousuo.action?teacherid=${teacher.id}'">
					<img src="${teacher.img}" style="width: 80px;margin-right: 10px;float: left;"/>
					<div style="width: 51%;float: left;margin-top: 15px;color:black">${teacher.rname}</div>
					<div style="width: 51%;float: left;margin-top: 5px;color:#666666;">${teacher.qianming}</div>
				</div>
				
			</div>
			<div style="clear: both;width: 100%;height:5px;background-color: #efefef;"></div>
			
			<!-- 课程介绍 -->
			<div style="width: 100%;">
				<div style="font-size: 18px;padding: 15px 2.5%;color:black">课程介绍</div>
				
				<div style="width: 100%;height:1px;background-color: #efefef;"></div>
				
				<div style="width: 100%;padding: 10px 2.5%;font-size: 16px;">
				
				<!--
					  appId: '<%=appid%>',
				      timestamp: <%=timestamp%>,
				      nonceStr: '<%=nonceStr%>',
				      signature: '<%=sign%>',
				-->
					${course.introduce}
				</div>
				
			</div>
			<div style="clear: both;width: 100%;height:5px;background-color: #efefef;"></div>
			
			
			<!-- 评价  -->
			<div style="width: 100%;">
				<div style="width: 100%;height: 45px;text-align: center;font-size: 18px;color:#ef8201; padding: 10px 0;"> —— &nbsp; 评论 &nbsp; —— </div>
					
				<div style="width: 100%;height:1px;background-color: #efefef;"></div>
				
				<s:iterator value="comments">
					<div style="width: 100%;padding: 10px 2.5%;font-size: 15px;color:#888888;overflow:hidden;">
						${name}:
					</div>
					<div style="width: 100%;padding: 10px 2.5%;font-size: 15px;color:black;overflow:hidden;">
						${content}
					</div>
					<s:if test="huifu!=null&&huifu!=''">
						<div style="width: 95%;padding: 10px 2.5%;font-size: 15px;color:black;background-color: #efefef;margin-left: 2.5%;overflow:auto;">
							老师回复：${huifu}
						</div>
					</s:if>
				</s:iterator>
				<div id="addpinglun">
					
				</div>
				
				<div style="clear: both;width: 100%;height:10px;background-color: white;"></div>
			</div>
			<div style="width: 100%;height:80px;background-color: #efefef;"></div>
			
			
			<!-- 底部菜单 -->
			<s:if test="order1==null">
				<div style="width: 100%;height: 50px;background-color: white; position:fixed;bottom:0;">
					<div style="width: 5%;height: 50px;float: left;background-color: white;text-align: center;">
					</div>
					<div style="width: 20%;height: 50px;float: left;background-color: white;text-align: center;">
						<img alt="" src="<%=path%>/img/bottom1.png" onclick="location='index!index.action?id1=${team.id}'" style="width: 26px;margin-top: 5px;">
					</div>
					
					<div style="width: 20%;height: 50px;float: left;background-color: white;text-align: center;">
						<s:if test="collectid>0">
							<img id="shoucang1" alt="" src="<%=path%>/img/bottom13.png" onclick="qushoucang();" style="width: 40px;margin-top: 5px;">
							<img id="shoucang2" alt="" src="<%=path%>/img/bottom3.png" onclick="qushoucang();" style="width: 26px;margin-top: 5px;display: none">
						</s:if><s:else>
							<img id="shoucang1" alt="" src="<%=path%>/img/bottom13.png" onclick="qushoucang();" style="width: 40px;margin-top: 5px;display: none">
							<img id="shoucang2" alt="" src="<%=path%>/img/bottom3.png" onclick="qushoucang();" style="width: 26px;margin-top: 5px;">
						</s:else>
					</div>
					
					<div style="width: 5%;height: 50px;float: left;background-color: white;text-align: center;">
					</div>
					<div onclick="location='order!buy.action?course.id=${course.id}'" style="width: 50%;height: 60px;float: right;background-color: #ef8201;text-align: center;font-size: 20px;padding: 15px 0; color:white;">
						立即购买
					</div>
				</div>
			</s:if><s:else>
				<div id="caidan" style="width: 100%;height: 50px;background-color: white; position:fixed;bottom:0;">
					<div style="width: 5%;height: 50px;float: left;background-color: white;text-align: center;">
					</div>
					<div style="width: 20%;height: 50px;float: left;background-color: white;text-align: center;">
						<img alt="" src="<%=path%>/img/bottom1.png" onclick="location='index!index.action?id1=${team.id}'" style="width: 26px;margin-top: 5px;">
					</div>
					<div style="width: 20%;height: 50px;float: left;background-color: white;text-align: center;">
						<s:if test="collectid>0">
							<img id="shoucang1" alt="" src="<%=path%>/img/bottom13.png" onclick="qushoucang();" style="width: 40px;margin-top: 5px;">
							<img id="shoucang2" alt="" src="<%=path%>/img/bottom3.png" onclick="qushoucang();" style="width: 26px;margin-top: 5px;display: none">
						</s:if><s:else>
							<img id="shoucang1" alt="" src="<%=path%>/img/bottom13.png" onclick="qushoucang();" style="width: 40px;margin-top: 5px;display: none">
							<img id="shoucang2" alt="" src="<%=path%>/img/bottom3.png" onclick="qushoucang();" style="width: 26px;margin-top: 5px;">
						</s:else>
					</div>
					
					<div style="width: 5%;height:50px;float: left;background-color: white;text-align: center;">
					</div>
					<div onclick="qupinglun();" style="width: 50%;height: 50px;float: right;background-color: #ef8201;text-align: center;font-size: 20px;padding: 15px 0; color:white;">
						评论
					</div>
				 </div>
				 
				 <div id="pinglun" style="width: 100%;height: 50px;background-color: white; position:fixed;bottom:0;display: none;">
					<div onclick="" style="width: 68%;height: 50px;float: left;background-color: white;font-size: 20px;padding: 15px 0; color:white;">
						<input id="pinglunneirong" style="width: 90%;margin: -7px 0 0 20px;">
					</div>
					<div onclick="pinglun();" style="width: 30%;height: 50px;float: right;text-align: center;font-size: 17px;">
						<div style="width: 80%;margin: 7px 10%;background-color: #ef8201;padding: 5px 0;color:white;border-radius:0.3em;">
							发表评论
						</div>
					</div>
				 </div>
			 </s:else>
			 
			 
				<input type="hidden" id="endTime" value="${team.endTime}" >
				<input type="hidden" id="collectid" value="${collectid}" >
				<input type="hidden" id="teamid" value="${team.id}" >
				<input type="hidden" id="courseid" value="${course.id}" >
				<input type="hidden" id="contentid" value="${content.id}" >
				<input type="hidden" id="awardpinglunsum" value="${award.pinglunsum}" >
			<SCRIPT type="text/javascript">
				function qupinglun(){
					$("#caidan").css("display","none");
					$("#pinglun").css("display","");
				}


			
			function pinglun(){
				var courseid = $("#courseid").val();
				var contentid = $("#contentid").val();
				var pinglunneirong = $("#pinglunneirong").val();
				var awardpinglunsum = $("#awardpinglunsum").val();
				
				if(pinglunneirong==""){
					$("#alertmsg").html("请输入评论内容");
					$("#tanchuang").css("display","");
						return false;
				}
                var hdtime = new Date(Date.parse($("#endTime").val()));
    			var myDate = new Date();
    			if(myDate<hdtime){
    				$("#alertmsg").html("您的评论太快，请稍后评论");
					$("#tanchuang").css("display","");
					return false;
                }
				$.ajax({
			     	url:"course!pinglun.action",
			     	type:"post",
					data:{"course.id":courseid,"content.id":contentid,"comment.content":pinglunneirong},
			    	success:function(data){
					    	if(data=="1"){
					    		$("#alertmsg").html("请稍后重试");
								$("#tanchuang").css("display","");
						    }else if(data=="2"){
						    	$("#alertmsg").html("该课时评论次数已达上限");
								$("#tanchuang").css("display","");
							}else{
						    	 $("#pinglun").css("display","none");
						    	 $("#caidan").css("display","");
						    	 $("#addpinglun").append('<div style="width: 100%;padding: 10px 2.5%;font-size: 15px;color:#888888;overflow:hidden;">你刚刚说:</div>'
												+'<div style="width: 100%;padding: 10px 2.5%;font-size: 15px;color:black;overflow:hidden;">'+pinglunneirong+'</div>');
						    	 $("#pinglunneirong").val("");
						    	 $("#endTime").val(data);
							}
						},
					});
			}
		</SCRIPT>
			<SCRIPT type="text/javascript">
			function qushoucang(){
				var courseid = $("#courseid").val();
				var collectid = $("#collectid").val();
				if(collectid>0){
					$.ajax({
				     	url:"course!deleteshoucang.action",
				     	type:"post",
						data:{"collectid":collectid},
				    	success:function(data){
					    	 $("#shoucang1").css("display","none");
					    	 $("#shoucang2").css("display","");
					    	 $("#collectid").val("0");
						},
					});
				}else{
					$.ajax({
				     	url:"course!shoucang.action",
				     	type:"post",
						data:{"course.id":courseid},
				    	success:function(data){
					    	if(data!=null){
					    		$("#shoucang1").css("display","");
						    	$("#shoucang2").css("display","none");
						    	$("#collectid").val(data);
						    }
						},
					});
					
				}
			}
			
			</SCRIPT>
			
			
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
		var courseid = $("#courseid").val();
		var contentid = $("#contentid").val();
		if(contentid>0)
       		location="http://l9lqjy.xmyunxin.com/course!thecourse.action?course.id="+courseid+"&content.id="+contentid+"&id1="+teamid;
       	else
       		location="http://l9lqjy.xmyunxin.com/course!thecourse.action?course.id="+courseid+"&content.id=0&id1="+teamid;
      });
</script>
		</div>
	</body>
</html>
