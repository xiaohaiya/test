<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>心雨花屋-后台管理</title>
    <link rel="SHORTCUT ICON" href="${pageContext.request.contextPath }/admin/images/logo.ico">
    <link rel="SHOPMARK" href="${pageContext.request.contextPath }/admin/images/logo.ico">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/admin/css/admin.css"/>
</head>
<body>
<s:if test="actionErrors[0]!=null">
<script type="text/javascript">
alert("<s:property value="actionErrors[0]"/>");
window.top.location.href='${pageContext.request.contextPath }/admin_index.action';
</script>
</s:if>
<div class="login">
    <div class="message">商城系统-管理登录</div>
    <div id="darkbannerwrap"></div>
    <form action="${pageContext.request.contextPath }/admin_login.action" method="post">
		<input name="action" value="login" type="hidden">
		<input name="admin" placeholder="用户名" required oninvalid="setCustomValidity('请输入用户名')" oninput="setCustomValidity('')" type="text">
		<hr class="hr15">
		<input name="password" placeholder="密码" required oninvalid="setCustomValidity('请输入密码')" oninput="setCustomValidity('')" type="password">
		<hr class="hr15">
		<input value="登录" style="width:100%;" type="submit">
		<hr class="hr20">
	</form>
</div>
</body>
</html>
<script type="text/javascript">
<s:if test='#LoginMessage=="false"'>
	alert("用户名或密码错误！");
</s:if>
</script>