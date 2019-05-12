<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<jsp:include page="head.jsp"></jsp:include>
<script type="text/javascript" src="js/jquery_jiaoyan.js"></script>
<script type="text/javascript">
	$(function() {
		$("#jvForm").validate();
	});
	function checkJvForm(){
		var mobile=$("#mobile").val();
		if(mobile==null||mobile==""){
			$("#checkmobile").html("请输入您的手机号码");
		}else if(mobile.length != 11 || !/^[0-9]+$/.test(mobile)) {
			message = "您输入的格式有误，请重新输入您的手机号码。";
			$("#checkmobile").html(message);
			return;
		}else{
			$("#checkmobile").html("");
		}
		$("#jvForm").submit();
	}

	function displayed(i) {
		$("#ul" + i).toggle();
		if ($("#ss" + i).attr("class") == "user_ss") {
			$("#ss" + i).attr("class", "user_tt");
		} else {
			$("#ss" + i).attr("class", "user_ss");
		}
	}

	
</script>
<div class="user-page-content">
<div class="clearfix w">
<div class="user_menu">
    <div class="navs" id="JS_u_navs">
        <div id="ss1" style="cursor: pointer;" onclick="displayed(1);"><h3><span class="s1"></span>订单中心</h3></div>
        <ul id="ul1">
            <li><a href="${pageContext.request.contextPath }/order_myorder.action">我的订单</a></li>
			<li><a href="${pageContext.request.contextPath }/order_returnOrder.action">退货订单</a></li>
			<li><a href="${pageContext.request.contextPath }/news_findAll.action">站内信息</a></li>
        </ul>
        
        <div id="ss2" style="cursor: pointer;" onclick="displayed(2);"><h3><span class="s2"></span>账户管理</h3></div>
        <ul id="ul2">
			<li><a href="${pageContext.request.contextPath }/user_info.action">个人资料</a></li>
			<li><a href="${pageContext.request.contextPath }/user_findaddr.action">收货地址</a></li>
			<li><a href="${pageContext.request.contextPath }/user_updatepasword.action">修改密码</a></li>
		</ul>
        
        <div id="ss3" style="cursor: pointer;" onclick="displayed(3);"><h3><span class="s3"></span>服务与评价</h3></div>
        <ul id="ul3">
            <li><a href="#">商品评论</a></li>
        </ul>
    </div>
</div>
<div class="user_main">
        	<div class="content-one content-hei">
                <div class="user_title">收货地址</div>
                <div class="receiving_address">
                    <dl>
                    	<s:if test="#addrList.size()<1">
                    		您还没有添加收货地址。
                    	</s:if>
                        <s:iterator value="#addrList" var="addr">
                        <s:if test="#addr.status==1">
                        <div class="ff_current" style=" overflow:hidden; ">
                        <dt>&nbsp;
                            <span class="fr">
                        		<a href="${pageContext.request.contextPath }/addr_findById.action?id=<s:property value="#addr.id"/>  " class="no_button" target="_self">修改</a>
                        		<a href="${pageContext.request.contextPath }/addr_delete.action?id=<s:property value="#addr.id"/>" class="no_button">删除</a>
                        		<a href="${pageContext.request.contextPath }/addr_updateStatus.action?id=<s:property value="#addr.id"/>" class="no_button">设为默认</a>
                            </span>
                        </dt>
                        
                        
                        <table width="96%" border="1" align="center" cellpadding="3" cellspacing="1" style="border-color:#ECECEC; margin:auto;" bgcolor="#ddd">
                          <tbody><tr>
                            <td height="30" width="100" align="center" bgcolor="#f9f9f9">收货人</td>
                            <td height="30" width="100" align="center" bgcolor="#f9f9f9">性别</td>
                            <td height="30" align="center" bgcolor="#f9f9f9">详细地址</td>
                            <td height="30" width="150" align="center" bgcolor="#f9f9f9">手机号码</td>
                            <td width="90" height="30" align="center" bgcolor="#f9f9f9">邮编</td>
                          </tr>
                          <tr>
                            <td height="30" align="center" bgcolor="#FFFFFF"><s:property value="#addr.name" /> </td>
                            <td align="center" bgcolor="#FFFFFF"><s:property value="#addr.gender" /></td>
                            <td align="center" bgcolor="#FFFFFF"><s:property value="#addr.address" /></td>
                            <td align="center" bgcolor="#FFFFFF"><s:property value="#addr.phone" /></td>
                            <td align="center" bgcolor="#FFFFFF"><s:property value="#addr.postalcode" /></td>
                          </tr>
                        </tbody></table>
                        </div>
                        </s:if>
                        </s:iterator>
                        <s:iterator value="#addrList" var="addr">
                        <s:if test="#addr.status==0">
                        <div style=" overflow:hidden; ">
                        <dt>&nbsp;
                            <span class="fr">
                        		<a href="${pageContext.request.contextPath }/addr_findById.action?id=<s:property value="#addr.id"/>  " class="no_button" target="_self">修改</a>
                        		<a href="${pageContext.request.contextPath }/addr_delete.action?id=<s:property value="#addr.id"/>" class="no_button">删除</a>
                        		<a href="${pageContext.request.contextPath }/addr_updateStatus.action?id=<s:property value="#addr.id"/>" class="no_button">设为默认</a>
                            </span>
                        </dt>
                        
                        
                        <table width="96%" border="1" align="center" cellpadding="3" cellspacing="1" style="border-color:#ECECEC; margin:auto;" bgcolor="#ddd">
                          <tbody><tr>
                            <td height="30" width="100" align="center" bgcolor="#f9f9f9">收货人</td>
                            <td height="30" width="100" align="center" bgcolor="#f9f9f9">性别</td>
                            <td height="30" align="center" bgcolor="#f9f9f9">详细地址</td>
                            <td height="30" width="150" align="center" bgcolor="#f9f9f9">手机号码</td>
                            <td width="90" height="30" align="center" bgcolor="#f9f9f9">邮编</td>
                          </tr>
                          <tr>
                            <td height="30" align="center" bgcolor="#FFFFFF"><s:property value="#addr.name" /> </td>
                            <td align="center" bgcolor="#FFFFFF"><s:property value="#addr.gender" /></td>
                            <td align="center" bgcolor="#FFFFFF"><s:property value="#addr.address" /></td>
                            <td align="center" bgcolor="#FFFFFF"><s:property value="#addr.phone" /></td>
                            <td align="center" bgcolor="#FFFFFF"><s:property value="#addr.postalcode" /></td>
                          </tr>
                        </tbody></table>
                        </div>
                        </s:if>
                        </s:iterator>
                        
                    </dl>
  
                </div>
				<div class="order_conhead"
					style=" line-height:40px; padding:0 5px; margin-top:50px; margin-bottom:20px; background:#fff;">
					<span style="font-size:16px;">新增收货地址</span><span class="red">（所有项均为必填）</span>
				</div>
			<form action="${pageContext.request.contextPath }/addr_save.action" id="jvForm" method="post">
                <table id="infotab" width="100%" border="0" cellspacing="0" cellpadding="3">
                <tbody><tr>
                <td height="40" width="70" align="right" style="color:#333;">收&nbsp;&nbsp;货&nbsp;&nbsp;人：</td>
                <td width="648"><input name="name" type="text" maxlength="20" class="ss_input required"></td>
                </tr>
                <tr>
                <td height="40" align="right" style="color:#333;">性&nbsp;&nbsp;&nbsp;别：</td>
                <td width="648"><input type="radio" name="gender" value="男" checked="checked">男&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="radio" name="gender" value="女">女
                </td>
                </tr>
                <tr>
                <td height="40" align="right" style="color:#333;">手机号码：</td>
                <td width="648"> <input type="text" id="mobile" name="phone" maxlength="11" class="ss_input required">
                <font color="red"><span id="checkmobile"></span></font></td>
                </tr>
                <tr>
                <td height="40" align="right" style="color:#333;">邮政编码：</td>
                <td width="648"><input name="postalcode" type="text" maxlength="15" class="ss_input required"></td>
                </tr>
                <tr>
                <td height="40" align="right" style="color:#333;">收货地址：</td>
                <td width="648"><input name="address" type="text" size="50" maxlength="100" class="ss_input required"></td>
                </tr>
                <tr>
                <td height="40" align="right">&nbsp;</td>
                <td width="648"><input name="status" type="checkbox" value="1">设为默认地址</td>
                </tr>
                <tr>
                <td height="60" align="right">&nbsp;</td>
                <td width="648"><input type="button" value="保  存 " onclick="checkJvForm();" class="ss_button">&nbsp;&nbsp;
                <input type="reset" value="重  置" class="no_button"></td>
                </tr>
                </tbody></table>
              </form>
        	</div>
    	</div>
    </div>
</div>
<jsp:include page="bottom.jsp"></jsp:include>