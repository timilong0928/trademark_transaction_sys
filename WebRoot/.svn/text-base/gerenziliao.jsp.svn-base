<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
  <head>

	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
	<title>个人资料</title>
	<link rel="stylesheet" href="<%=path%>/css/pintuer.css">
	<link rel="stylesheet" href="<%=path%>/css/product.css">
	<link rel="stylesheet" href="<%=path%>/css/office.css">
		<link rel="stylesheet" href="style/index.css" />
	<link rel="stylesheet" href="style/common.css" />
	<link rel="stylesheet" href="style/swiper.min.css" />
	<link rel="stylesheet" href="style/sp.css" />
	<script src="<%=path%>/js/jquery.js"></script>
	<script src="<%=path%>/js/pintuer.js"></script>
  </head>
  <body style="background-color: #efefef;">
 	   	 	 <!--页头-->

   	<form action="team!updateZiLiao.action" method="post" enctype="multipart/form-data">
   		<div style="background-color: white;margin-top: 5px;">
			<div class="ziliao">
			    <div class="zi   form-group" >	
			        <div class="z1"></div>
			        <div class="z2" style="font-size:14px;padding-left: 10px;">&nbsp&nbsp姓&nbsp&nbsp&nbsp&nbsp名: </div> 
			        <div class="z3" style="float:left;font-size:14px;color:#8E8E8E;margin-top: 0;">${team.rname}</div>
			    </div> 
			</div>
			<div class="e_line" style="width:93%"></div>
   			<div class="ziliao">
			    <div class="zi   form-group" >	
			        <div class="z1"></div> 
			        <div class="z2" style="font-size:14px;padding-left:10px;">&nbsp&nbsp电&nbsp&nbsp&nbsp&nbsp话: </div> 
			        <div class="z3" style="float:left;font-size:14px;color:#8E8E8E;margin-top: 0;">${team.phone}</div>
			    </div> 
			</div>
			<div class="e_line" style="width:93%"></div>
   			<div class="ziliao">
			    <div class="zi" >	
			        <div class="z1"></div> 
			        <div class="z2" style="font-size:14px;padding-left:20px;">省&nbsp&nbsp&nbsp&nbsp份:</div> 
			        <div class="z3" style="float:left;font-size:14px;color:#8E8E8E;margin-top: 0;">${team.province}</div> 
			    </div> 
			</div>
			<div class="e_line" style="width:93%"></div>
   			<div class="ziliao">
			    <div class="zi" >	
			        <div class="z1"></div> 
			        <div class="z2" style="font-size:14px;padding-left:20px;">城&nbsp&nbsp&nbsp&nbsp市:</div> 
			        <div class="z3" style="float:left;font-size:14px;color:#8E8E8E;margin-top: 0;">${team.city}</div> 
			    </div> 
			</div>
			<div class="e_line" style="width:93%"></div>
   			<div class="ziliao">
			    <div class="zi" >	
			        <div class="z1"></div> 
			        <div class="z2" style="font-size:14px;padding-left:20px;">县&nbsp&nbsp/&nbsp区: </div> 
			        <div class="z3" style="float:left;font-size:14px;color;color:#8E8E8E;margin-top: 0;">${team.area}</div> 
			    </div> 
			</div>
			<div class="e_line" style="width:93%"></div>
   			<div class="ziliao">
			    <div class="zi form-group" >	
			        <div class="z1"></div> 
			        <div class="z2" style="font-size:14px;padding-left:20px;">地&nbsp&nbsp&nbsp&nbsp址: </div> 
			        <div class="z3" id="7"  style="float:left"><input type="text" id="btn" name="team.address" value="${team.address}" disabled="disabled" class="input" size="25" placeholder=""  data-validate="required:请输入详细地址"  style="border: 0;"/></div> 
			        <div class="z3 field" id="8" style="float:left;display:none;font-size:14px;color:red"><input type="text" id="btn" name="team.address" value="${team.address}" class="input" size="25" placeholder="请输入详细地址" data-validate="required:请输入详细地址" /></div> 
			    </div> 
			</div>
			<s:if test="(team.status==0||team.status==1)&&!status>0">
				<s:if test="team.dealerid!=0">
					<div class="e_line" style="width:93%"></div>
		   			<div class="ziliao">
					    <div class="zi" >	
					        <div class="z1"></div> 
					        <div class="z2" style="font-size:14px;padding-left:20px;">区域经理姓名: </div> 
					        <div class="z3" style="float:left;font-size:14px;color;color:#8E8E8E;margin-top: 0;">${team.dealername}</div> 
					    </div> 
					</div>
					
					<div class="e_line" style="width:93%"></div>
		   			<div class="ziliao">
					    <div class="zi" >	
					        <div class="z1"></div> 
					        <div class="z2" style="font-size:14px;padding-left:20px;">区域经理编码: </div> 
					        <div class="z3" style="float:left;font-size:14px;color;color:#8E8E8E;margin-top: 0;">${team.dealer}</div> 
					    </div>  
					</div>
				</s:if>
				<s:if test="team.managerId!=0">
					<div class="e_line" style="width:93%"></div>
		   			<div class="ziliao">
					    <div class="zi" >	
						        <div class="z1"></div> 
						        <div class="z2" style="font-size:14px;padding-left:20px;">推荐人姓名: </div> 
						        <div class="z3" style="float:left;font-size:14px;color;color:#8E8E8E;margin-top: 0;">${team.managername}</div> 
						</div> 
					</div>
					
					<div class="e_line" style="width:93%"></div>
		   			<div class="ziliao">
					    <div class="zi" >	
						        <div class="z1"></div> 
						        <div class="z2" style="font-size:14px;padding-left:20px;">推荐人编码: </div> 
						        <div class="z3" style="float:left;font-size:14px;color;color:#8E8E8E;margin-top: 0;">${team.managercode}</div> 
						</div> 
					</div>
				</s:if>
			</s:if>
			<div class="e_line"></div>
			<input value="${status}" id="status" name="status" type="hidden" />
			</div>
			<div id ="2" style="text-align:center;padding-top:10px;display:none;margin-top: 30px;"><button class="button bg-blue radius-rounded" style="width:90%" >保存</button></div>
		</form>
		<div id ="1" style="text-align:center;padding-top:10px;margin-top: 30px;"><button class="button bg-blue radius-rounded" style="width:90%" id="btn" onclick="showinput()">修改</button></div>
		
 </body>
 <script type="text/javascript">
	$(function(){
		var a = $("#status").val();
		if(a==1||a==2){
			showinput();
		}
	});

	function showinput(){
  			document.getElementById("1").style.display="none";//隐藏
			document.getElementById("2").style.display='block';//出现 
  			document.getElementById("7").style.display="none";//隐藏
			document.getElementById("8").style.display='block';//出现 
		}
 </script>
</html>
