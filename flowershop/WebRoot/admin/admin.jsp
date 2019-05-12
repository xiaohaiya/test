<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>心雨花屋</title>
    <link rel="SHORTCUT ICON" href="${pageContext.request.contextPath }/admin/images/logo.ico">
    <link rel="BOOKMARK" href="${pageContext.request.contextPath }/admin/images/logo.ico">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/admin/css/style.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/admin/css/jquery.wysiwyg.old-school.css">
	<script type="text/javascript" src="${pageContext.request.contextPath }/admin/js/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/admin/js/jquery-ui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/admin/js/min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/admin/js/main.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/admin/css/style2.css">
<style type="text/css">
	body{
		padding:0;
		margin:0;
		overflow-y:hidden;
	}
	.main{
		height:100%;
		width:100%;
		position:absolute;
	}
	.top{
		width:100%;
        min-width: 1200px;
		height:42px;
		position:absolute;
		top:0;
		z-index:102;
	}
	.bottom{
		width:100%;
		height:100%;
		position:absolute;
		top:0;
		z-index:101;
	}
	.left{
		width:14.4%;
        min-width: 190px;
		height:100%;
		clear:both;
		float:left;
		position:absolute;
		top:0;
	}
	.right{
		width:100%;
		height:100%;
        min-width: 1200px;
	}
</style></head>
<body>
	<div class="main">
		<div class="top">
			<iframe name="top" width="100%" height="100%" src="${pageContext.request.contextPath }/admin/page/top.jsp"></iframe>
		</div>
		<div class="bottom">
			<div class="left">
				<iframe name="left" width="100%" height="100%" src="${pageContext.request.contextPath }/admin/page/left.jsp" scrolling="no"></iframe>
			</div>
			<div class="right">
				<iframe name="right" width="100%" height="100%" src="${pageContext.request.contextPath }/admin/page/admin_waitorder.action"></iframe>
			</div>
		</div>
	</div>
</body></html>