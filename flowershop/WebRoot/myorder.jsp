<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<jsp:include page="head.jsp"></jsp:include>
<script type="text/javascript" src="js/jquery_jiaoyan.js"></script>
<script type="text/javascript">
	function displayed(i) {
		$("#ul" + i).toggle();
		if ($("#ss" + i).attr("class") == "user_ss") {
			$("#ss" + i).attr("class", "user_tt");
		} else {
			$("#ss" + i).attr("class", "user_ss");
		}
	}
	function checkType(status){
	     $("#status").attr("value",status);
	     $("#jvForm").submit();
	  }
	//支付
	function paybutton(orderid) {
		window.location.href="${pageContext.request.contextPath }/order_payment.action?id="+orderid;
	}
	//取消订单
	function cancel(orderid) {
		window.location.href="${pageContext.request.contextPath }/order_cancle.action?id="+orderid;
	}
	//确认收货
	function receipt(orderid) {
		window.location.href="${pageContext.request.contextPath }/order_receipt.action?id="+orderid;
	}
	//退货
	function tuihuo(orderid) {
		window.location.href="${pageContext.request.contextPath }/order_tuihuo.action?id="+orderid;
	}
</script>

<s:if test='#ordermessage!=null'>
<script type="text/javascript">
alert("<s:property value='#ordermessage'/>");
</script>
</s:if>
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
		<div id="container" class="user_main">
            <div class="content-one content-hei">
                <div class="user_title">我的订单</div>
                <form id="jvForm" action="${pageContext.request.contextPath }/order_myorder.action" method="post">
					<input type="hidden" id="status" name="status" value="">
					<div class="columnright">
						<div id="myOrderList" class="tab_tb">
							<div class="odrTab clearfix">
								<ul class="ul_select odrTabUl mb10">
									<li <s:if test="status==10">class="first"</s:if> onclick="checkType(10);">全部</li>
									<li <s:if test="status==0">class="first"</s:if> onclick="checkType(0);">待支付</li>
									<li <s:if test="status==1">class="first"</s:if> onclick="checkType(1);">待收货</li>
									<li <s:if test="status==2">class="first"</s:if> onclick="checkType(2);">已完成订单</li>
									<li <s:if test="status==3">class="first"</s:if> onclick="checkType(3);">已取消</li>
									<li <s:if test="status==5">class="first"</s:if> onclick="checkType(5);">等待退货审核</li>
								</ul>
							</div>

						</div>
					</div>
				</form>
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
	                <tbody>
					<s:iterator value="list" var="order" status="statusorder">
	                <s:if test="#statusorder.first">
		                <tr> 
		                <td width="10" align="center" bgcolor="#f5f5f5" class="line_top line_bottom line_left">&nbsp;</td>    
		                <td height="40" colspan="2" align="center" bgcolor="#f5f5f5" class="line_top line_bottom">商品名称</td>
		                <td width="100" align="center" bgcolor="#f5f5f5" class="line_top line_bottom">单价（元）</td>
		                <td width="70" align="center" bgcolor="#f5f5f5" class="line_top line_bottom">数量</td>
		                <td width="100" align="center" bgcolor="#f5f5f5" class="line_top line_bottom">实付款（元）</td>
		                <td width="100" align="center" bgcolor="#f5f5f5" class="line_top line_bottom">支付方式</td>
		                <td width="100" align="center" bgcolor="#f5f5f5" class="line_top line_bottom">交易状态</td>
		                <td width="120" align="center" bgcolor="#f5f5f5" class="line_top line_bottom line_right">交易操作</td>
		                </tr>
					</s:if>
						<!-- 订单迭代开始 -->
						<tr>
							<td height="34" colspan="9" class="djBg">
								<table width="100%" border="0" align="center" cellpadding="0"
									cellspacing="0" style="margin-top:10px;">
									<tbody>
										<tr>
											<td height="40" bgcolor="#f1f1f1" class="line_bottom">
												&nbsp;&nbsp;订单编号：
												<a href="${pageContext.request.contextPath }/order_orderinfo.action?id=<s:property value="#order.id" />" target="_blank" style="color:#ff0000;">
												<s:property value="#order.id" />
												</a>
											</td>
											<td bgcolor="#f1f1f1" class="line_bottom">
												订单时间：<s:property value="%{getText('{0,date,yyyy-MM-dd HH:mm:ss}',{#order.createtime})}"/>
											</td>
											<td width="120" align="center" bgcolor="#f1f1f1" class="line_bottom">
											<a href="${pageContext.request.contextPath }/order_orderinfo.action?id=<s:property value="#order.id" />" target="_blank" style="color:#ff0000;">订单详情</a>
											</td>
										</tr>
									</tbody>
								</table>
							</td>
						</tr>
						<s:iterator value="#order.cart" var="cart" status="statuscart">
						<tr>
							<td height="40" align="center" class="line_left line_bottom">&nbsp;</td>

							<td height="70" width="100" align="center" class="line_bottom">
								<a target="_blank" href="${pageContext.request.contextPath}/product_findById.action?id=<s:property value="#cart.product.id"/>">
									<img src="<s:property value="#cart.product.images.iterator().next().url"/>" height="50" width="50">
								</a>
							</td>

							<td class="line_bottom">
								<a target="_blank" href="${pageContext.request.contextPath}/product_findById.action?id=<s:property value="#cart.product.id"/>" style="color:#000;">
									<s:property value="#cart.product.pname"/>
								</a>
							</td>

							<td width="75" align="center" class="line_bottom">
								<!-- 单价 -->¥ <s:property value="#cart.product.newPrice"/><!-- 单价 -->
							</td>

							<td align="center" class="line_bottom">
								<!-- 数量 --><s:property value="#cart.number"/><!-- 数量 -->
							</td>

							<td align="center" class="line_bottom" style="border-right: 1px  rgb(221, 221, 221) solid;">
								<!-- 实付款 --> ¥ <s:property value="#cart.number*#cart.product.newPrice"/> <!-- 实付款 -->
							</td>
							<s:if test="#statuscart.first">
							<td rowspan="<s:property value="#order.cart.size()"/>" align="center" style="vertical-align: middle;" class="line_bottom rest-cell ">
								<!-- 支付方式 --><s:property value="#order.pay"/><!-- 支付方式 -->
							</td>

							<td rowspan="<s:property value="#order.cart.size()"/>" align="center" style="vertical-align: middle;" class="line_bottom rest-cell ">
								<!-- 交易状态 -->
								<s:if test="#order.status==0">等待支付</s:if>
								<s:if test="#order.status==1">等待收货</s:if>
								<s:if test="#order.status==2">已完成</s:if>
								<s:if test="#order.status==3">已取消</s:if>
								<s:if test="#order.status==4">已退货</s:if>
								<s:if test="#order.status==5">等待商家退货审核</s:if>
								
								<!-- 交易状态 -->
							</td>

							<td rowspan="<s:property value="#order.cart.size()"/>" align="center" style="vertical-align: middle;" class="line_right line_bottom rest-cell ">
								<s:if test="#order.status==0">
								<button class="ss_button" onclick='paybutton("<s:property value="#order.id" />")'>立即支付</button>
								<button class="textbutton w100" onclick='cancel("<s:property value="#order.id" />")'>取消订单</button>
								</s:if>
								<s:if test="#order.status==1">
								<button class="ss_button" onclick='receipt("<s:property value="#order.id" />")'>确认收货</button>
								<button class="textbutton w100" onclick='tuihuo("<s:property value="#order.id" />")'>申请退货</button>
								</s:if>
								<s:if test="#order.status==2">
								<button class="textbutton w100" onclick='tuihuo("<s:property value="#order.id" />")'>申请退货</button>
								</s:if>
							</td>
							</s:if>
						</tr>
						</s:iterator>
						</s:iterator>
						<!-- 订单迭结束 -->
						<!-- 分页开始 -->
						<tr>
							<td colspan="9" align="center" height="50">
							<div class="scott">
								&nbsp;
								<s:if test="currPage==1"><a>上一页</a></s:if>
								<s:else><a href="${pageContext.request.contextPath }/order_myorder.action?currPage=${currPage-1}&status=<s:property value="status" />">上一页</a></s:else>
								
								<s:iterator value="new int[totalPage]" status="page">
									<s:if test="currPage==#page.index+1">
										<span class="current">${currPage}</span>
									</s:if>
									<s:else>
									<a href="${pageContext.request.contextPath }/order_myorder.action?currPage=<s:property value="#page.index+1" />&status=<s:property value="status" />"><s:property value="#page.index+1" /></a>
									</s:else>
								
								</s:iterator>
								<s:if test='currPage==totalPage||totalPage==""'>
									<a>后一页</a>
								</s:if>
								<s:else>
									<a href="${pageContext.request.contextPath }/order_myorder.action?currPage=${currPage+1}&status=<s:property value="status" />">下一页</a>
								</s:else>
							</div>
							</td>
						</tr>
						<!-- 分页结束 -->
					</tbody>
                </table>
            </div>
        </div>
	</div>
</div>
<jsp:include page="bottom.jsp"></jsp:include>