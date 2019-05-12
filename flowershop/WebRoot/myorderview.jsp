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
		
        
        
        <div id="container" class="user_main">
            <div class="content-one content-hei">
            	<div class="user_title">订单详情</div> 
                <div class="order_conhead">
                    <ul>
                        <li>订单编号：<span class="red"><s:property value="#orderinfo.id"/></span></li>
                        <li>下单日期：<span class="red"><s:property value="%{getText('{0,date,yyyy-MM-dd HH:mm:ss}',{#orderinfo.createtime})}"/></span></li>
                        <li>订单状态：
                        	<span class="red">
							<s:if test="#orderinfo.status==0">等待支付</s:if>
							<s:if test="#orderinfo.status==1">等待收货</s:if>
							<s:if test="#orderinfo.status==2">已完成</s:if>
							<s:if test="#orderinfo.status==3">已取消</s:if>
							</span>
                        </li>
                    </ul>
                </div>
                <div class="clear"></div>
                <div class="order_continf">
                    <dl>
	                    <dt>收货人信息</dt>
	                    <dd>收货人：<s:property value="#orderinfo.address.name"/></dd>
	                    <dd>收货地址：<s:property value="#orderinfo.address.address"/></dd>
	                    <dd>手机号码：<s:property value="#orderinfo.address.phone"/></dd>
	                    <dd>邮政编码：<s:property value="#orderinfo.address.postalcode"/></dd>
                    </dl>
                    
                    <dl>
	                    <dt>配送信息</dt>
	                    <dd>运费：¥0</dd>
	                    <dd>送货方式：<s:property value="#orderinfo.express"/></dd>
                    </dl>
                
                    <dl>
	                    <dt>支付信息</dt>
	                    <dd>支付状态：
	                    	<s:if test="#orderinfo.status==0">等待支付</s:if>
							<s:if test="#orderinfo.status==1">等待收货</s:if>
							<s:if test="#orderinfo.status==2">已完成</s:if>
							<s:if test="#orderinfo.status==3">已取消</s:if></dd>
                    	<dd>支付方式：<s:property value="#orderinfo.pay"/></dd>
                    </dl>
                    
                    <div class="order_info_list pt20">
                   	  <h3>商品信息</h3>
                        <table width="100%" border="0" cellpadding="3" cellspacing="0" class="product_table">
                        <tbody>
                        <tr>
                        	<th width="100" bgcolor="#f0f0f0"></th>
                        	<th height="40" bgcolor="#f0f0f0">商品名称</th>
                        	<th width="120" bgcolor="#f0f0f0">价格</th>
                        	<th width="120" bgcolor="#f0f0f0">数量</th>
                        	<th width="120" bgcolor="#f0f0f0">金额小计</th>
                        </tr>
                        <s:iterator value="#orderinfo.cart" var="cart">
                        <tr>
                        <td height="110" align="center" class="line_bottom line_left">
	                        <a href="${pageContext.request.contextPath}/product_findById.action?id=<s:property value="#cart.product.id"/>" target="_blank">
	                        <img src="<s:property value="#cart.product.images.iterator().next().url"/>" width="90" height="90">
	                        </a>
                        </td>
                        <td class="line_bottom" align="left">
                        	<a target="_blank" href="${pageContext.request.contextPath}/product_findById.action?id=<s:property value="#cart.product.id"/>">
								<s:property value="#cart.product.pname"/>
							</a>
                        </td>
                        <td align="left" class="line_bottom">¥<s:property value="#cart.product.newPrice"/></td>
                        <td align="left" class="line_bottom"><s:property value="#cart.number"/></td>
                        <td align="left" class="line_bottom line_right">
                        	¥ <s:property value="#cart.number*#cart.product.newPrice"/>
                        </td>
                        </tr>
                        </s:iterator>
                        </tbody>
                       </table>
                    </div>
                </div>
            </div>
        </div>
        
        
	</div>
</div>
<jsp:include page="bottom.jsp"></jsp:include>