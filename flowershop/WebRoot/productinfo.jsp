<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<jsp:include page="head.jsp"></jsp:include>
    <script type="text/javascript" src="js/base.js"></script>
    <div style="width: 1400px; margin: auto; margin-top: 25px; min-height: 1450px;">
        <div style="width: 350px; height: 1460px; float: left;">
            <div style="background-color: red; width: 270px; height: 30px; margin: auto; line-height: 30px; font-size: 15px;
             font-weight:bold; color: white; text-align: center; margin-bottom: 5px">
                热&nbsp;&nbsp;卖&nbsp;&nbsp;推&nbsp;&nbsp;荐
            </div>
            <div class="row" style="width: 300px; margin: auto;"><!-- 将要加入的略缩图放入row中 -->
				<s:iterator value="#request.list" var="pro">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12"><!-- 大屏幕放3张略缩图，pc端放4张，平板和手机放6张-->
                    <div class="thumbnail" style="padding: 0px;">
                        <a href="${pageContext.request.contextPath}/product_findById.action?id=<s:property value="#pro.id"/>"><img src="<s:property value="#pro.images.iterator().next().url"/>" alt="<s:property value="#pro.pname"/>"  class="img-responsive"></a>
                        <div class="caption" style="padding: 9px 0px 0px 0px;">
                            <p><a href="${pageContext.request.contextPath}/product_findById.action?id=<s:property value="#pro.id"/>"><s:property value="#pro.pname"/></a></p>
                            <p>价格：¥<s:property value="#pro.newPrice"/></p>
                        </div>
                    </div>
                </div>
                </s:iterator>
                
            </div>

        </div>
			<div
				style="width: 1050px; min-height: 1380px; float: left; border: 1px solid #CCCCCC;">
				<s:if test="#request.product==null">
				您查询的商品不存在！
				</s:if>
				<s:if test="#request.product!=null">
					<div class="appTitle">
						<h2>产品详情</h2>
					</div>
					<div class="right-extra" style="margin-top: 15px;">
						<!--产品参数开始-->
						<div>
							<div id="preview" class="spec-preview" style="width: 1050px;">
								<span class="jqzoom"><img jqimg="<s:property value="#request.product.images.iterator().next().url" />"
								 src="<s:property value="#request.product.images.iterator().next().url" />" width="350px" height="350px" />
								</span>
								<form action="cart_findAllCart.action" method="post">
									<span class="jqzoom" style="width: 650px; height: 350px; padding-left: 50px;">
									<p
										style="font-size: 22px; color: #434343; font-family: 'Microsoft YaHei'; line-height: 50px;"><s:property value="#request.product.pname"/> </p>
									<hr
										style="border-style:dashed; border-color: #d9d9d9; margin: 0px;">
									<p
										style="font-size: 13px; color: #434343; font-family: 'Microsoft YaHei'; line-height: 26px;"><s:property value="#request.product.pdetail"/></p>
									<p
										style="font-size: 16px; color: #ff0000; font-family: 'Microsoft YaHei'; line-height: 26px;">
										今日特惠：<font size="5">¥<s:property value="#request.product.newPrice"/> </font>
									</p>
									<p
										style="font-size: 13px; color: #cccccc; font-family: 'Microsoft YaHei'; line-height: 26px;">
										商品原价： <span style="text-decoration: line-through;">¥<s:property value="#request.product.oldPrice"/></span>
									</p>
									<hr />
									<div style="width: 500px; height: 40px;">
									<p style="display:block; font-size: 16px; color:#7d7d7d; font-family: 'Microsoft YaHei'; line-height: 26px;">
										<span style="display:block; float:left; ">我要订购：</span>
										<a class="addnumber">-</a>
										<input name="number" readonly="readonly" type="text" value="1" style="float: left; width: 45px; height: 30px;     border: #eeeeee 1px solid; text-align: center; color: #7d7d7d;">
										<a class="deletenumber">+</a>
									</p>
									<script type="text/javascript">
									$(function(){
										$(".addnumber").click(function(){
											var num = $(this).next().val();
											if(num>1){
												num--;
											}
											$(this).next().val(num);
										});
										$(".deletenumber").click(function(){
											var num = $(this).prev().val();
											if(num<=100){
												num++;
											}
											$(this).prev().val(num);
										});
									});
									function addcart() {
										if(<s:property value='#session.existUser==null'/>){
											alert("您还没有登录，请先登录！");
											window.location.href = "user_login.action";
										}else{
											var d = {};
											var t = $('form').serializeArray();
											$.each(t, function() {
												var name = this.name.replace(".","");
										    	d[name] = this.value;
										    });
											var comment = JSON.stringify(d);
											$.ajax({  
										          type : "post",  
										          url : "${pageContext.request.contextPath }/cart_ajaxadd.action",
										          data: d,
										          async : true,
										          dataType: "json",
										          success : function(data){
										        	  if(data.status==0){
										        		  $("#mycartnum").text(parseInt($("#mycartnum").text())+1);
										        		  alert("加购成功，请去购物车查看！");
										        	  }else if(data.status==1){
										        		  alert("加购成功，请去购物车查看！");
										        	  }else{
										        		  alert("加购失败！");
										        	  }
										          }  
										     });
										}
									}
									</script>
									</div>
									<div style="width: 500px; height: 60px; margin-top: 20px;">
									<input type="text" name="product.id" style="display: none" value="<s:property value="#request.product.id"/>">
									<input type="button" value="加入购物车" onclick="addcart()" style="display: inline-block; width: 150px; height: 50px; background-color: #d9d9d9; border: none; color: #ff0000; font-size: 18px;">
									<input type="submit" value="立即购买" style="display: inline-block; width: 150px; height: 50px; background-color: #ff0000; border: none; color: white; font-size: 18px; margin-left: 10px;">
									</div>
								</span>
								</form>
							</div>
							<!--缩图开始-->
							<div class="spec-scroll">
								<a class="prev">&lt;</a> <a class="next">&gt;</a>
								<div class="items">
									<ul>
										<s:iterator value="#request.product.images" var="image">
										<li><img alt="佳能" bimg="<s:property value="#image.url"  />"
											src="<s:property value="#image.url"  />" onmousemove="preview(this);"></li>
											</s:iterator>
									</ul>
								</div>
							</div>
							<!--缩图结束-->
						</div>
						<!--产品参数结束-->
						<div style="clear:both;height:10px;"></div>
						<div class="m" id="comment">
							<ul class="tab clearfix">
								<li onclick="tabs('#comment',0)" class="curr">图文介绍<strong></strong><span></span></li>
								<li onclick="tabs('#comment',1)">评论<strong>(1)</strong><span></span></li>
							</ul>
							<div class="mc tabcon" style="display:block;">
								<div class="norecode">
									<s:iterator value="#request.product.infourl.split('-')" var="url">
									<img alt="详情图" src="${pageContext.request.contextPath }/<s:property value="#url" />">
									</s:iterator>
								</div>
							</div>
							<div class="mc tabcon" style="display:none;">
								<div class="item">
									<div class="user">
										<span class="u-name">用户：用户名</span>
										<span class="u-level">
											<font style="color:#999999">店铺会员 </font>
										</span>
										<span class="date-ask">2019-05-05 13:36</span>
									</div>
									<dl class="ask">
										<dt>
											<b></b>评论内容：
										</dt>
										<dd>这里是评论内容！</dd>
									</dl>
									<dl class="answer">
										<dt>
											<b></b>商家回复：
										</dt>
										<dd>
											<div class="content">
											这里是商家回复内容！
											</div>
											<div class="date-answer">2019-05-5 10:45</div>
										</dd>
									</dl>
									<%-- <div id="6727709" class="useful">
										您对我们的回复： <a class="btn-pleased" href="javascript:void(0)"
											name="2">满意</a> ( <span>0</span> )&nbsp;&nbsp; <a
											class="btn-unpleased" href="javascript:void(0)" name="4">不满意</a>
										( <span>0</span> )
									</div> --%>
								</div>
								<%-- <div class="item odd">
									<div class="user">
										<span class="u-name">网友：yefa888</span> <span class="u-level">
											<font style="color:#999999"> 铜牌会员 </font>
										</span> <span class="date-ask">2011-01-16 01:36</span>
									</div>
									<dl class="ask">
										<dt>
											<b></b> 咨询内容：
										</dt>
										<dd>请问这个MiniDV带是可以重复使用还是一次消费品?我是生手,想买一台可是不太了解.</dd>
									</dl>
									<dl class="answer">
										<dt>
											<b></b> 京东回复：
										</dt>
										<dd>
											<div class="content">您好！可以重复使用,感谢您对京东的支持！祝您购物愉快！</div>
											<div class="date-answer">2011-01-17 09:47</div>
										</dd>
									</dl>
									<div id="6195867" class="useful">
										您对我们的回复： <a class="btn-pleased" href="javascript:void(0)"
											name="2">满意</a> ( <span>0</span> )&nbsp;&nbsp; <a
											class="btn-unpleased" href="javascript:void(0)" name="4">不满意</a>
										( <span>0</span> )
									</div>
								</div> --%>
							</div>
						</div>





					</div>
				</s:if>
			</div>
		</div>
    </div>
<jsp:include page="bottom.jsp"></jsp:include>