<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>多肉之家</title>
    <link rel="SHORTCUT ICON" href="${pageContext.request.contextPath }/admin/images/logo.ico">
    <link rel="BOOKMARK" href="${pageContext.request.contextPath }/admin/images/logo.ico">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/admin/css/style.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/admin/css/jquery.wysiwyg.old-school.css">
	<script type="text/javascript" src="${pageContext.request.contextPath }/admin/js/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/admin/js/jquery-ui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/admin/js/min.js" charset="UTF-8"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/admin/js/main.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/admin/css/style2.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/bootstrap/css/bootstrap-theme.min.css">
    
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/admin/css/webuploader.css">
    
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/admin/css/demo.css">
    
</head>
<script type="text/javascript">
	$(document).ready(function () {
		/* $.post(
				"${pageContext.request.contextPath }/admin_findprolist.action",
				function (data){
					$(data).each(function (i,data) {
						$("#productlist").append("<option value='"+data.id+"'>"+data.pname+"</option>");
					});
				},
				"json"
				); */
		$.ajax({  
	         type : "post",  
	          url : "${pageContext.request.contextPath }/admin_findprolist.action",  
	          async : false,
	          dataType: "json",
	          success : function(data){  
	        	  $(data).each(function (i,data) {
						$("#productlist").append("<option value='"+data.id+"'>"+data.pname+"</option>");
					});
	          }  
	     });
	});
</script>
<body>
<!--     内容      -->
<div id="content" class="white">
 <h1><img src="${pageContext.request.contextPath }/admin/images/posts.png" alt="">商品详情描述图片添加</h1>
 <div class="bloc" style="margin: 60px 0px 0px; height:500px;">
	<div class="content" style="height:500px;">
				<div class="input" style="margin-left: 20px;">
					<label>所选商品</label>
					<select id="productlist" name="product.id">
					</select>
				</div>
				<div id="uploader" class="wu-example">
					<div class="queueList">
						<div id="dndArea" class="placeholder">
							<div id="filePicker" class="webuploader-container">
								<div class="webuploader-pick">点击选择图片</div>
								<div id="rt_rt_1d79got361j1bpfsebj1c471i2e1"
									style="position: absolute; top: 0px; left: 448px; width: 168px; height: 44px; overflow: hidden; bottom: auto; right: auto;">
									<input type="file" name="file"
										class="webuploader-element-invisible" multiple="multiple"
										accept="image/*"><label
										style="opacity: 0; width: 100%; height: 100%; display: block; cursor: pointer; background: rgb(255, 255, 255);"></label>
								</div>
							</div>
							<p>或将照片拖到这里，单次最多可选6张,大小不超过10M</p>
						</div>
						<ul class="filelist"></ul>
					</div>
					<div class="statusBar" style="display:none;">
						<div class="progress" style="display: none;">
							<span class="text">0%</span> <span class="percentage"
								style="width: 0%;"></span>
						</div>
						<div class="info">共0张（0B），已上传0张</div>
						<div class="btns">
							<div id="filePicker2" class="webuploader-container">
								<div class="webuploader-pick">继续添加</div>
								<div id="rt_rt_1d79got39en19d8cim1bar1a696"
									style="position: absolute; top: 0px; left: 0px; width: 1px; height: 1px; overflow: hidden;">
									<input type="file" name="file"
										class="webuploader-element-invisible" multiple="multiple"
										accept="image/*"><label
										style="opacity: 0; width: 100%; height: 100%; display: block; cursor: pointer; background: rgb(255, 255, 255);"></label>
								</div>
							</div>
							<div class="uploadBtn state-pedding">开始上传</div>
						</div>
					</div>
				</div>

			</div>
 </div>
 
 
    <script type="text/javascript" src="${pageContext.request.contextPath }/bootstrap/js/jquery-3.3.1.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/admin/js/global.js"></script>
    
    <script type="text/javascript" src="${pageContext.request.contextPath }/admin/js/webuploader.js"></script>
    
    <script type="text/javascript" src="${pageContext.request.contextPath }/admin/js/demo.js"></script>

</div>
</body></html>