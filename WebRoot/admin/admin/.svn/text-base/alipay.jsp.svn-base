<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="/struts-tags" prefix="s"%>

<%@ page import="pojo.Admin" %>
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
		<link rel="stylesheet" href="<%=path%>/admin/css/pintuer.css">
		<link rel="stylesheet" href="<%=path%>/admin/css/admin.css">
		<script src="<%=path%>/admin/js/jquery.js"></script>
		<script src="<%=path%>/admin/js/pintuer.js"></script>
		<script src="<%=path%>/admin/js/admin.js"></script>
		
	</head>

	<body>
	<s:include value="/admin/topmenu.jsp"></s:include>
		<script type="text/javascript">
				showwhere("shezhitop",4);
		</script>

		<div class="admin">

			<div class="panel">
				<div class="panel-head">
					阿里支付配置
				</div>

				<div class="panel-body">

					<form action="alipay!update.action" method="post">

						<div class="form-group">
							<label class="label">
								合作者身份PID:
							</label>
							<div class="field">
								<input type="text" name="alipay.partner"
									data-validate="required:必填" value="${alipay.partner}"
									class="input" placeholder="请输入合作者身份PID" />
								</br>
							</div>
						</div>

						<div class="form-group">
							<label class="label">
								MD5签名验证码:
							</label>
							<div class="field">
								<input type="text" name="alipay.md5"
									data-validate="required:必填" value="${alipay.md5}"
									class="input" placeholder="请输入公众号原始id" />
							</div>
						</div>
						<input type="hidden" name="alipay.id" value="${alipay.id}" />
						<button class="button bg-main">
							提交
						</button>
					</form>
				</div>
			</div>


		</div>
	</body>
</html>