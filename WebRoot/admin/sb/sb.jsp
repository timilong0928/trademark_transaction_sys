<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page import="pojo.Admin" %>
<% 
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
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="renderer" content="webkit">
    <title>后台管理</title>
    <link rel="stylesheet" href="<%=path%>/admin/css/pintuer.css">
	<link rel="stylesheet" href="<%=path%>/admin/css/admin.css">
	<script src="<%=path%>/admin/js/jquery.js"></script>
	<script src="<%=path%>/admin/js/pintuer.js"></script>
	<script src="<%=path%>/admin/js/admin.js"></script>
   
</head>

<SCRIPT type="text/javascript">
	  $(function(){ 
	  if (msg!=null||msg!=='') {
		　alert(msg)
	}
　
}); 
</SCRIPT>
<body>

<%@ include file="/admin/topmenu.jsp" %>
<SCRIPT type="text/javascript">showwhere("sbtop",1)</SCRIPT>
<div class="admin">
	
	
	<div class="panel">
  <div class="panel-head">
  	<div class="line-middle">
						<form method="post" action="sb!searchbiaohao.action"
							enctype="multipart/form-data">
							
							<div style="height: auto;width: 80%;margin-left: 10%">
							
							
							<div class="x4" style="text-align: right;padding-top: 2px;">
								
			                    <select name="key"  class="button button-small border-blue">
			                    		<option value="1">编号</option>
			                    		<option value="2">关键词</option>
			                    		
			                    </select>
			                    
							</div>
							<div class="x3">
			                    <div>
			                    	<input style="display: inline;" placeholder="请输入关键词" value="${keyword2}" class="input"   name="keyword" type="text" />
			                    </div>
							</div>
							<button   type="submit" class="button bg-blue" >
								立即搜索
							</button>
							
							</div>
						</form>
						
						<form method="post" action="sb!searchbiaohao1.action"
							enctype="multipart/form-data">
							
							<div style="height: auto;width: 100%;margin-top: 10px">
							
							
							<div class="x4" style="text-align: right;padding-top: 2px;">
								
			                    <select name=""  class="button button-small border-blue">
			                    		
			                    		<option value="">商标分类+关键词</option>
			                    </select>
			                    
							</div>
							<div class="x3">
								<div>
			                    	<input class="input"   style="float:left;width: 50%" placeholder="请输入分类id，逗号隔开" value="${keyword3}"  name="keyword3" type="text" />
			                    	<input  class="input"  style="float:left;width: 40%;margin-left: 10px" placeholder="请输入关键词" value="${keyword4}"   name="keyword4" type="text" />
			                    </div>
			                    
							</div>
							<button   type="submit" class="button bg-blue" >
								立即搜索
							</button>
							
							</div>
						</form>
						
						
						
					</div>
  
  </div>
  <div class="panel-body">
  		<a href="<%=request.getContextPath()%>/sb!add1.action">
            <input type="button" class="button button-small border-blue" value="添加商标" /></a>
            
            <a href="<%=request.getContextPath()%>/sb!chazhao.action?id=1" style="margin-left: 30px">
            <input type="button" class="button button-small border-green" value="全部" /></a>
            
            <a href="<%=request.getContextPath()%>/sb!chazhao.action?id=2">
            <input type="button" class="button button-small border-green" value="销售中" /></a>
            
            <a href="<%=request.getContextPath()%>/sb!chazhao.action?id=3">
            <input type="button" class="button button-small border-green" value="已售罄" /></a>
            
            
            
  <table class="table table-hover">
        	<tr>
        	<th width="200">商品id</th>
        	<th width="200">编号</th>
        	<th width="200">商标</th>
        	
        	<th width="400">标题</th>
        	<th width="300">商品价格</th>
        	<!-- Edit by Timilong(13896901804@qq.com) 2018年3月30日-->
        	<th width="300">内部(成本)价格</th>
        	<th width="300">持有人</th>
        	<!-- Edit by Timilong(13896901804@qq.com) 2018年3月30日-->
        	<th width="200">所属分类</th>
        	<th width="200">销售状态</th>
        	<th width="500">操作</th>
        	</tr>
        	
        	<s:iterator value="sbs">
        	
           <form action="sb!update1.action" method="post" enctype="multipart/form-data">
            <input type="hidden" value="<s:property value="id"/>" name="sb.id"/>
              <tr>
              	
              	<td><div style="margin-top: 20px"   />${id}</div></td> 
              	<td><div style="margin-top: 20px" name="sb.title"  />${biaohao}</div></td> 
	            <td><img height="70"  src="<%=request.getContextPath() %>/<s:property value="img"/>" /></td>
	            <td><div style="margin-top: 20px"   />${title}</div></td>
	            <td><div style="margin-top: 20px"   />${price}</div></td>
	            
	            <!-- Edit by Timilong(13896901804@qq.com) 2018年3月30日-->
	            <td><div style="margin-top: 20px"   />${cost_price}</div></td>
	            <td><div style="margin-top: 20px"   />${sb_owner}</div></td>
	            <!-- Edit by Timilong(13896901804@qq.com) 2018年3月30日-->
	            <td><div style="margin-top: 20px"   />${fenleiname}</div></td>
		        <td><div style="margin-top: 20px"   />
		                <s:if test="state==0">销售中</s:if>
		                <s:if test="state==1">已售</s:if>
		                 </div>
		               </td>
	            <td>
	                
	           		<a style="margin-top: 20px;font-size: 13px" href="sb!look1.action?sbid=<s:property value="id"/>"  class="button border-blue button-little" />查看</a>
	           		
	           		<a style="margin-top: 20px;font-size: 13px" href="sb!xiugai.action?sbid=<s:property value="id"/>" class="button border-blue button-little" />修改</a>
	           		 
	           	
	                 <a style="margin-top: 22px;font-size: 13px" class="button border-red button-little" href="sb!delete1.action?sb.id=<s:property value="id"/>"
	             	 onclick="{if (confirm('确认删除?')) {return true;}return false;};"> 
	           		 删除</a>
	              </td>
               </tr>
        </form>
           
            
            </s:iterator>
           
    </table>
  </div>
</div>
</div>


</body>
</html>