<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<jsp:include page="head.jsp"></jsp:include>
<script type="text/javascript" src="js/jquery_jiaoyan.js"></script>
<script type="text/javascript">
$(function() {
	$("#jvForm").validate();
});
function onSubmit(){
	if(!$("#contract").attr("checked")==true){ 
		alert("请阅读注册协议!");
		return ;
	}
	$("#jvForm").submit();
}
</script>
<div class="user-page-content">
	<div class="clearfix w">
      <div class="content-one content-hei">
            <div class="user_title">注册新用户<span class="fr" style="font-size:12px;">已有帐号，<a href="${pageContext.request.contextPath }/user_login.action" style="color:#F00; font-size:14px;">登录</a></span></div>
            <form id="jvForm" action="user_regist.action" method="post">
            <table border="0" align="center" cellpadding="3" cellspacing="0" class="zhuce">
            <tr>
            <td height="45" width="200" align="right">用户名：</td>
            <td>
            <input type="text" id="username" name="username" class="register_input w200 fl mr20" vld="{required:true,rangelength:[3,20],remote:'${pageContext.request.contextPath }/user_findByUserName.action',messages:{remote:'用户名已存在'}}"/>
            </td>
            <td>
            <span class="gray">用户名由3到20位的中文字符、英文字母、数字组成。</span>
            </td>
            </tr>
            <tr>
            <td height="45" width="" align="right">Email：</td>
            <td><input type="text" name="email" id="email"  class="register_input w200 fl mr20" vld="{required:true,email:true}"/></td>
            <td><span class="gray">输入有效邮箱地址并成功激活，可用此邮箱做为登录账号及找回密码</span></td>
            </tr>
            <tr>
            <td height="45" width="200" align="right">密码：</td>
            <td><input name="password" type="password" class="register_input w200 fl mr20" id="password" vld="{required:true,rangelength:[6,32]}" /></td>
            <td><span class="gray">6－20位字符，可由大小写英文、数字或符号组成 </span></td>
            </tr>
            <tr>
            <td height="45" width="200" align="right">确认密码：</td>
            <td><input type="password" equalTo="#password" class="register_input w200 fl mr20"  vld="{required:true}"/></td>
            <td><span class="gray">再次输入相同密码</span></td>
            </tr>
            <tr>
            <td height="45" width="200" align="right">验证码：</td>
            <td colspan="2"><input type="text" name="checkcode"  class="register_input w200 fl mr20" vld="{required:true}"/>
            <img src="${pageContext.request.contextPath }/user_getImg.action" height="30" class="fl" id="checkcode" onclick="$('#checkcode').attr('src','${pageContext.request.contextPath }/user_getImg.action?d'+new Date()*1);"/>
            <a href="javascript:void(0);" style="line-height:30px;" onclick="$('#checkcode').attr('src','${pageContext.request.contextPath }/user_getImg.action?d'+new Date()*1);return false">看不清，换一张 </a>
            </td>
            </tr>
            <tr>
            <td height="45" width="200" align="right">&nbsp;</td>
            <td colspan="2">
            <input type="checkbox" id="contract" name="contract" checked="checked"/>
            <a href="javascript:void(0);" onclick="window.open('xieyi.jsp','','height=600,width=600,scrollbars=1');" class="xieyi">已阅读并接受《 商城协议 》</a></td>
            </tr>
            <tr>
            <td height="50" width="200" align="right">&nbsp;</td>
            <td colspan="2"><input type="button" onclick="onSubmit();" value="注册" class="ss_button w200"/>
            </td>
            </tr>
            </table>
          </form>
        </div>
	</div>
</div>
<jsp:include page="bottom.jsp"></jsp:include>
<s:if test="#message=='false'">
<script type="text/javascript">
	alert("验证码错误！");
</script>
</s:if>