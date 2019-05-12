<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<jsp:include page="head.jsp"></jsp:include>
<div style="text-align: center;">
	<iframe id="iframe" runat="server" src="order_pay.action?id=<s:property value="#request.orderid"/>"
		onload="this.height=this.contentWindow.document.body.scrollHeight"
		width="1400" frameborder="no" border="0" marginwidth="0"
		marginheight="0" scrolling="no" id="external-frame" allowtransparency="yes"> </iframe>
</div>
<jsp:include page="bottom.jsp"></jsp:include>