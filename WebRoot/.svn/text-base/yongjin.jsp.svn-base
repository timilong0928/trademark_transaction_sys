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
		我的佣金
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
		
		<style> 
			.bor_bottom{border-bottom: 2px solid #EF8200;color: #EF8200;}
			.change_bottom{border-bottom: 0px  #EF8200;color: black;}
			#border_b{border: 1px solid black; }
			.border_b{border: 1px solid black; }
			
		</style> 
		
		</head>

	<body >
		
  		
  		
	
    <div style="width: 100%;height: 100% ;background-color: #F1F1F1;">
    <!-- 这个是弹窗  -->
			<div id="tanchuang"  style="display:none;width: 100%;position: fixed; top:0px; bottom:0px; z-index: 99;background: rgba(44,44,44, 0.5);">
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
				function chakanxiangqing(name,kahao,yinghang){
					$("#alertmsg").html("姓名："+name+" <br/>卡号："+kahao+" <br/>开户行："+yinghang);
					$("#tanchuang").css("display","");
				}

	  			
	  		</SCRIPT>
    <!-- 这个是提交 -->
			<div id="tixian"  style="display:none;width: 100%;position: fixed; top:0px; bottom:0px; z-index: 10;background: rgba(44,44,44, 0.5);">
  		 		<div   style="position: fixed;top:15%;left:10%;width: 80%;font-size: 16px;z-index: 12; ">
					<input id="money" type="hidden" />
					<div style="width: 100%;background-color: white;border-radius:0.5em;">
						<div style="width: 100%;text-align: center;padding: 20px 5px 20px;" id="alertmsg">
							<div style="font-size: 17px;width: 100%;padding-bottom: 10px;">填写提现账号</div>
						</div>
						
						<div style="width: 100%;height: 230px;padding: 0 15px;font-size: 16px;" id="alertmsg">
							<div style="width: 30%;padding-bottom: 10px;float: left;">姓名</div>
							<input id="tixianname" style="width: 70%;float: left;text-align: right;border: 0;margin-top: 3px;" placeholder="请输入银行卡开户名" >
							<div style="width: 100%;float: left;height: 1px;background-color: #efefef;margin-bottom: 15px;"></div>
							
							<div style="width: 40%;padding-bottom: 10px;float: left;">银行卡号</div>
							<input id="tixiankahao" style="width: 60%;float: left;text-align: right;border: 0;margin-top: 3px;" placeholder="请输入您的银行卡账号" >
							<div style="width: 100%;float: left;height: 1px;background-color: #efefef;margin-bottom: 15px;"></div>
							
							<div style="width: 30%;padding-bottom: 10px;float: left;">开户行</div>
							<input id="tixianyinhang" style="width: 70%;float: left;text-align: right;border: 0;margin-top: 3px;" placeholder="请输入您的开户行" >
							<div style="width: 100%;float: left;height: 1px;background-color: #efefef;margin-bottom: 15px;"></div>
							
							<div style="width: 100%;padding-bottom: 5px;float: left;font-size: 8px;color:#ef8201;">温馨提示：</div>
							<div style="width: 100%;padding-bottom: 5px;float: left;font-size: 8px;">请提交正确的提现账号，以保障您的佣金及时到账！</div>
							
						</div>
						
						<div  style="width: 100%;text-align: center;height: 50px;">
							<div style="width: 100%;float: left;height: 1px;background-color: #efefef;"></div>
							<div onclick="$('#tixian').css('display','none');" style="width: 49%;padding: 15px;float: left;color:#888888;">取消</div>
							<div style="width: 1px;height: 49px;background-color: #efefef;float: left;"></div>
							<div onclick="querentixian();" style="width: 50%;padding: 15px;float: left;color:#ef8201;">确认</div>
						</div>
					</div>
				</div>
			</div>
			<SCRIPT type="text/javascript">
				function qutixian(){
					var minmoney = $("#minmoney").val();
					var tixiannum = $("#tixiannum").val();
					var keti = $("#keti").val();
					minmoney = parseFloat(minmoney,10);
					tixiannum = parseFloat(tixiannum,10);
					keti = parseFloat(keti,10);
					
					if(keti-tixiannum<0){
						$("#alertmsg").html("当前最多可提现"+keti);
						$("#tanchuang").css("display","");
					}else if(minmoney-tixiannum>0){
						$("#alertmsg").html("最低提现额度为"+minmoney);
						$("#tanchuang").css("display","");
					}else if(tixiannum>0){
						$("#tixian").css("display","");
					}else{
						$("#alertmsg").html("请输入正确的金额");
						$("#tanchuang").css("display","");
					}
				}
				function querentixian(){
					var minmoney = $("#minmoney").val();
					var tixiannum = $("#tixiannum").val();
					var keti = $("#keti").val();
					minmoney = parseFloat(minmoney,10);
					tixiannum = parseFloat(tixiannum,10);
					keti = parseFloat(keti,10);
					if(keti-tixiannum<0){
						$("#alertmsg").html("当前最多可提现"+keti);
						$("#tanchuang").css("display","");
					}else if(minmoney-tixiannum>0){
						$("#alertmsg").html("最低提现额度为"+minmoney);
						$("#tanchuang").css("display","");
					}else if(tixiannum>0){
						$("#tixian").css("display","");
					}else{
						$("#alertmsg").html("请输入正确的金额");
						$("#tanchuang").css("display","");
					}
					
					var tixianname = $("#tixianname").val();
					var tixiankahao = $("#tixiankahao").val();
					var tixianyinhang = $("#tixianyinhang").val();
					if(tixianname.length<2){
						$("#alertmsg").html("请输入正确的开户姓名");
						$("#tanchuang").css("display","");
					}else if(tixianname.length>5){
						$("#alertmsg").html("请输入正确的开户姓名");
						$("#tanchuang").css("display","");
					}else if(tixiankahao.length<15){
						$("#alertmsg").html("请输入正确的银行卡号");
						$("#tanchuang").css("display","");
					}else if(tixiankahao.length>25){
						$("#alertmsg").html("请输入正确的银行卡号");
						$("#tanchuang").css("display","");
					}else if(tixianyinhang.length<2){
						$("#alertmsg").html("请输入正确的开户行");
						$("#tanchuang").css("display","");
					}else{
						$.ajax({
					     	url:"team!tixian.action",
					     	type:"post",
							data:{"payRecord.yjpay":tixiannum,"payRecord.name":tixianname,"payRecord.kahao":tixiankahao,"payRecord.yinghang":tixianyinhang},
					    	success:function(data){
							    	if(data=="1"){
							    		alert("提交成功，稍后服务人员将进行转账处理");
										window.location="team!yongjin.action";
								    }else if(data=="2"){
										window.location="team!yongjin.action";
									}else{
										$("#alertmsg").html(data);
										$("#tanchuang").css("display","");
									}
								},
						});

					}
				}
	  		</SCRIPT>
    
    
    <!-- 上半部内容 -->
    	<div style="height: 170px;width:100%;background-color: #EF8200;position: absolute;">
    	  <div style=" height:85px;width:50%;color: white;float: left;">
    	     <div style="position:absolute; font-size: 12px;float: left;width:auto;top: 15px;margin-left: 10px; ">累计佣金  &nbsp;(元)</div>
    	     <div style="position:absolute;font-size: 21px;float: right;width:auto;top: 32px;margin-left: 10px; ">￥${team.allyongjin}</div>
    	  </div>
    	   
    	   <div style=" height:85px;width:50%;color: white;float: right;color:white;">
    	     <div style=" position:absolute;font-size: 12px;float: right;width:auto;top: 15px;margin-left: 10px; right: 10px;">可提佣金  &nbsp;(元)</div>
    	     <div style=" position:absolute;font-size: 21px;float: right;width:auto;top: 32px;margin-left: 10px;right: 10px;">￥${team.yongjin}</div>
    	   	
    	   	<input type="hidden" id="minmoney" value="${award.minmoney}">
    	   	<input type="hidden" id="keti" value="${team.yongjin}">
    	   
    	   </div>
    	  <div style="position:absolute;z-index:1;width:1px;background:#F1F1F1;height:30px;left:50%;top:14px;color:#F5A74D;" align="center"></div> 
    <!-- 上半部输入框 --> 
          
	           <div style="height: 85px;margin-top:85px; ">
	             <div style="height: 28px;width: 60%; margin-left: 34%;" >
	              	<input id="tixiannum"  style="padding-left:5px;  border: 0;border-radius:5px;height: 28px;width: 54%;  " placeholder="请输入金额"/>
	              	<div style=" font-size: 10px;width: 100px; color:#FCF1DB; margin-top: -23px;margin-left: 58%;  ">(不得低于￥${award.minmoney})</div>
	             </div>
	             
	              <div style="margin-top: 10px; text-align: center;width: 100%" >
	              <button onclick="qutixian();" style="height: 30px;border-radius:5px; width: 50px; border: 1px solid #FCF1DB;background-color: #FF9619;font-size: 12px;color:#FCF1DB;" >提现</button>
	              </div>
	           </div>     
          
    	  
    	</div>
    	
 		<!-- 下方主内容 -->
   		<div class="mid" style="height: auto;background-color: white;padding-top: 170px">
   		
	   			<div  style="width: 100%;height: 45px" >
				    <div  onclick="changge(1)" style="position:absolute; height: 45px;width: 50%;">
				        <img style="position:absolute;width: 18px;height: 18px;margin-left: 30%;margin-top: 14px" alt="..." src="/../images/收入.png">
				        <div  id="source"style="text-align:center;line-height:46px; height: 100%;width: 55px;margin-left: 42%;font-size:13px;" >收入明细</div>      
				    </div> 
				    <div   onclick="changge(2)" style="float:right; height: 45px;width: 50%;">
				        <img style="position:absolute;width: 18px;height: 18px;margin-left: 15%;margin-top: 14px" alt="..." src="/../images/提现记录.png">
				        <div id="detailed"style="text-align:center;line-height:46px; height: 100%;width: 55px;margin-left: 42%;font-size:13px;"  >提现记录</div>   
				    </div>
				    <div style="position:absolute;z-index:1;width:2px;background:#F1F1F1;height:35px;left:50%;top:175px" align="center"></div> 
				</div>
				
				<div style="clear:both; border: 3px solid #F1F1F1; "></div>
			<!-- 佣金来源内容 -->
		<div id="jifenly">
			<s:iterator value="teamAwards">
			    <div  style="width: 100%;height: 45px; " >
				    <div  style="margin-top:13px;position:absolute; margin-left:15px; font-size:16px;float: left; "> +<s:property value="yongjinaward"/></div>
				    <div style="margin-top:13px;margin-right:15px;font-size:13px;float: right; color: #B3B3B3;"> <s:property value="time"/> </div>
				</div>
				<div style="border: 1px solid #F1F1F1; "></div>
	   		</s:iterator>
		</div>
			<!-- 佣金使用内容 -->
		<div id="jifenxf">	
			<s:iterator  value="payRecords">
			    <div   style="width: 100%;height: 45px;" onclick="chakanxiangqing('${name}','${kahao}','${yinghang}');">
				   <div  style="margin-top:13px;position:absolute; margin-left:15px; font-size:16px;float: left; "> -<s:property value="yjpay"/>
				   <s:if test="status==0"><span style="color:#888888;font-size:8px;">（已提交）</span></s:if>
				   <s:elseif test="status==1"><span style="color:#888888;font-size:8px;">（已完成）</span></s:elseif>
				   <s:elseif test="status==2"><span style="color:#888888;font-size:8px;">（申请失败，金额已退回）</span></s:elseif>
				   </div>
				    <div style="margin-top:13px;margin-right:15px;font-size:13px;float: right; color: #B3B3B3;"> <s:property value="time"/> </div>
				</div>
				<div style="border: 1px solid #F1F1F1; "></div>
	   		</s:iterator>
	   	</div>
	  </div>
	  <div style=" width: auto;height: 80px;text-align: center;font-size: 12px;background-color: #F1F1F1;padding-top: 20px;color: #ACACAC;" >没有更多记录~</div>
	  
   		
   	</div>
   	<SCRIPT type="text/javascript">
   	$(function(){
   		changge(1);
   	})
	function changge(a){
		if(a==1){
		    var obj = document.getElementById("source");
	        var obj1 = document.getElementById("detailed");
	        obj.className = "bor_bottom";
	        obj1.className = "change_bottom";
	        $("#jifenly").show();
	        $("#jifenxf").hide();
		}else if (a==2) {
		    var obj = document.getElementById("source");
	        var obj1 = document.getElementById("detailed");
	        obj.className = "change_bottom";
	        obj1.className = "bor_bottom";
	        $("#jifenxf").show();
	        $("#jifenly").hide();
		}

	}
   	</script>
   	
	</body>
</html>
