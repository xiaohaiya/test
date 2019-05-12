<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>查看购物车</title>
    <script src="js/jquery.js"></script>

    <link rel="stylesheet" href="css/index.css">
    <link rel="stylesheet" href="css/buy.css">
    <link rel="stylesheet" href="css/cart.css">
   </head>
<body>
<div class="w">
    <div id="topcolumn"></div>
    <div class="weizhi">您当前的位置：<a href="${pageContext.request.contextPath }" target="_blank">首页</a> &gt; 我的购物车</div>
    <ul class="step clearfix">
        <li class="on"><span>STEP 1.</span>查看购物车</li>
        <li><span>STEP 2.</span>确认订单信息</li>
        <li><span>STEP 3.</span>成功提交订单</li>
    </ul>
    <div class="gray-box pro-li">
          <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="list">
          <tr> 
              <th width="100">商品列表</th>
              <th width="345">商品名称</th> 
              <th width="108">单价</th>
              <th width="139">数 量</th>
              <th width="172">商品合计</th> 
              <th width="70">操 作</th> 
           </tr> 
           <s:iterator value="#carttList" var="cart">
               <tr class="select" id="cart_list_<s:property value="#cart.id" />"> 
                <td>
                	 <a class="img60" href="${pageContext.request.contextPath }/product_findById.action?id=<s:property value="#cart.product.id" />" target="_blank">
                      <img src="<s:property value="#cart.product.images.iterator().next().url" />" width="60" height="60"></a>
               </td> 
              <td class="tl">
                 <h3>
                    <a href="${pageContext.request.contextPath }/product_findById.action?id=<s:property value="#cart.product.id" />" target="_blank">
                     	<s:property value="#cart.product.pname" />
                    </a> 
                 </h3>
             </td>
              <td> 
                 <del>￥<span><s:property value="#cart.product.oldPrice" /></span></del><br>
                 <strong class="red">￥<span id="cartprice_<s:property value="#cart.id" />"><s:property value="#cart.product.newPrice" /></span></strong>
              </td> 
              <td>
	                <input class="btn-reduce-active" id="hgshu" type="button" onclick="decrement(this,<s:property value="#cart.id" />);">
	                <input id="cartnumber_<s:property value="#cart.id" />" name="itemNumBox" type="text" value="<s:property value="#cart.number" />" readonly="readonly" class="num">
	                 <input class="btn-plus" type="button" onclick="increment(this,<s:property value="#cart.id" />);"> 
             </td>
          
            <td> 
                <strong class="red">
                	￥<span class="pricetotal" id="carttotal_<s:property value="#cart.id" />"><s:property value="#cart.product.newPrice*#cart.number" /></span>
                	<span class="oldprice" style="display:none;"><s:property value="#cart.product.oldPrice*#cart.number" /></span>
                </strong>
            </td>
            <td class="last_td"> 
                  <span> 
                    <a href="javascript:void(0)" class="deleteButton" onclick="ajaxDeleteCartItem(this,<s:property value="#cart.id" />);"  style="color:#656565;">删除</a>
                  </span> 
            </td> 
          </tr>
          </s:iterator>
        </table>
        <p class="subtotal">
            <span class="fl">共节省：<span id="items_spare">0</span>元 </span>
            <strong class="darkgray">商品金额：</strong>
            <strong class="red f16 yh">&nbsp;<span id="items_sale"></span></strong>&nbsp;元
        </p>
    </div>
    <div>
        <div class="fix_btm_bar clearfix">
            <div class="fr">
                <strong> 商品总价（未包含运费）： <span class="red" id="total_price_bottom"></span>元 </strong>
                <button id="nextstep" class="ctn_shopping" onclick="continueShopping();">继续购物</button>
                <input type="button" id="confirmToPay" class="settlement" onclick="checksubmit();" value="确认结账 ">
            </div>
            <div class="selectbox_btm">
                <a href="javascript:void(0);" onclick="ajaxEmpty();" class="ablue">清空购物车</a>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
/* 购物车中数量价格算法 */
$(function() {
	addtotal();
});
var totalpricce = 0;
function decrement(object,id){
	var num = $(object).next().val();
	if(num>1){
		var total = ($("#carttotal_"+id).text()/num)*(num-1);
		var youhui = ($("#carttotal_"+id).next().text()/num)*(num-1);
		num--;
		$.post("cart_addCart.action", {
			'number' : num,
			'id':id
		}, function(data) {
			if(data.result){
				$(object).next().val(num);
				$("#carttotal_"+id).text(total.toFixed(2));
				$("#carttotal_"+id).next().text(youhui.toFixed(2));
				addtotal();
			}
		},'json');
	}
}
function increment(object,id){
	var num = $(object).prev().val();
	if(num<100){
		num++;
		var total = ($("#carttotal_"+id).text()/(num-1))*num;
		var youhui = ($("#carttotal_"+id).next().text()/(num-1))*num;
		
		$.post("cart_addCart.action", {
			'number' : num,
			'id':id
		}, function(data) {
			if(data.result){
				$(object).prev().val(num);
				$("#carttotal_"+id).text(total.toFixed(2));
				$("#carttotal_"+id).next().text(youhui.toFixed(2));
				addtotal();
			}
		},'json');
	}
}
function addtotal(){
	var total =0;
	var youhui = 0;
	for(var i=0;i<$(".pricetotal").length;i++){
		total = total + parseFloat($(".pricetotal").eq(i).text());
		youhui = youhui + parseFloat($(".oldprice").eq(i).text());
	}
	youhui = youhui-total;
	$("#total_price_bottom").text(total.toFixed(2));
	$("#items_sale").text(total.toFixed(2));
	$("#items_spare").text(youhui.toFixed(2));
}
function ajaxDeleteCartItem(object,id) {
	$.ajax({
		url:"${pageContext.request.contextPath }/cart_deleteCart.action",
		type:"post",
		data:"id="+id,
		success:function(data){
			if(data=="success"){
				$(object).parents("tr").remove();
				addtotal();
			}else{
				alert("删除失败！");
			}
		}

	 });
}
function continueShopping() {
	window.open("${pageContext.request.contextPath }");
}
function checksubmit() {
	$.ajax({
		url:"${pageContext.request.contextPath }/cart_existcart.action",
		type:"post",
		success:function(data){
			if(data=="true"){
				window.location.href="${pageContext.request.contextPath }/cart_findCart.action";
			}else{
				alert("您还没有加购商品，请先加购商品。");
				window.open("${pageContext.request.contextPath }");
			}
		}

	 });
}
</script>
</body></html>