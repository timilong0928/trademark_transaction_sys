<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<style type="text/css">
		
		.bottomnav{
			
		}
		
		.bottomnav div{
			float:left;
			width: 20%;
			height:50px;
			background-color: white;
		}
		.shadow {
			box-shadow: 0 0 20px rgba(0, 0, 0, 0.5);
		}
		
		.navbt{
			background:no-repeat top 3px left 15px/auto 42px;
		}
		.nav1{
			background-image: url(<%=path%>/img/bottom1.png);
		}
		.nav2{
			background-image: url(<%=path%>/img/bottom2.png);
		}
		.nav1.act{
			background-image: url(<%=path%>/img/bottom11.png);
		}
		.nav2.act{
			background-image: url(<%=path%>/img/bottom12.png);
		}
		
</style>
<div class="bottomnav shadow" style="position: fixed;bottom: 0;z-index: 1;width: 100%;height: 50px;background-color: white;">
	<div class="navbt" style="width: 15%;" /></div>
	<div class="navbt nav1 act" id="center" onclick="location='index!index.action?id1=${team.id}'"></div>
	<div class="navbt" style="width: 15%;" /></div>
	<div class="navbt" style="width: 15%;" /></div>
	<div class="navbt nav2" onclick="location='team!toCenter.action'"></div>
	<div class="navbt" style="width: 15%;" /></div>
</div>

<script type="text/javascript">
$(function(){
	$(".navbt").click(function(){
		$(".navbt").removeClass("act");
		$(this).addClass("act");
	});
});
</script>