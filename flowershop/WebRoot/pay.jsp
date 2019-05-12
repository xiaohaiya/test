<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>支付订单</title>
    <script src="js/jquery.js"></script>

    <link rel="stylesheet" href="css/index.css">
    <link rel="stylesheet" href="css/buy.css">
    <link rel="stylesheet" href="css/cart.css">
</head>
<body>
<div class="w">
    <div id="topcolumn"></div>
    <div class="weizhi">您当前的位置：<a href="/" target="_blank">首页</a> > 成功提交订单</div>
    <ul class="step clearfix mt10">
        <li><span>STEP 1.</span>查看购物车</li>
        <li><span>STEP 2.</span>确认订单信息</li>
        <li class="three"><span>STEP 3.</span>成功提交订单</li>
    </ul>

    <div style="padding:10px; border:1px solid #ddd; margin:20px auto;">
        <div style="text-align:center; line-height:50px; color:#F00;">您的订单已提交成功，正在等待您的付款！

            请您在提交订单后<span style="color:red">24小时</span>内完成支付，否则订单会自动取消。
        </div>
        <table width="100%" border="0" cellpadding="3" cellspacing="0">
            <tr>
                <th height="40" colspan="4" bgcolor="#f0f0f0">订单信息</th>
            </tr>
            <tr>
                <td width="200" height="50" align="right">订单编号：</td>
                <td width="340">
                    <strong><s:property value="#order.id"/></strong>
                    <a href="${pageContext.request.contextPath }/order_orderinfo.action?id=<s:property value="#order.id" />">[查看订单]</a>
                </td>
                <td width="200" align="right">应付金额：</td>
                <td>
                    <strong id="amountPayable">￥<s:property value="#order.total"/>元</strong>
                </td>
            </tr>
            <tr>
                <td height="50" align="right">配送方式：</td>
                <td><s:property value="#order.express"/></td>
                <td align="right">支付方式：</td>
                <td><s:property value="#order.pay"/></td>
            </tr>

            <tr>
                <td height="30" colspan="4" align="center"></td>
            </tr>



        </table>
        <form id="jvForm" action="${pageContext.request.contextPath }/order_orderpay.action" method="post" target="_parent">
            <table width="100%" border="0" cellpadding="3" cellspacing="0" class="paymentPlugin">
                <tr>
                    <th height="40" align="center" bgcolor="#f0f0f0" colspan="2">支付方式</th>
                </tr>
                <tr>
                    <td align="center">

                        <input type="radio" name="code" value="alipay" checked/>
                        <label>
                            <img src="images/zfb.jpg" alt="支付宝即时交易" style="width:135px;"/>&nbsp;支付宝支付
                        </label>

                    </td>
                    <td align="center">

                        <input type="radio" name="code" value="yinlian" />
                        <label>
                            <img src="images/yl.jpg" alt="微信扫码支付" style="width:135px;"/>&nbsp;银联支付
						</label>

                    </td>
                </tr>
            </table>
            <div style="height:50px; text-align:center;">
                <input type="hidden" name="id" value="<s:property value="#order.id"/>" />
                <input type="submit" class="paymentButton" value="立即支付" />
            </div>
        </form>

    </div>
</div>
</body>
</html>