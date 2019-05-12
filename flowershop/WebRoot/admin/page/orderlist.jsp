<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<jsp:include page="head.jsp"></jsp:include>
<body>
<div id="content" class="white">
    <h1><img src="../images/posts.png" alt="">订单管理</h1>
    <div class="bloc">
        <div class="title">订单详情列表<a href="#" class="toggle"></a><a href="#" class="toggle"></a></div>
        <div class="content">
            <table>
                <thead>
                <tr>
                    <th>用户名</th>
                    <th>订单编号</th>
                    <th>订单金额</th>
                    <th>配送快递</th>
                    <th>订单日期</th>
                    <th>收货人姓名</th>
                    <th>收货地址</th>
                    <th>状态</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <s:iterator value="list" var="order">
                <tr>
                	<td><s:property value="#order.user.username"/></td>
                    <td><s:property value="#order.id"/></td>
                    <td><s:property value="#order.total"/></td>
                    <td><s:property value="#order.express"/></td>
                    <td><s:property value="%{getText('{0,date,yyyy-MM-dd HH:mm:ss}',{#order.createtime})}"/></td>
                    <td><s:property value="#order.address.name"/></td>
                    <td><s:property value="#order.address.address"/></td>
                    <td>
                    	<s:if test="#order.status==0">待支付</s:if>
	                    <s:if test="#order.status==1">待收货</s:if>
	                    <s:if test="#order.status==2">已完成</s:if>
	                    <s:if test="#order.status==3">已取消</s:if>
	                    <s:if test="#order.status==4">已退货</s:if>
	                    <s:if test="#order.status==5">等待审核</s:if>
                    </td>
                    <td>
                    	<s:if test="#order.status==5">
						<a href="${pageContext.request.contextPath }/admin_orderinfo.action?order.id=<s:property value="#order.id"/>" title="查看订单详情内容">
							<img src="${pageContext.request.contextPath }/admin/images/viewing.png" alt="查看">
						</a>
						<a href="${pageContext.request.contextPath }/admin_jieshou.action?order.id=<s:property value="#order.id"/>" title="接受退款申请">
						<img src="${pageContext.request.contextPath }/admin/images/accept.png" alt="接受">
						</a>
						</s:if>
						<s:else>
						<a href="${pageContext.request.contextPath }/admin_orderinfo.action?order.id=<s:property value="#order.id"/>" title="查看订单详情内容">
						<img src="${pageContext.request.contextPath }/admin/images/viewing.png" alt="查看">
						</a>
						</s:else>
						</a>
					</td>
                </tr>
                </s:iterator>
                </tbody>
            </table>
            <div class="pagination">
			<s:if test="currPage==1">
				<a class="prev" title="上一页">«</a>
			</s:if>
			<s:else>
				<a href="${pageContext.request.contextPath }/admin_allorder.action?currPage=${currPage-1}" class="prev" title="上一页">«</a>
			</s:else>
			<s:iterator value="new int[totalPage]" status="page">
			<s:if test="currPage==#page.index+1">
			<a class="current">${currPage}</a>
			</s:if>
			<s:else>
			<a href="${pageContext.request.contextPath }/admin_allorder.action?currPage=<s:property value="#page.index+1"/>"><s:property value="#page.index+1" /></a>
			</s:else>
			</s:iterator>
			<s:if test='currPage==totalPage||totalPage==""'>
				<a class="next" title="下一页">»</a>
			</s:if>
			<s:else>
				<a href="${pageContext.request.contextPath }/admin_allorder.action?currPage=${currPage+1}" class="next" title="下一页">»</a>
			</s:else>
		</div>
        </div>
    </div>
</div>
<br>
<div id="ui-datepicker-div" class="ui-datepicker ui-widget ui-widget-content ui-helper-clearfix ui-corner-all"></div>
<br>
</body></html>