<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<jsp:include page="head.jsp"></jsp:include>
<script type="text/javascript" src="js/jquery_jiaoyan.js"></script>
<script type="text/javascript">
	$(function() {
		$("#jvForm").validate();
	});
	function checkJvForm(){
		var password=$("#password").val();
		var repassword=$("#repassword").val();
		if(password==null||password==""){
			$("#paswd").html("请输入新密码！");
			return;
		}else if(password!=repassword) {
			message = "两次输入的密码不一致，请重新输入";
			$("#paswd").html("");
			$("#repaswd").html(message);
			return;
		}else{
			$("#paswd").html("");
			$("#repaswd").html("");
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
					修改密码 
				</div>
				<div class="mc_content">
					<div id="infotab" class="dis">
						<form id="jvForm" action="user_updatepaswd.action" method="post">
							<table width="98%" border="0" align="center" cellpadding="3"
								cellspacing="0">
								<tr>
									<td height="40" width="250" align="right">新密码：</td>
									<td>&nbsp;<input type="password" id="password" name="password"
										class="ss_input required" /> <font color="red">
											<span id="paswd"></span>
									</font>
									</td>
								</tr>
								<tr>
									<td height="40" width="250" align="right">确认密码：</td>
									<td>&nbsp;<input type="password" id="repassword" name="repassword"
										class="ss_input required" /> <font color="red">
											<span id="repaswd"></span>
									</font>
									
									</td>
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