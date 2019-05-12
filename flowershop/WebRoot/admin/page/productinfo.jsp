<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<jsp:include page="head.jsp"></jsp:include>
<script type="text/javascript">
	$(document).ready(function () {
		$.post(
				"${pageContext.request.contextPath }/admin_findcategory.action",
				function (data){
					$(data).each(function (i,data) {
						if(<s:property value="#product.category.id" />==data.id){
							$("#categorylist").append("<option selected='selected' value='"+data.id+"'>"+data.cname+"</option>");
						}else{
							$("#categorylist").append("<option value='"+data.id+"'>"+data.cname+"</option>");
						}
					});
				},
				"json"
				);
	});
</script>
<body class="modal white">
<div id="content" class="white">
    <div class="bloc">
        <div class="title">商品信息修改</div>
        <form action="${pageContext.request.contextPath }/admin_updatepro.action" method="post" target="right">
        	<input type="text" name="product.id" hidden="hidden" value="<s:property value="#product.id" />">
            <div class="content" style="">
                <div class="input">
                    <label>商品名称：</label>
                    <input type="text" value="<s:property value="#product.pname" />" readonly="readonly" name="product.pname" required oninvalid="setCustomValidity('请填写商品名称')" oninput="setCustomValidity('')">
                </div>
                <div class="input">
                    <label>商品分类：</label>
                    <select id="categorylist" name="product.category.id">
                    </select>
                </div>
                <div class="input">
                	<label>商品原价：</label>
                	<input type="text" value="<s:property value="#product.oldPrice" />" name="product.oldPrice" required oninvalid="setCustomValidity('价格不能为空')" oninput="setCustomValidity('')">
                </div>
                <div class="input">
                    <label>商品促销价格：</label>
                    <input type="text" value="<s:property value="#product.newPrice" />" name="product.newPrice" required oninvalid="setCustomValidity('价格不能为空')" oninput="setCustomValidity('')">
                </div>
                <div class="input">
                	<label>商品描述：</label>
                	<textarea rows="8" cols="39" name="product.pdetail"><s:property value="#product.pdetail" /></textarea>
                </div>
                <div class="input"></div>
                <div class="submit">
                    <input type="submit" value="确定">
                </div>
            </div>
        </form>
    </div>
</div>
<div id="ui-datepicker-div" class="ui-datepicker ui-widget ui-widget-content ui-helper-clearfix ui-corner-all"></div>
</body>
</html>