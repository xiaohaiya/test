<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:include page="head.jsp"></jsp:include>
<script type="text/javascript">
	$(document).ready(function () {
		$.ajaxSettings.async = false;
		$.post(
				"${pageContext.request.contextPath }/admin_findcategory.action",
				function (data){
					$(data).each(function (i,data) {
						$("#categorylist").append("<option value='"+data.id+"'>"+data.cname+"</option>");
					});
				},
				"json"
				);
		$.ajaxSettings.async = true;
	});
</script>
<body class="modal white">


<!--     内容      -->
<div id="content" class="white">
    <form action="${pageContext.request.contextPath }/admin_addpro.action" method="post" enctype="multipart/form-data" target="right">
    <div class="bloc">
        <div class="title">新增商品信息</div>
        <div class="content">
            <div class="input">
                <label>商品名称</label>
                <input type="text" name="product.pname" required oninvalid="setCustomValidity('名称不能为空')" oninput="setCustomValidity('')">
            </div>
            <div class="input">
                <label>所属类别</label>
                <select id="categorylist" name="product.category.id">
                </select>
            </div>
            <div class="input" style="">
                <label>原价</label>
                <input type="text" name="product.oldPrice" required oninvalid="setCustomValidity('请填写价格')" oninput="setCustomValidity('')">
            </div>
            <div class="input" style="">
                <label>促销价</label>
                <input type="text" name="product.newPrice" required oninvalid="setCustomValidity('请填写价格')" oninput="setCustomValidity('')">
            </div>
            <div class="input" style="">
                <label>商品描述</label>
                <textarea rows="5" cols="39" name="product.pdetail" required oninvalid="setCustomValidity('请填写商品描述')" oninput="setCustomValidity('')"></textarea>
            </div>
            <div class="input">
                <label>图片1</label>
                <div class="uploader" id="uniform-file">
                    <input type="file" id="file" style="opacity: 0;" name="upload">
                </div>
            </div>
            <div class="input">
                <label>图片2</label>
                <div class="uploader">
                    <input type="file" size="20" style="opacity: 0;" name="upload">
                </div>
            </div>
            <div class="input">
                <label>图片3</label>
                <div class="uploader">
                    <input type="file"  size="20" style="opacity: 0;" name="upload">
                </div>
            </div>
            <div class="input"></div>
            <div class="submit">
                <input type="submit" value="确定">
            </div>
        </div>
    </div>
    </form>
</div>
<div id="ui-datepicker-div" class="ui-datepicker ui-widget ui-widget-content ui-helper-clearfix ui-corner-all"></div>
</body>

</html>