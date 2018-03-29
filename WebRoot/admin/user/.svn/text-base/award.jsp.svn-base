<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@ page import="pojo.Admin"%>
<%
	String path = request.getContextPath();
	Admin admin = (Admin) session.getAttribute("admin");
	if (admin == null) {
		response.sendRedirect(request.getContextPath()
				+ "/admin/login.jsp");
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
		<link rel="stylesheet" href="<%=path%>/admin/css/pintuer.css">
		<link rel="stylesheet" href="<%=path%>/admin/css/admin.css">
		<script src="<%=path%>/admin/js/jquery.js"></script>
		<script src="<%=path%>/admin/js/pintuer.js"></script>
		<script src="<%=path%>/admin/js/respond.js"></script>
		<script src="<%=path%>/admin/js/admin.js"></script>

	</head>

	<body>
	

		<%@ include file="/admin/topmenu.jsp"%>
<SCRIPT type="text/javascript">
	showwhere("teamtop", 1)
</SCRIPT>
        
		<div class="admin">

			<!-- 积分修改界面 -->
			<div class="panel">
				<div class="panel-head">
					会员默认设置
				</div>

				<div class="panel-body">

					<form action="award!update.action" method="post"  enctype="multipart/form-data" >
                        
					
						<div  class="form-group">
							<label class="label">
								返佣金额
							</label>
							<div class="field">
								<input id="fenxiao1" type="text" name="award.discount1"
									data-validate="required:必填,plusinteger:请输入整数" value="${award.discount1}"
									class="input" placeholder="请输入返佣金额"/>
								
							</div>
						</div>
						
						<div  class="form-group">
							<label class="label">
								最低提现金额
							</label>
							<div class="field">
								<input id="fenxiao2" type="text" name="award.minmoney"
									data-validate="required:必填,plusinteger:请输入整数" value="${award.minmoney}"
									class="input" placeholder="请输入最低提现金额"/>
							</div>
						</div>
					<!-- 分销的开启和关闭
					<div class="form-group">
                        <input id="fenxiaobutton" type="button" onclick="changefenxiao()" 
                        class="button border-blue button-little" value="关闭分销" />
                    </div>
                    -->	
						<input id="getfenxiao" type="hidden" name="award.fenxiao" value="${award.fenxiao}"/>
						<input type="hidden" name="award.id" value="${award.id}" />
						<br />
						<button class="button bg-main">
							提交
						</button>
					</form>
				</div>
			</div>
     </div>
		
		<SCRIPT type="text/javascript">
		$(function(){
		   var obj1=$("#getfenxiao").val();
          
           if(obj1==1){
             $(":button").val("开启分销");
           }
 
         }); 
		
		   function changefenxiao(){
		   
		     
		     var obj=$("#fenxiaobutton").val();
		     
		     if(obj=="开启分销"){
		      
		       $(":button").val("关闭分销");
			   $("#getfenxiao").val(0);
		       
		     }else if (obj=="关闭分销") {
		        
			   $(":button").val("开启分销");
		       $("#getfenxiao").val(1);
			}
		     
		 }
		
		</SCRIPT>
	</body>
</html>