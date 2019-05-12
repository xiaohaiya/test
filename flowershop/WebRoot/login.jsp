<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <title>心雨花屋</title>
    <link rel="SHORTCUT ICON" href="${pageContext.request.contextPath }/admin/images/logo.ico">
    <link rel="BOOKMARK" href="${pageContext.request.contextPath }/admin/images/logo.ico">
    <link rel="stylesheet" href="bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="css/index.css">
    <link rel="stylesheet" href="css/member.css">
</head>
<body style="background:#fff;">
<s:if test='#message=="updatesuccess"'>
<script type="text/javascript">window.onload=function(){alert("密码修改成功，请登录！");}</script>
</s:if>
<div class="Header">
	<div class="ctr pr">
        <a href="${pageContext.request.contextPath }" title="返回单店首页">
        <img src="images/logobg.png" width="180" height="50" class="Logo">
        </a>
    </div>
</div>
    
<div style="width:1000px; margin:auto auto 30px auto; overflow:hidden;">
    <img src="images/login_pic.jpg" class="fl">
    <div class="fr">
        <form id="jvForm" action="${pageContext.request.contextPath }/user_login.action" method="post">
            <div style="line-height:30px;">
                <div class="red"><s:property value="actionErrors[0]"/></div>
            </div>
            
            <div style="border:2px solid #e7e7e7; width:390px; height:360px; margin-top:30px;">
                <table width="335" border="0" align="center" cellpadding="2" cellspacing="0" style="margin:auto;">
                <tbody><tr>
                <td height="70">
                <div class="fl" style="font-size:18px; color:#484848; font-family:微软雅黑;">账户登录</div>
                <a href="${pageContext.request.contextPath }/user_regist.action" style="color:#cf1e1e; font-size:14px;" class="fr">免费注册</a>
                </td>
                </tr>
                <tr>
                <td height="75">
                <input type="text" name="username" id="username" class="loginInput" required="true" placeholder="用户名">
                </td>
                </tr>
                <tr>
                <td height="75">
                <input type="password" name="password" id="" class="loginInput" required="true" placeholder="密码">
                </td>
                </tr>
                <tr>
                <td height="30">
                <a href="${pageContext.request.contextPath }/user_forgetui.action" target="_blank" class="fr">忘记密码</a> 
                </td>
                </tr>
                
                <tr>
                <td height="75"><input type="submit" value="登 录" style="width:100%; height:45px; text-align:center; color:#fff; background:#AF0000; cursor:pointer; border:0; font-size:16px;border-radius:4px;"></td>
                </tr>
                </tbody>
                </table>
            
            </div>    
        </form>
    </div>
</div>

<div class="Copyright" style="background:#fff;">
    <div class="ctr tac">Copyright © xinyuhuawu 2019，All Rights Reserved</div>
</div>
</body>
</html>