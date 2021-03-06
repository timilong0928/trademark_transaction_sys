<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page import="pojo.Admin" %>
<% 
Admin admin=(Admin)session.getAttribute
("admin");
if(admin==null){
response.sendRedirect(request.getContextPath()+"/admin/login.jsp");
}
%>

<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="renderer" content="webkit">
    <title>后台管理</title>
    <link rel="stylesheet" href="<%=path%>/admin/css/pintuer.css">
    <link rel="stylesheet" href="<%=path%>/admin/css/admin.css">
    <script src="<%=path%>/admin/js/jquery.js"></script>
    <script src="<%=path%>/admin/js/pintuer.js"></script>
    <script src="<%=path%>/admin/js/admin.js"></script>
    <script src="<%=path%>/js/diqu.js"></script>
   
<link rel="stylesheet" href="<%=request.getContextPath() %>/admin/kindeditor/themes/default/default.css" />
	<link rel="stylesheet" href="<%=request.getContextPath() %>/admin/kindeditor/plugins/code/prettify.css" />
	<script charset="utf-8" src="<%=request.getContextPath() %>/admin/kindeditor/kindeditor.js"></script>
	<script charset="utf-8" src="<%=request.getContextPath() %>/admin/kindeditor/lang/zh_CN.js"></script>
  	<script type="text/javascript">
  	    var editor;
		KindEditor.ready(function(K) {
			editor = K.create('textarea[name="admin.qianming"]', {
			    cssPath : '<%=request.getContextPath() %>/admin/kindeditor/plugins/code/prettify.css',//指定编辑器iframe document的CSS，用于设置可视化区域的样式。
				uploadJson : '<%=request.getContextPath() %>/admin/kindeditor/jsp/upload_json.jsp',
				fileManagerJson : '<%=request.getContextPath() %>/admin/kindeditor/jsp/file_manager_json.jsp',
				allowImageRemote : false,//为true则上传图片时显示“网络图片”功能，为false则上传图片时不显示“网络图片”功能。
				//items : ['source', '|','undo', 'redo','cut', 'copy', 'paste', 'plainpaste', 'wordpaste', 'about'],//根据自己的需求设定工具栏
				resizeType : 0,//2或1或0，2时可以拖动改变文本编辑域的宽度和高度，1时只能改变高度，0时不能拖动。
				allowFileManager : true,
				afterCreate : function() {
					var self = this;
					K.ctrl(document, 13, function() {//应对鼠标焦点在文本编辑域外时的快捷键（Ctrl + Enter）提交。
						self.sync();//同步KindEditor的值到textarea文本框
						document.forms['example'].submit();
					});
					K.ctrl(self.edit.doc, 13, function() {//应对鼠标焦点在文本编辑域内部时的快捷键（Ctrl + Enter）提交。
						self.sync();//同步KindEditor的值到textarea文本框
						document.forms['example'].submit();
					});
				}
			});
		});
		

	</script>
	<style>
	/**文件输入框*/
		.myinput-file input[type="file"]{
			opacity:0;filter:alpha(opacity=0);
			width: 100%;height: 100%;
			z-index: 2;
			position: absolute;top:0;left:0;
		}
		.myinput-file{
			position: relative;
		}
		.myimg{
			display:inline-block;
			background:url(../img/uploadmiao.png) no-repeat left 0 top 0/75px 75px;
			width: 75px;height: 75px;
			margin: 10px auto;
		}
		.myimg img{
			width: 100%;height:100%;
			position: absolute;
			top:0;left:0;
		}
		/**文件输入框*/
	</style>
</head>

<body>

<%@ include file="/admin/topmenu.jsp" %>
<script type="text/javascript">showwhere("shezhitop",2,"管理员修改")</script>
<div class="admin">

    <div class="panel">
  <div class="panel-head"><strong>添加管理员</strong></div>
  <div class="panel-body">
  
<form onsubmit="return checksubmit();" action="<%=request.getContextPath()%>/admin/admin!update2.action" id="form" method="post" enctype="multipart/form-data" >
                 <input name="admin.id" type="hidden" value="${admin.id}"/>
                 <div class="form-group">
                    <div class="label"><label for="sitename">用户名</label><span id="say"></span></div>
                    <div class="field">
                    	<input disabled="disabled" onblur="checkname()"  type="text" class="input" id="name" name="admin.name"  value="${admin.name}"  />
                    </div>
                 </div>
                 
                 <div class="form-group">
                    <div class="label"><label for="sitename">手机号码</label></div>
                    <div class="field">
                    	<input  type="text" class="input" id="sitename" name="admin.phone"  value="${admin.phone}"  />
                    </div>
                 </div>
                 
                 <div class="form-group">
                    <div class="label"><label for="sitename">姓名</label></div>
                    <div class="field">
                    	<input  class="input" name="admin.rname"  value="${admin.rname}" />
                    </div>
                 </div>
                
                 <div class="form-group">
                    <div class="label"><label for="bianma">密码</label></div>
                    <div class="field">
                    	<input class="input"   name="admin.password" size="50" value="${admin.password}" />
                    </div>
                 </div>
                 
                 <div class="form-group"  style="margin-top:35px;">
                    <div class="label"><label for="logo">头像图片</label></div>
                    <div id="picture" class="field">
                       <div id="scan4" class="fieldpic">
                    	<a class="button input-file" href="javascript:void(0);">+ 浏览文件<input  onchange="preview(0,this,0)" size="100" style="" type="file" name="file" /></a>
                       </div>
                    </div>
                    <div id="previewdiv">                       
                          <div style="float:left;" id="preview" class="previewpreview">
                            <img id="img" style="margin-left:5px;" src="<%=path%>/${admin.img}" alt="" width="80" height="80"><br/>&nbsp;&nbsp;&nbsp;
                            <button  style="border-radius:5px;color:#2c7;border:1px solid #2c7 ;background:#fff;margin-top:3px;" onclick="preview(1)" type="button">删除</button>
                          </div>              
                    </div>
                </div>
                
                <div style="height:10px;clear:both;"></div>
                 <div class="form-group">
                    <div class="label"><label for="sitename">个性签名</label></div>
                    <div class="field">
                    	<textarea rows="20" class="input" name="admin.qianming" >${admin.qianming}</textarea>
                    </div>
                 </div>
                <input type="hidden" name="admin.quanxian" value="teacher" />
                 <button type="submit" class="button bg-blue" >修改</button>
        </form>
  </div>
</div>
                
                
</div>
		<script type="text/javascript">
		
			
       //上传图片
		 var i=1;
		function preview(data,file,type) {
		if(type==0){
		  var a = document.getElementsByClassName("previewpreview").length;
		  i++;
		  if(a<1){
		 // alert("aaa");
		    var c=document.getElementsByClassName("fieldpic");
			for(var j=0;j<c.length;j++){
			   c[j].style.display="none";
			}
			if (file.files && file.files[0]){
			
			//alert(file.files.length);
				var reader = new FileReader();
				reader.onload = function(evt){
				//alert(i);
					$("#previewdiv").append('<div id="previewdiv'+i+'" style="float:left;" class="previewpreview"><img style="margin-left:5px;" src="' + evt.target.result + '" width="80" height="80"/><br/>'
					                     +'&nbsp;&nbsp;&nbsp;<button  style="border-radius:5px;color:#2c7;border:1px solid #2c7 ;background:#fff;margin-top:3px;" onclick="preview('+i+')" type="button">删除</button></div>');
				}
				reader.readAsDataURL(file.files[0]);
				//alert(i);
				
				$("#picture").append(' <div id="scan'+i+'" class="fieldpic"><a class="button input-file" href="javascript:void(0);">+ 浏览文件<input onchange="preview('+i+',this,0)" size="100" type="file" name="file" data-validate="required:请选择上传文件,regexp#.+.(jpg|jpeg|png|gif)$:只能上传jpg|gif|png格式文件" /></a></div>');
			    
			}else{alert("文件异常！");} 
		  }else{
			alert("图片不能超过1张！");
		  }
		}else{
		    //alert("删除");
		    
            //标记原来已删除，传至后台
            if(data<=1){
            $("#previewdiv").append('<input type="hidden" value="'+data+'"  name="delpicture"/>');
            //删除预览
            $("#preview").remove();
            
            }else{
	        //删除新上传的
	        //删除预览
	        $('#previewdiv'+data).remove();
	        $("#scan"+(data-1)).remove();
	        }        
		 }			
	  }
		</script> 

</body>
</html>