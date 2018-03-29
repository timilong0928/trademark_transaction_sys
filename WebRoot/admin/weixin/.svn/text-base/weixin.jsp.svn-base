<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="/struts-tags" prefix="s"%>

<%@ page import="pojo.Admin"%>
<% 
String path=request.getContextPath();
Admin admin=(Admin)session.getAttribute("admin");
if(admin==null){
response.sendRedirect(request.getContextPath()+"/admin/login.jsp");
}
%>
<!DOCTYPE html>
<html lang="zh-cn">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport"
			content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
		<meta name="renderer" content="webkit">
		<title>后台管理</title>
		<link rel="stylesheet" href="<%=path %>/admin/css/pintuer.css">
		<link rel="stylesheet" href="<%=path %>/admin/css/admin.css">
		<script src="<%=path %>/admin/js/jquery.js"></script>
		<script src="<%=path %>/admin/js/pintuer.js"></script>
		<script src="<%=path %>/admin/js/admin.js"></script>
		
	</head>

	<body>
		<%@ include file="/admin/topmenu.jsp" %>
<SCRIPT type="text/javascript">showwhere("shezhitop",4)</SCRIPT>
		<div class="admin">

			<div class="panel">
				<div class="panel-head">
					自定义菜单制作
				</div>

				<div class="padding border-bottom">

					<button class="button button-small border-red"
						onclick="return addsuper(2)">
						添加二级父菜单
					</button>
					<button class="button button-small border-red"
						onclick="return addsuper(1)">
						添加一级菜单
					</button>
				</div>

				<div class="panel-body">
					<table class="table ">
						<tr>
							<th style="width: 15%">
								&nbsp;&nbsp;&nbsp;&nbsp;名称
							</th>
							<th style="width: 15%">
								<br>
							</th>
							<th style="width: 20%">
								&nbsp;&nbsp;&nbsp;&nbsp;类型
							</th>
							<th style="width: 30%">
								&nbsp;&nbsp;&nbsp;&nbsp;内容
							</th>
							<th style="width: 20%">
								&nbsp;&nbsp;&nbsp;&nbsp;操作
							</th>
						</tr>
					</table>
					<form action="menu!add.action" method="post">
						<div class="caidan">
							<s:iterator value="ones" var="o" status="st">
								<s:if test="#o.classify==1">
									<table id="<s:property value='#st.index+1'/>">
										<tr class="zi">
											<td style="width:15%"><input id="classify<s:property value='#st.index+1'/>" type="hidden" name="mainBtn<s:property value='#st.index+1'/>.classify" value="1"/>
												<input value="<s:property value='#o.name'/>" type="text"  name="mainBtn<s:property value='#st.index+1'/>.name" class="input"   placeholder="请输入一级菜单名称" /></td><td style="width:10%"></td>
											<td style="width:20%"><select onchange="change(this.options[this.options.selectedIndex].value,<s:property value='#st.index+1'/>,<s:property value='#st.index'/>)"name="mainBtn<s:property value='#st.index+1'/>.type" class="input"  >
												<option <s:if test="#o.type=='view'">selected="selected"</s:if> value="view">view</option>
												<option <s:if test="#o.type=='click'">selected="selected"</s:if> value="click">click</option></select></td><td style="width:5%"></td>
											<td style="width:20%">
												<input <s:if test="#o.url==null || #o.url==''">value="<s:property value='#o.key'/>"</s:if><s:else>value="<s:property value='#o.url'/>"</s:else> type="text" name="mainBtn<s:property value='#st.index+1'/>.url" id="<s:property value='#st.index+1'/><s:property value='#st.index'/>" class="input"  placeholder="请输入url链接或者key值" /></td>
											<td style="width:10%"></td><td style="width:"><button class="button button-small border-main" onclick="deletesuper(<s:property value='#st.index+1'/>)">删除</button>&nbsp;</td>
										</tr><br/>
									</table>
								</s:if>
								<s:else>
									<table id="<s:property value='#st.index+1'/>">
										<tr class="zi">
											<td style="width:15%"><input type="hidden" name="mainBtn<s:property value='#st.index+1'/>.classify" value="2"/>
												<input value="<s:property value='#o.name'/>" type="text"  name="mainBtn<s:property value='#st.index+1'/>.name" class="input"   placeholder="请输入二级父菜单名称" /></td><td style="width:15%"></td><td style="width:20%"></td><td style="width:30%"></td>
											<td style="width:20%"><button class="button button-small border-main" onclick="deletesuper(<s:property value='#st.index+1'/>)">删除</button>&nbsp;
												<button class="button button-small border-green" type="button" onclick="addchild(<s:property value='#st.index+1'/>)">添加子菜单</button>
											</td>
										</tr></br>
										<s:iterator value="sub_button" var="two" status="stt">
										<tr class="zizi<s:property value='#st.index+1'/>" id="<s:property value='#st.index+1'/><s:property value='#stt.index+1'/>">
											<td style="width:15%" align="right">∟ </td>
											<td style="width:15%"><input value="<s:property value='#two.name'/>" type="text"  name="btn<s:property value='#st.index+1'/>[<s:property value='#stt.index'/>].name" class="input"  placeholder="请输入子菜单名称" /></td>
											<td style="width:20%"><select onchange="change(this.options[this.options.selectedIndex].value,<s:property value='#st.index+1'/>,<s:property value='#stt.index'/>)"name="btn<s:property value='#st.index+1'/>[<s:property value='#stt.index'/>].type" class="input"  >
												<option <s:if test="#two.type=='view'">selected="selected"</s:if> value="view">view</option>
												<option <s:if test="#two.type=='click'">selected="selected"</s:if> value="click">click</option></select></td>
											<td style="width:30%"><input value="<s:if test="#two.url==null || #two.url==''"><s:property value='#two.key'/></s:if><s:else><s:property value='#two.url'/></s:else>" type="text" name="btn<s:property value='#st.index+1'/>[<s:property value='#stt.index'/>].url" id="<s:property value='#st.index+1'/><s:property value='#stt.index'/>" class="input"  placeholder="请输入url链接或者key值" /></td>
											<td style="width:20%"><button class="button button-small border-main" onclick="return deletechild(<s:property value='#st.index+1'/><s:property value='#stt.index+1'/>)">删除</button></td>
										</tr>
										</s:iterator>
									</table>
								</s:else>
							</s:iterator>
							
							
							
							
							
							
							
						</div>
						<br/>
						<button class="button bg-mix" onclick="return checkForm()">
							提交
						</button>
					</form>
				</div>
			</div>
		</div>

		<script type="text/javascript">
//添加父菜单
function addsuper(type){
	var num=0;
    var zi=document.getElementsByClassName("zi");
   	for(var i=0;i<zi.length;i++){
   	     num=num+1; 
   	}
	var id=num+1;
	if(num<3){
		if(type==2){
			$('.caidan').append(
				'<table id="'
				+id
				+'"><tr class="zi"><td style="width:15%">'
				+'<input type="hidden" name="mainBtn'
				+id
				+'.classify" value="2"/>'
				+'<input type="text"  name="mainBtn'
				+id
				+'.name" class="input"   placeholder="请输入二级父菜单名称" /></td><td style="width:15%"></td><td style="width:20%"></td><td style="width:30%"></td><td style="width:20%"><button class="button button-small border-main" onclick="deletesuper('
				+id
				+')">删除</button>&nbsp;<button class="button button-small border-green" type="button" onclick="addchild('
				+id
				+')">添加子菜单</button></td></tr></br></table>'
				);
	   }else{
	   		$('.caidan').append(
				'<table id="'
				+id
				+'"><tr class="zi"><td style="width:15%">'
				+'<input id="classify'
				+id
				+'" type="hidden" name="mainBtn'
				+id
				+'.classify" value="1"/>'
				+'<input type="text"  name="mainBtn'
				+id
				+'.name" class="input"   placeholder="请输入一级菜单名称" /></td><td style="width:10%"></td><td style="width:20%"><select onchange="change(this.options[this.options.selectedIndex].value,'
				+id
				+','
				+num
				+')"name="mainBtn'
				+id
				+'.type" class="input"  ><option value="view">view</option><option value="click">click</option></select></td><td style="width:5%"></td><td style="width:20%"><input type="text" name="mainBtn'
				+id
				+'.url" id='
				+id
				+'+'
				+num
				+'class="input"  placeholder="请输入url链接或者key值" /></td><td style="width:10%"></td><td style="width:"><button class="button button-small border-main" onclick="deletesuper('
				+id
				+')">删除</button>&nbsp;'
				+'</td></tr></br></table>'
				);
				
	   }
   }else{
	   alert("对不起，父菜单最多只能3个！");
   }
}


function addchild(id){


    var num=0;
    
   var child= document.getElementsByClassName("zizi"+id);

   	for(var i=0;i<child.length;i++){
   	
   	     num=num+1;
   	    
   	}
   	
  id1=num+1;
   	
   	if(num<5){
   
		$('#'+id).append(
							
			'<tr class="zizi'
			+id 
			+'" id="'
			+id
			+id1
			+'"><td style="width:15%" align="right">∟ </td><td style="width:15%"><input type="text"  name="btn'
			+id
			+'['
			+num
			+'].name" class="input"  placeholder="请输入子菜单名称" /></td><td style="width:20%"><select onchange="change(this.options[this.options.selectedIndex].value,'
			+id
			+','
			+num
			+')"name="btn'
			+id
			+'['
			+num
			+'].type" class="input"  ><option value="view">view</option><option value="click">click</option></select></td><td style="width:30%"><input type="text" name="btn'
			+id
			+'['
			+num
			+'].url" id='
			+id
			+'+'
			+num
			+'class="input"  placeholder="请输入url链接或者key值" /></td><td style="width:20%"><button class="button button-small border-main" onclick="return deletechild('
			+id
			+id1
			+')">删除</button></td></tr>'
							
				);
		    }else{
		    
		    alert("对不起，子菜单最多只能5个！");
		    
		    }
		    
}

function deletechild(id1){

document.getElementById(id1).remove();

}

function deletesuper(id){
	document.getElementById(id).remove();
}



function checkForm(){
var input=document.getElementsByClassName("input");

for(var i=0;i<input.length;i++){
   
   var value=(input[i]).value;
  
   if(value==""){
      alert("菜单的相关内容不能为空！");
      return false;
   }
}

   var num=0;
   var zi=document.getElementsByClassName("zi");
   
   	for(var i=0;i<zi.length;i++){
   	     num=num+1; 
   	}
   	if(num==0){ 	
   	return false;
   	}
   	
   	
   	var a=document.getElementById("1");
   	if(a!=null&&a!=""){
   	   	var aa=document.getElementById("11");
   	   	var classify = $('#classify'+1).val();
   	   	if((aa==null||aa=="")&& classify==2){
   	   	alert("请添加相关子菜单！");
   	   	return false;
   	   	}
   	   	 
   	}
   	
   	var b=document.getElementById("2");
   	if(b!=null&&b!=""){
   	var bb=document.getElementById("21");
   	var classify = $('#classify'+2).val();
   	   	if((bb==null||bb=="") && classify==2){	
   	   	alert("请添加相关子菜单！");
   	   	return false;
   	   	}
   	}
   	
   	var c=document.getElementById("3");
   		if(c!=null&&c!=""){
   		var cc=document.getElementById("31");
   		var classify = $('#classify'+3).val();
   	   	if((cc==null||cc=="")&& classify==2){
   	   	alert("请添加相关子菜单！");
   	   	return false;
   	   	}
   	}
  
   	
return true;
}

function change(value,id,num){

if(value=="view"){
    var va="url";
    document.getElementById(id+num).name="btn"+id+"["+num+"]"+"."+va;
}

if(value=="click"){
var va="key";
document.getElementById(id+num).name="btn"+id+"["+num+"]"+"."+va;

}



//var c= document.getElementById(id+num).name;
//alert("btn"+id+"["+num+"]"+"."+value);

}


</script>
	</body>
</html>