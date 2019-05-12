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
				<div id="ss1" style="cursor: pointer;" onclick="displayed(1);">
					<h3>
						<span class="s1"></span>订单中心
					</h3>
				</div>
				<ul id="ul1">
					<li><a href="${pageContext.request.contextPath }/order_myorder.action">我的订单</a></li>
					<li><a href="${pageContext.request.contextPath }/order_returnOrder.action">退货订单</a></li>
					<li><a href="${pageContext.request.contextPath }/news_findAll.action">站内信息</a></li>
				</ul>

				<div id="ss2" style="cursor: pointer;" onclick="displayed(2);">
					<h3>
						<span class="s2"></span>账户管理
					</h3>
				</div>
				<ul id="ul2">
					<li><a href="${pageContext.request.contextPath }/user_info.action">个人资料</a></li>
					<li><a href="${pageContext.request.contextPath }/user_findaddr.action">收货地址</a></li>
					<li><a href="${pageContext.request.contextPath }/user_updatepasword.action">修改密码</a></li>
				</ul>

				<div id="ss3" style="cursor: pointer;" onclick="displayed(3);">
					<h3>
						<span class="s3"></span>服务与评价
					</h3>
				</div>
				<ul id="ul3">
					<li><a href="#">商品评论</a></li>
				</ul>
			</div>
		</div>
		<div class="user_main">
			<div class="content-one content-hei">
				<div class="user_title">
					个人资料 <span class="fr"> <a href="${pageContext.request.contextPath }/user_portrait.action" class="no_button">修改头像</a>
					</span>
				</div>
				<div class="clear"></div>
				<div style="overflow:hidden; padding:10px; margin:auto; width:95%;">
					<div class="user_photo fl">
						<div class="photo_img">
							<a href="${pageContext.request.contextPath }/user_portrait.action"> <img src="<s:property value="#userinfo.picture"/>" width="90"
								height="90" />
							</a>
						</div>
					</div>
					<div class="user_xinxi fr">
						<p>
							<span style="color:#010000;"><strong>test1</strong></span>&nbsp;&nbsp;&nbsp;(
							金牌会员 )
						</p>
						<p style="color:#666; font-size:12px;">上次登录时间：2019-03-15
							11:03:07</p>
						<p style="color:#666; font-size:12px;">
							已消费：<span style="color:#eb0e22;"><b>￥0</b></span>
						</p>
					</div>
				</div>
				<div class="clear" style="height:30px;"></div>
				<div class="mc_content">
					<div id="infotab" class="dis">
						<form id="jvForm" action="user_updateinfo.action" method="post">

							<table width="98%" border="0" align="center" cellpadding="3"
								cellspacing="0">
								<tr>
									<td width="150" height="40" align="right">用户名：</td>
									<td>
										&nbsp;<s:property value="#userinfo.username" />
										<input type="text" hidden="hidden" value="<s:property value="#userinfo.id"/>" name="id"/>
									</td>
								</tr>
								<tr>
									<td height="40" align="right"><font color="red">*</font>邮箱：
									</td>
									<td>&nbsp;<input type="text" id="email" name="email"
										value="<s:property value="#userinfo.email"/>"
										class="ss_input required email" /></td>
								</tr>
								<tr>
									<td height="40" align="right"><font color="red">*</font>真实姓名：</td>
									<td>&nbsp;<input type="text" id="realName" name="name"
										value="<s:property value="#userinfo.name"/>"
										class="ss_input required" /></td>
								</tr>
								<tr>
									<td height="40" align="right"><font color="red">*</font>手机：</td>
									<td>&nbsp;<input type="text" id="mobile" name="phone"
										value="<s:property value="#userinfo.phone"/>"
										class="ss_input required digits" /> <font color="red">
											<span id="checkmobile"></span>
									</font>
									</td>
								</tr>
								<tr>
									<td height="40" align="right"><font color="red">*</font>性别：</td>
									<td>&nbsp;&nbsp; <s:if test='#userinfo.gender=="男"'>
											<input type="radio" name="gender" value="男" checked="checked" />男&nbsp;&nbsp; <input
												type="radio" name="gender" value="女" />女
										</s:if> <s:if test='#userinfo.gender=="女"'>
											<input type="radio" name="gender" value="男" checked="checked" />男&nbsp;&nbsp; <input
												type="radio" name="gender" value="女" checked="checked" />女
										</s:if>
									</td>
								</tr>
								<tr>
									<td height="40" align="right"><font color="red">*</font>生日：</td>
									<td>&nbsp; <script language="javascript"
											type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>
										<input class="Wdate" name="newbirthday" type="text" id="d15"
										value="<s:property value="%{getText('{0,date,yyyy-MM-dd }',{#userinfo.birthday})}"/>"
										onclick="WdatePicker({isShowClear:false,readOnly:true})" />
								</tr>
								<tr>
									<td height="40" align="right">您的地址：</td>
									<td>&nbsp;<input type="text" id="address" name="address"
										value="<s:property value="#userinfo.address"/>"
										class="ss_input" style="width:600px;" /></td>
								</tr>

								<tr>
									<td height="50">&nbsp;</td>
									<td>
										<input type="button" value="提交" onclick="checkJvForm();"
										class="ss_button" /> &nbsp; <input type="reset" value="重置"
										class="no_button" />
								</tr>
							</table>
						</form>
					</div>
				</div>
			</div>
		</div>

	</div>
</div>
<jsp:include page="bottom.jsp"></jsp:include>