<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>提交订单</title>
    <script src="js/jquery.js"></script>

    <link rel="stylesheet" href="css/index.css">
    <link rel="stylesheet" href="css/buy.css">
    <link rel="stylesheet" href="css/cart.css">
    <link rel="stylesheet" href="css/checkout.css">
</head>
<body style="background:#fff;">
<s:if test="#request.addrList.size()<1">
<script type="text/javascript">
alert("您还没有添加收货地址，请先添加收货地址！");
window.parent.location.href='${pageContext.request.contextPath }/user_findaddr.action';
</script>
</s:if>
<div class="w" >
    <div id="topcolumn"></div>
    <div class="weizhi">您当前的位置：<a href="${pageContext.request.contextPath }" target="_blank">首页</a> &gt; 确认订单信息</div>
    <ul class="step clearfix">
        <li><span>STEP 1.</span>查看购物车</li>
        <li class="three"><span>STEP 2.</span>确认订单信息</li>
        <li><span>STEP 3.</span>成功提交订单</li>
    </ul>

    <div id="checkoutUI">
        <div id="errorMsgDisplayDiv" style="z-index:1000;"></div>
        <form id="jvForm" action="${pageContext.request.contextPath }/order_save.action" method="post" target="_parent">
            <div id="receiver_buffer_window" class="delivery mb10">
                <div class="title"><h2>收货人信息</h2> </div>

                <div id="inputUI_rece" class="rece_box">
                    <p id="btn_away_ui">&nbsp;</p>
                    <div class="x_address">
                        <label class="pointer">

                            <div style="border-bottom:1px solid #ddd; overflow:hidden; padding:10px 10px 0px 10px;">
                                <table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" bgcolor="#ddd" style="margin:auto;">
                                    <tbody><tr>
                                        <td width="100" height="30" align="center" bgcolor="#f9f9f9">&nbsp;</td>
                                        <td height="30" width="100" align="center" bgcolor="#f9f9f9">收货人</td>
			                            <td height="30" width="100" align="center" bgcolor="#f9f9f9">性别</td>
			                            <td height="30" align="center" bgcolor="#f9f9f9">详细地址</td>
			                            <td height="30" width="350" align="center" bgcolor="#f9f9f9">手机号码</td>
			                            <td width="200" height="30" align="center" bgcolor="#f9f9f9">邮编</td>
                                    </tr>
                                    <s:iterator value="#request.addrList" var="addr">
                                    <tr>
                                        <td height="50" align="center" bgcolor="#FFFFFF">
                                        	<s:if test="#addr.status==1">
                                            <input type="radio" name="address.id" class="delivery_info" value="<s:property value="#addr.id"/>" checked="checked">
                                        	</s:if>
                                        	<s:if test="#addr.status==0">
                                            <input type="radio" name="address.id" class="delivery_info" value="<s:property value="#addr.id"/>">
                                        	</s:if>
                                        </td>
			                            <td height="30" align="center" bgcolor="#FFFFFF"><s:property value="#addr.name" /> </td>
			                            <td align="center" bgcolor="#FFFFFF"><s:property value="#addr.gender" /></td>
			                            <td align="center" bgcolor="#FFFFFF"><s:property value="#addr.address" /></td>
			                            <td align="center" bgcolor="#FFFFFF"><s:property value="#addr.phone" /></td>
			                            <td align="center" bgcolor="#FFFFFF"><s:property value="#addr.postalcode" /></td>
                                    </tr>
				                    </s:iterator>
                                    </tbody></table>

                            </div>
                        </label>
                        <div class="clear"></div>

                    </div>
                    <hr class="delivery_hr">
                </div>
            </div>
            <div id="payment_buffer_window" class="delivery mb10">
                <div class="title"> <h2>支付方式</h2></div>
                <div class="delivery_box" id="paymentMethod">
                    <p id="pNet" class="radio_select">
                        <input type="radio" id="paymentMethod_1" name="pay" value="网上支付" checked="true">
                        <label>网上支付</label>
                        <span class="des"> 支持支付宝、财付通、以及大多数网上银行支付</span>
                    </p>
                    <p id="pNet" class="radio_select">
                        <input type="radio" id="paymentMethod_2" name="pay" value="银行汇款">
                        <label>银行汇款</label>
                        <span class="des"> 支持工行、建行、农行汇款支付，收款时间一般为汇款后的1-2个工作日</span>
                    </p>
                    <p id="pNet" class="radio_select">
                        <input type="radio" id="paymentMethod_3" name="pay" value="货到付款">
                        <label>货到付款</label>
                        <span class="des"> 由快递公司送货上门，您签收后直接将货款交付给快递员</span>
                    </p>
                </div>
            </div>
            <div id="delivery_buffer_window" class="delivery mb10">
                <div class="title"><h2>配送信息</h2></div>
                <div class="delivery_box" id="inputUI_delivery">

                    <table width="100%" border="0" cellpadding="3" cellspacing="0">
                        <tbody><tr class="head">
                            <td width="70" height="40"></td>
                            <td>商品名称</td>
                            <td width="150" align="center">数　量</td>
                            <td width="150" align="center">单价</td>
                            <td width="150" align="center">金额小计</td>
                            <td width="150"><span style="padding-left:30px;">配送方式</span></td>
                        </tr>
                        <s:iterator value="#request.cartList" var="cart" status="status">
                        <tr class="body">
                            <td width="70"><a class="img60" href="${pageContext.request.contextPath }/product_findById.action?id=<s:property value="#cart.product.id" />" target="_blank">
                                <img src="<s:property value="#cart.product.images.iterator().next().url" />" width="60" height="60"></a></td>
                            <td>
                                <a href="${pageContext.request.contextPath }/product_findById.action?id=<s:property value="#cart.product.id" />" title="<s:property value="#cart.product.pname" />" class="a2" target="_blank">
                                <s:property value="#cart.product.pname" />
                                </a>
                            </td>
                            <td align="center"><span><s:property value="#cart.number" /></span></td>
                            <td align="center">¥<span><s:property value="#cart.product.newPrice" /></span></td>
                            <td align="center" style="border-right:1px solid #ddd;">¥<span class="itemcountprice"><s:property value="#cart.product.newPrice*#cart.number" /></span></td>
                            <s:if test="#status.first">
                            <td rowspan="<s:property value="#request.cartList.size()" />" align="center">
                                <div id="shippingMethod" style="position:relative;zoom:1;float:left;width:100%;">
                                    <div style="height: 43px;position: relative;z-index: 0;width: 100%;">
                                        <input type="radio" name="express" class="delivery_radio" checked="" value="普通快递">
                                        <label style="line-height: 43px;margin-right: 45px;">普通快递</label>
                                    </div>
                                    <div style="height: 43px;position: relative;z-index: 0;width: 100%;">
                                        <input type="radio"  name="express" class="delivery_radio" value="顺丰快递">
                                        <label style="line-height: 43px;margin-right: 45px;">顺丰快递</label>
                                    </div>
                                </div>
                            </td>
                            </s:if>
                        </tr>
                        </s:iterator>
                        </tbody></table>

                </div>
            </div>





            <div id="delivery_buffer_window" class="delivery mb10" style="overflow:hidden">
                <div class="title"><h2>结算信息</h2></div>
                <div class="delivery_box" id="inputUI_delivery">
                    <ul>
                        <li>
                        	<span class="bold">商品金额：￥
                        		<strong><span id="cart_price">0</span></strong>元
							</span>
							&nbsp;+ 运费：￥<strong id="totalDeliveryFee">0</strong>元
						</li>
                        <li>
                            <div style="border:none!important;font-size:14px;float:right">
                                <span class="bold">
                                	应付金额:
                                	<strong>
                                		<span style="font-size:14px;color:#a71f24;font-weight:bold" id="amount_payable">0</span>
                                		<input type="text" hidden="hidden" name="total">
                                	</strong>
                                	元
                                </span>
                            </div>
                        </li>
                    </ul>
                    <div style="clear:both; margin-top:10px; overflow:hidden;">
                        <div style="float:left; line-height:28px;">
                            <input type="checkbox" id="remark_chk" onclick="showRemark(this)">订单备注
                            <input type="text" name="conmment" id="remark" style="display:none;" class="ss_input">
                        </div>
                        <div class="btn">
                            <input type="submit" id="confirm_delivery" value="提交订单" onclick="checkSubmit1();" style="float:right;">
                        </div>
                    </div>
                </div>
            </div>


            <div class="delivery_box" id="inputUI_delivery">
                <p class="btn">&nbsp;</p>
            </div>
        </form>
    </div>
</div>
<script type="text/javascript">
	$(function () {
		aaa();
	});
	function aaa() {
		var total=0;
		for(var i = 0;i<$(".itemcountprice").length;i++){
			total = total + parseInt($(".itemcountprice").eq(i).text());
		}
		$("#cart_price").text(total.toFixed(2));
		$("#amount_payable").text(total.toFixed(2));
		$("#amount_payable").next().val(total.toFixed(2));
	};
	function showRemark(chk){
		if(chk.checked){
			$("#remark").fadeIn("500");
		}else{
			$("#remark").fadeOut("500");
		}
	}
</script>
</body></html>