<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<% String path=request.getContextPath(); %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="renderer" content="webkit">
    <title>管理员登录</title>
    <link rel="stylesheet" href="<%=path%>/admin/css/pintuer.css">
    <link rel="stylesheet" href="<%=path%>/admin/css/admin.css">
    <script src="<%=path%>/admin/js/jquery.js"></script>
    <script src="<%=path%>/admin/js/pintuer.js"></script>
    <script src="<%=path%>/admin/js/respond.js"></script>
    <script src="<%=path%>/admin/js/admin.js"></script>
   

</head>

<body>

<s:if test="msg=='fail'">

  <script >alert("账号或密码错误")</script>
   </s:if> 
   
  

<div class="container">
    <div class="line">
        <div class="xs6 xm4 xs3-move xm4-move">
            <br /><br />
            <div class="media media-y">
				<img src="<%=path%>/admin/images/18shangbiao.png" height="80"  class="radius" alt="后台管理系统" />
            </div>
            <br /><br />
            <form action="admin!loginGuaPi.action" method="post">
            <div class="panel">
                <div class="panel-head"><strong>登录后台管理系统</strong></div>
                <div class="panel-body" style="padding:30px;">
                    <div class="form-group">
                        <div class="field field-icon-right">
                            <input type="text" class="input" name="admin.name" placeholder="登录账号"  />
                            <span class="icon icon-user"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="field field-icon-right">
                            <input type="password" class="input" name="admin.password" placeholder="登录密码" />
                            <span class="icon icon-key"></span>
                        </div>
                    </div>
                    <!-- 
                    <div class="form-group">
                        <div class="field field-icon-right">
                        	<input id="imagecode" type="text" class="input" placeholder="验证码"  />
                            <img id="image" alt="" src="image!createimg.action" style="height: 30px;border: 1px solid red;">
                            <span class="icon icon-key"></span>
                            <span onclick="changeimg()" style="cursor:pointer">换一张</span>
                        </div>
                    </div>
                    -->
                  
                </div>
                <div class="panel-foot text-center"><span style="cursor:pointer;" onclick="$('form').submit();"  class="button button-block bg-main text-big">立即登录后台</span></div>
            </div>
            </form>
            <script type="text/javascript">
				function changeimg(){
					$("#image").attr("src","image!createimgHard.action?date=" + new Date().getTime());
				}
				function checkimagecode(){
					
					var imagecode=$("#imagecode").val().trim();
					if(imagecode==""){
						alert("请输入图形验证码");
						return;
					}
					$.ajax({
						url:"image!checkcode.action",
						type:"post",
						data:{"code":imagecode},
						dataType:"json",
						error:function(){alert("请重试")},
						success:function(data){
							if(data=="success"){
								$("form").submit();
							}else{
								alert(data);
							}
						}
					})
				}
			</script>
          
        </div>
    </div>
</div>


</body>
</html>