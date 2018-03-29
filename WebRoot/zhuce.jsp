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
    
    <title>店主注册，共享共赢</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="牧人">
	<meta http-equiv="description" content="牧人">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
	<link href="<%=path%>/css/pintuer.css" rel="stylesheet">
	<link href="<%=path%>/style/index.css" rel="stylesheet">
	
	<STYLE type="text/css">
		.bg{
			background-color: white;
			color: black;
			height:40px;
			
		}	
		img{
			height:20px;margin-top: -3px;
		}
		
		.divjg{
			float:left;margin-top:12px;width:32%;
		}
		
		.divjg1{
			float:left;margin-top:12px;width:68%;
		}
	
		input{
			border: 0;
		}
		
	</STYLE>
	
	<script src="<%=path%>/js/jquery.js"></script>
	<script src="<%=path%>/js/pintuer.js"></script>
	<script src="<%=path%>/js/main.js"></script>
	<script src="<%=path%>/js/diqu2.js"></script>
	<script type="text/javascript">
	var countdown=60; 
	function settime(val) { 
			if (countdown == 0) { 
				val.removeAttribute("disabled"); 
				val.value="获取验证码"; 
				countdown = 60; 
				$("#fasong").val("");
			} else { 
				val.setAttribute("disabled", true); 
				val.value="重新发送(" + countdown + ")"; 
				countdown--; 
			setTimeout(function() { 
				settime(val) 
				},1000) 
			} 
		} 

	function fasong(val){
			var phone =$("#phone").val();
			
			if(phone==""){
				$("#alertmsg").html("请输入手机号码");
				$("#tanchuang").css("display","");
				return false;
			}
			if(!(/^1[3|4|5|7|8][0-9]\d{4,8}$/.test(phone))){
				$("#alertmsg").html("请输入正确的手机号码");
				$("#tanchuang").css("display","");
				  return false; 
			}
			$("#fasong").val("1");
			$("#phone").attr("readOnly",true);
			$.ajax({
				'url':'team!yanzhengma.action',
				'type':'post',
				'data':{'team.phone':phone},
				'dataType':'json',
				'success':function(data){
				//data是服务器返回的数据
					if(data=="1"){
						settime(val);
						$("#alertmsg").html("验证码发送成功，请注意查收");
						$("#tanchuang").css("display","");
					}else{
						$("#fasong").val("");
						$("#phone").attr("readOnly",false);
						alert(data);
					}
				},
				'error':function(){
						$("#alertmsg").html("请求失败！");
						$("#tanchuang").css("display","");
				}
			});
			
		}
	$(function(){
		new PCAS("province","city","area");
		})
		
	function jisuan(){
		var xztuijian = $("#xztuijian").val();
	
		var rname =$("#rname").val();
		var phone =$("#phone").val();
		var num =$("#num").val();
		var dealer =$("#dealer").val();
		
		var managercode = "";
		if(xztuijian==0){
			managercode =$("#managerId").val();
			if(managercode==""){
				$("#alertmsg").html("请输入推荐人编号或无");
				$("#tanchuang").css("display","");
				return false;
			}
		}else{
			managercode = $("#managerId2").val();
			if(managercode==""){
				$("#alertmsg").html("请输入推荐人姓名并选择手机号码");
				$("#tanchuang").css("display","");
				return false;
			}
		}
		
		var duixiang =$("#duixiang").val();
		var duixiangnum =$("#duixiangnum").val();
		var province =$("#province").val();
		var city =$("#city").val();
		var area =$("#area").val();
		var address =$("#address").val();
		var status =$("#status").val();

		if(dealer==""){
			$("#alertmsg").html("请输入区域经理编号或无");
			$("#tanchuang").css("display","");
			return false;
		}
		if(rname==""){
			$("#alertmsg").html("请输入姓名");
			$("#tanchuang").css("display","");
			return false;
		}
		if(phone==""){
			$("#alertmsg").html("请输入手机号码");
			$("#tanchuang").css("display","");
			return false;
		}
		if(num==""){
			$("#alertmsg").html("请输入验证码");
			$("#tanchuang").css("display","");
			return false;
		} 
		
		if(area==""){
			$("#alertmsg").html("请选择地址");
			$("#tanchuang").css("display","");
			return false;
		}
		if(address==""){
			$("#alertmsg").html("请输入具体地址");
			$("#tanchuang").css("display","");
			return false;
		}
		
		if(!(/^1[0-9][0-9]\d{4,8}$/.test(phone))){ 
			$("#alertmsg").html("请输入正确的手机号码");
			$("#tanchuang").css("display","");
			return false; 
		} 
		$.ajax({
			'url':'team!register.action',
			'type':'post',
			'data':{'team.rname':rname,'team.duixiang':duixiang,'team.duixiangnum':duixiangnum,'team.phone':phone,'team.status':status,'team.dealer':dealer,'team.managercode':managercode,'num':num,'team.province':province,'team.city':city,'team.area':area,'team.address':address},
			'dataType':'json',
			'success':function(data){
			//data是服务器返回的数据
				if(data=="0"){
					$("#alertmsg").html("注册完成");
					$("#tanchuang").css("display","");
					$('#href').attr('href','index!index.action');
				}else if(data=="1"){
					$("#alertmsg").html("验证码错误");
					$("#tanchuang").css("display","");
				}else if(data=="2"){
					$("#alertmsg").html("请输入正确的推荐人编号");
					$("#tanchuang").css("display","");
				}else if(data=="3"){
					$("#alertmsg").html("请输入正确的区域经理编号");
					$("#tanchuang").css("display","");
				}else if(data=="4"){
					$("#alertmsg").html("地址请求出错，请稍后再试或联系客服");
					$("#tanchuang").css("display","");
				}else if(data=="10"){
					window.location.href='pay2.jsp';
				}else{
					$("#alertmsg").html("注册失败，请稍后重试");
					$("#tanchuang").css("display","");
				}
			},
			'error':function(){
				$("#alertmsg").html("请求失败！");
				$("#tanchuang").css("display","");
			}
		});
	}
	
	function bianhao(){
		$(".bianhao").css("display","");
		$(".xingming").css("display","none");
		$("#xztuijian").val(0);
	}
	function xingming(){
		$(".bianhao").css("display","none");
		$(".xingming").css("display","");
		$("#xztuijian").val(1);
	}
	function sousuoname(){
	    var tuijianname = $("#tuijianname").val();
		if(tuijianname==""){
			$("#alertmsg").html('请输入推荐人姓名，如果没有推荐人请输入"无"');
			$("#tanchuang").css("display","");
			return false;
		}
	    if(tuijianname=="无"){
	    	$("#managerId").val("无");
	    	bianhao();
	    	return false;
		}
		if(tuijianname!="无"){
			$.ajax({
				'url':'team!sousuoname.action',
				'type':'post',
				'data':{'keyword':tuijianname},
				'dataType':'json',
				'success':function(data){
					//data是服务器返回的数据
					if(data.length>0){
						$('#managerId2').html("");
						for(var i=0;i<data.length;i++){
							var c = data[i];
							$('#managerId2').append('<option value="'+c.code1+'">'+c.rname+':'+c.phone+'</option>');
						}
					}else{
						$("#alertmsg").html('无该姓名的用户，请重新输入');
						$("#tanchuang").css("display","");
					}
				},
			});
		}
		
		
	}
	
	
	</script>
	
	
  </head>
  
  <body style="background-image: url(<%=path %>/images/注册bg-.png);background-repeat:no-repeat;background-size:100%; background-color:#124081;">
  	<div>
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
  		
  		<!-- 内容 -->
  		<div style="margin:50px 10% 0 10%;width:80%;font-size: 13px; ">
  			<div class="bg radius"   >
  				<div class="divjg" style="">
  					<span style="float:right;margin:0 10%">姓名</span> 
  					<img alt="" src="<%=path %>/images/user01.png" style="float:right; " /> 
  				</div>
  				
  				<div class="divjg1" style="">
  					<input type="text" id="rname" placeholder="请输入您的姓名"  />
  				</div>
  			</div>
  			
  			<div style="height:8px;"></div>
  			
  			<div class="bg radius"   >
  				<div class="divjg" style="">
  					<span style="float:right;margin:0 10%">电话</span> 
  					<img alt="" src="<%=path %>/images/mobile01.png" style="float:right; margin-right: 2px;" /> 
  				</div>
  				
  				<div class="divjg1" >
  					<div style="float:left;width:58%;" >
  						<input type="text" id="phone" placeholder="请输入电话号码" style="width:90%;"/>
  					</div>
  					<div style="float:left;width:42%;">
  						<input type="text"   onclick="fasong(this);"  value="获取验证码" readonly="readonly" style="text-align: center;width:70px;color:#efefef;background-color: #aaaaaa;font-size:10px; padding: 5px 0;margin-top: -2px;" />
  					</div>
  				</div>
  			</div>
  			
  			<div style="height:8px;"></div>
  			
  			<div class="bg radius"   >
  				<div class="divjg" style="">
  					<span style="float:right;margin:0 10%">验证码</span> 
  				</div>
  				
  				<div class="divjg1" style="">
  					<input type="text" id="num" placeholder="请输入收到的验证码"  />
  				</div>
  			</div>
  			<div style="height:8px;"></div>
  			
  			<div class="bg radius" style="text-align: center;">
  			<input type="hidden" value="0" id="xztuijian" >
  				<div class="divjg" onclick="bianhao();" style="width: 42%;margin-left: 8%;">
  					<span><img  class="bianhao" src="<%=path %>/images/gou01.png" style="width: 17px;height: 17px;" />
  						  <img  class="xingming" src="<%=path %>/images/gou02.png" style="width: 17px;height: 17px;display: none;" />
  						   &nbsp;推荐人编号</span>
  				</div>
  				
  				<div class="divjg1" onclick="xingming();" style="width: 42%;margin-right: 8%;">
  					<span><img  class="xingming" src="<%=path %>/images/gou01.png" style="width: 17px;height: 17px;display: none;" />
  						  <img  class="bianhao" src="<%=path %>/images/gou02.png" style="width: 17px;height: 17px;" />
  					      &nbsp;推荐人姓名</span>
  				</div>
  			</div>
  			
  			<div style="height:8px;"></div>
  			<div class="bg radius bianhao"  >
  				<div class="divjg" style="">
  					<span style="float:right;margin:0 10%">推荐人编号</span> 
  				</div>
  				
  				<div class="divjg1" style="">
  					<div style="float:left;width:50%">
  						<input type="text" id="managerId" placeholder="请输入编号"  style="width:110px;"/>
  					</div>
  					<div style="font-size:8px; float:left;width:50%;margin-top:2px;text-align: center;">
  						<span>(若没有请填无)</span>
  					</div>
  				</div>
  			</div>
  			<div class="bg radius xingming" style="display: none;" >
  				<div class="divjg" style="">
  					<span style="float:right;margin:0 10%">推荐人姓名</span> 
  				</div>
  				
  				<div class="divjg1" style="">
  				<div style="float:left;width:50%">
  					<input onblur="sousuoname();" type="text" id="tuijianname"  style="width:110px;" placeholder="请输入推荐人姓名"  />
  				</div>
  				<div style="font-size:8px; float:left;width:50%;margin-top:2px;text-align: center;">
  						<span>(若没有请填无)</span>
  				</div>
  				</div>
  			</div>
  			<div style="height:8px;"></div>
  			
  			<div class="bg radius xingming" style="display: none" >
  				<div class="divjg" style="">
  					<span style="float:right;margin:0 10%">推荐人电话</span> 
  				</div>
  				<div class="divjg1">
					<div style="width:100%; float: left;">
						<select id="managerId2"  style="border: 0;width:92%;color:#9D9D9D;padding:3px 0;margin-top:-3px;"  >
							<option value="">请选择推荐人的电话</option>
						</select>
					</div>
  				</div>
  			</div>
  			<div style="height:8px;display: none;" class="xingming"></div>
  			
  			<div class="bg radius"  >
  				<div class="divjg" style="">
  					<span style="float:right;margin:0 10%">区域经理编号</span> 
  				</div>
  				
  				<div class="divjg1" style="">
  					<div style="float:left;width:50%">
  						<input type="text" id="dealer" placeholder="请输入区域经理编号"  style="width:110px; ;"/>
  					</div>
  					<div style="font-size:8px; float:left;width:50%;margin-top:2px;text-align: center;">
  						<span>(若没有请填无)</span>
  					</div>
  				</div>
  			</div>
  			<div style="height:8px;"></div>
  			<div class="bg radius"   >
  				<div class="divjg" style="">
  					<span style="float:right;margin:0 10%">养殖规模</span> 
  				</div>
  				<div class="divjg1" style="font-size:10px;">
					<div style="width:50%; float: left;">
						<select id="duixiang"  style="width:92%;background-color:#F0F0F0;color:#9D9D9D;padding:3px 0;margin-top:-3px"  class="" >
							<option value="牛">牛</option>
							<option value="羊">羊</option>
							<option value="猪">猪</option>
							<option value="家禽">家禽</option>
							<option value="宠物">宠物</option>
							<option value="水产">水产</option>
							<option value="其它">其它</option>
						</select>
					</div>
					<div  style="width:50%; float: left;">
						<select id="duixiangnum"  style="width:92%;background-color:#F0F0F0;color:#9D9D9D;padding:3px 0;margin-top:-3px" >
							<option value="50头以下">50头以下</option>
							<option value="50－200头">50－200头</option>
							<option value="200－500头">200－500头</option>
							<option value="500头以上">500头以上</option>
						</select>
					</div>
  				</div>
  			</div>
  			
  			<div style="height:8px;"></div>
  			<div class="bg radius"   >
  				<div class="divjg" style="">
  					<span style="float:right;margin:0 10%">地址</span> 
  					<img alt="" src="<%=path %>/images/point01.png" style="float:right; " /> 
  				</div>
  				<div class="divjg1" style="font-size:10px;">
					<div style="width:33%; float: left;">
						<select id="province" name="team.province" style="width:92%;background-color:#F0F0F0;color:#9D9D9D;padding:3px 0;margin-top:-3px"  class="" >
						</select>
					</div>
					<div  style="width:33%; float: left;">
						<select id="city" name="team.city" style="width:92%;background-color:#F0F0F0;color:#9D9D9D;padding:3px 0;margin-top:-3px" >
						</select>
					</div>
					<div  style="width:33%; float: left;">
						<select id="area" name="team.area" style="width:92%;background-color:#F0F0F0;color:#9D9D9D;padding:3px 0;margin-top:-3px" >
						</select>
					</div>
  				</div>
  			</div>
  			
  			<div style="height:8px;"></div>
  			
  			<div class="bg radius"   >
  				<div class="divjg" style="">
  					<span style="float:right;margin:0 10%">详细地址</span> 
  				</div>
  				
  				<div class="divjg1" style="">
  					<input type="text" id="address" name="team.address" placeholder="请输入您的详细地址"  />
  				</div>
  			</div>
  			
  			<input type="hidden" id="status" value="0" />
  			<!-- <input type="hidden" name="team.openId" value="${team.openId}" /> -->
  		</div>
  		
  		<!--  -->
  		<div  style="width:80%;margin:50px 10% 0;">
			<div onclick="jisuan();" class="bg radius"  style="width: 100%;text-align: center;height: 35px;background-color: #27CCf9;color: white;padding-top: 6px;font-size: 15px;">注册</div>
  		</div>
  	
  </div>
  
	</body>
</html>
