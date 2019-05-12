<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<jsp:include page="head.jsp"></jsp:include>
<script type="text/javascript" src="js/jquery_jiaoyan.js"></script>
<script type="text/javascript">
$(function() {
	$("#jvForm").validate();
});
</script>
<s:if test='#message=="codeerror"||#message=="emailcodeerror"'>
<script type="text/javascript">$(function () {alert("验证码错误");})</script>
</s:if>
<s:if test='#message=="emailerror"'>
<script type="text/javascript">$(function () {alert("邮件发送失败！");})</script>
</s:if>
<div class="user-page-content">
	<div class="clearfix w">
   		<s:if test='#message=="paramerror"'>
   		<div class="content-one content-hei">
        	<div class="user_title"><a href="${pageContext.request.contextPath }/user_forgetui.action">找回密码</a></div>
            <div class="regist_active_box">
                <div style="text-align: center; margin: 20px auto; font-size: 18px;">
                	<img src="${pageContext.request.contextPath }/images/cuowu.png" align="middle" width="50" height="50">
                	<span><font size="4">找回密码失败，用户名错误或邮箱不正确！</font></span>
                </div>
            </div>	
        </div>
   		</s:if>
   		<s:elseif test='#message=="success"||#message=="emailcodeerror"'>
   		<div class="content-one content-hei">
        	<div class="user_title">
            找回密码
            <span class="fr" style="font-size:13px; line-height:30px; color:#999;">验证码已成功发送至您的邮箱，请前去邮箱查看！</span>
            </div>
            <form id="jvForm" action="${pageContext.request.contextPath }/user_reupaswd.action" method="post">
            <input type="text" name="id" value="<s:property value="#user.id" />" hidden="hidden">
            <table border="0" align="center" cellpadding="3" cellspacing="0" class="zhuce">
            <tbody><tr>
            <td width="200" height="45" align="right">
            <font color="red">*</font>新密码：</td>
            <td><input type="password" id="password" name="password" class="register_input w200 fl mr20 required" vld="{required:true,rangelength:[6,20]}"></td>
            </tr>
            <tr>
            <td height="45" align="right">
            <font color="red">*</font>确认密码：</td>
            <td><input type="password" equalTo="#password" class="register_input w200 fl mr20 required" vld="{required:true}"></td>
            </tr>
            <tr>
            <td height="45" align="right">
            <font color="red">*</font>验证码：</td>
            <td colspan="2"><input type="text" name="checkcode"  class="register_input w200 fl mr20" vld="{required:true}"/>
            </td>
            </tr>
            <tr>
            <td height="50" align="right">&nbsp;</td>
            <td colspan="2"><input type="submit" value="提交" class="ss_button w200">
            </td>
            </tr>
            </tbody></table>
            </form>  
    	</div>
   		</s:elseif>
   		<s:else>
    	<div class="content-one content-hei">
        	<div class="user_title">
            找回密码
            <span class="fr" style="font-size:13px; line-height:30px; color:#999;">忘记密码了吗？请输入您的登录账号，就可轻松找回您的密码！</span>
            </div>
            <form id="jvForm" action="${pageContext.request.contextPath }/user_forgetPaswd.action" method="post">
            <table border="0" align="center" cellpadding="3" cellspacing="0" class="zhuce">
            <tbody><tr>
            <td width="200" height="45" align="right">
            <font color="red">*</font>用户名：</td>
            <td><input type="text" id="username" name="username" class="register_input w200 fl mr20 required" vld="{required:true,rangelength:[3,20]}"></td>
            <td><span class="gray">用户名由3到20位的中文字符、英文字母、数字组成。</span></td>
            </tr>
            <tr>
            <td height="45" align="right">
            <font color="red">*</font>Email：</td>
            <td><input type="text" name="email" id="email" class="register_input w200 fl mr20 required" vld="{required:true,email:true}"></td>
            <td><span class="gray">找回密码会发送邮件到该邮箱。</span></td>
            </tr>
            <tr>
            <td height="45" align="right">
            <font color="red">*</font>验证码：</td>
            <td colspan="2"><input type="text" name="checkcode"  class="register_input w200 fl mr20" vld="{required:true}"/>
            <img src="${pageContext.request.contextPath }/user_getImg.action" height="30" class="fl" id="checkcode" onclick="$('#checkcode').attr('src','${pageContext.request.contextPath }/user_getImg.action?d'+new Date()*1);"/>
            <a href="javascript:void(0);" style="line-height:30px;" onclick="$('#checkcode').attr('src','${pageContext.request.contextPath }/user_getImg.action?d'+new Date()*1);return false">看不清，换一张 </a>
            </td>
            </tr>
            <tr>
            <td height="50" align="right">&nbsp;</td>
            <td colspan="2"><input type="submit" value="提交" class="ss_button w200">
            </td>
            </tr>
            </tbody></table>
            </form>  
    	</div>
    	</s:else>
	</div>
</div>
<jsp:include page="bottom.jsp"></jsp:include>