<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<jsp:include page="head.jsp"></jsp:include>
<div class="user-page-content">
<div class="clearfix w">
<script type="text/javascript">
function displayed(i){
   $("#ul"+i).toggle();
   if($("#ss"+i).attr("class")=="user_ss"){
	  $("#ss"+i).attr("class","user_tt");
   }else{
	  $("#ss"+i).attr("class","user_ss");
   }
 }
    </script>
<div class="user_menu">
    <div class="navs" id="JS_u_navs">
        <div id="ss1" style="cursor: pointer;" onclick="displayed(1);"><h3><span class="s1"></span>订单中心</h3></div>
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
                <div class="user_title">退货订单</div>
                    <table cellspacing="0" cellpadding="3" width="100%" border="0">
                    <thead>
                    <tr>
                    <th width="150" height="32" bgcolor="#f0f0f0" style="text-align: center;">订单号</th>
                    <th bgcolor="#f0f0f0" style="text-align: center;">退款类型</th>
                    <th width="150" bgcolor="#f0f0f0" style="text-align: center;">申请时间</th>
                    <th width="250" bgcolor="#f0f0f0" style="text-align: center;">状态</th>
                    </tr>
                    </thead>
                    <tbody>
                   	<s:iterator value="list" var="order" status="statusorder">
                    <tr>
                    <td align="center" style="text-align:left;vertical-align: middle; height:40px;text-align: center;">
                    <a class="aBlu" href="${pageContext.request.contextPath}/product_findById.action?id=<s:property value="#cart.product.id"/>" target="_blank" title="查看订单详情"><s:property value="#order.id" /></a></td>
                    <td align="center">申请退货</td>
                    <td align="center"><s:property value="%{getText('{0,date,yyyy-MM-dd HH:mm:ss}',{#order.updatetime})}"/></td>
                    <td align="center">
					<s:if test="#order.status==4">已退货</s:if>
					<s:if test="#order.status==5">待审</s:if>
					</td>      
                    </tr>
                    </s:iterator>
                    <tr align="center">
                      <td colspan="4">
                        <s:if test="currPage==1"><a>上一页</a></s:if>
						<s:else><a href="${pageContext.request.contextPath }/order_returnOrder.action?currPage=${currPage-1}">上一页</a></s:else>
						
						<s:iterator value="new int[totalPage]" status="page">
							<s:if test="currPage==#page.index+1">
								<span style="color:red;">${currPage}</span>
							</s:if>
							<s:else>
							<a href="${pageContext.request.contextPath }/order_returnOrder.action?currPage=<s:property value="#page.index+1" />"><s:property value="#page.index+1" /></a>
							</s:else>
						
						</s:iterator>
						<s:if test='currPage==totalPage||totalPage==""'>
							<a>后一页</a>
						</s:if>
						<s:else>
							<a href="${pageContext.request.contextPath }/order_returnOrder.action?currPage=${currPage+1}">下一页</a>
						</s:else>
                      </td>
                    </tr>
                    </tbody>
                    </table>   
        	</div>
    	</div>
    	
    </div>
</div>
<jsp:include page="bottom.jsp"></jsp:include>