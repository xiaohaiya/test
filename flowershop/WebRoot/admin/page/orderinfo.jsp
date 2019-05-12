<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>心雨花屋</title>
        <link href="${pageContext.request.contextPath }/css/base.css" rel="stylesheet" type="text/css" />
    <link rel="SHORTCUT ICON" href="${pageContext.request.contextPath }/admin/images/logo.ico">
    <link rel="BOOKMARK" href="${pageContext.request.contextPath }/admin/images/logo.ico">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/admin/css/style.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/admin/css/jquery.wysiwyg.old-school.css">
	<script type="text/javascript" src="${pageContext.request.contextPath }/admin/js/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/admin/js/jquery-ui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/admin/js/min.js" charset="UTF-8"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/admin/js/main.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/admin/css/style2.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/member.css">
</head>
<body>
<div id="content" class="white">
    <h1><img src="../images/posts.png" alt="">订单详情</h1>
    <div class="bloc">
    	<div id="container">
            <div class="content-one content-hei">
            	<div class="user_title">订单详情<a href="${pageContext.request.contextPath }/admin_OutExcel.action?order.id=<s:property value="#orderinfo.id"/>">打印订单</a>
            		<span style="float:right; font-size:12px;"> 
	                	<a  href="javascript:void(0);" onClick="javascript :history.back(-1);" class="no_button">返回</a>
					</span>
            	</div> 
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
	                    <dd>备注：<s:property value="#orderinfo.conmment"/></dd>
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
                        <tr style="line-height: 40px;">
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
<br>
<div id="ui-datepicker-div" class="ui-datepicker ui-widget ui-widget-content ui-helper-clearfix ui-corner-all"></div>
<br>
</body></html>