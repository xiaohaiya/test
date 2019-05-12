<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<%-- <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="">
    
    <title>添加商品</title>

  </head>
  <s:actionerror />
  <s:fielderror></s:fielderror>
  <body style="background-color: white;">
	<form action="admin_upload.action" enctype="multipart/form-data" method="post" target="_parent">
		新增商品：
		名称：<input type="text" name="pname"><br>
		原价：<input type="text" name="oldPrice"><br>
		促销价：<input type="text" name="newPrice"><br>
		详情：<textarea rows="3" cols="20" name="pdetail"></textarea><br>
		分类：<select name="category.id">
			  <option value="0">1</option>
			  <option value="1">2</option>
			  <option value="2">3</option>
			  <option value="3">4</option>
			</select><br/>
		文件：<input type="file" name="upload"><br>
		<input type="submit" value="提交"> 
	</form>
  </body>
</html> --%>
<!DOCTYPE html>
<!-- saved from url=(0069)http://www.17sucai.com/preview/775073/2017-12-16/diyUpload/index.html -->
<html lang="en"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
    <meta http-equiv="X-UA-COMPATIBLE" content="IE=edge,chrome=1">
    <meta name="renderer" content="webkit">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!--优先使用 IE 最新版本和 Chrome-->
    <meta name="keywords" content="">
    <meta name="description" content="">
    <meta name="author" content="">
    <title></title>

    <!--全局公用样式-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/admin/css/globle.css">

    <script type="text/javascript" src="${pageContext.request.contextPath }/admin/js/jquery.upload.js"></script>
	
</head>
<body style="background-color: white;">
<s:actionerror />
  <s:fielderror></s:fielderror>
<div style="">
    <ul class="upload-ul clearfix">
			<li class="upload-pick">
				<div class="webuploader-container clearfix" id="goodsUpload">
					<div class="webuploader-pick"></div>
					<div id="rt_rt_1d6vjpvq6cq41i3719pcjjtult1"
						style="position: absolute; top: 0px; left: 0px; width: 120px; height: 90px; overflow: hidden; bottom: auto; right: auto;">
						<input type="file" name="file"
							class="webuploader-element-invisible" multiple="multiple"
							accept="">
							<label style="opacity: 0; width: 100%; height: 100%; display: block; cursor: pointer; background: rgb(255, 255, 255);"></label>
					</div>
				</div>
			</li>
		</ul>
</div>

<script src="${pageContext.request.contextPath }/admin/js/webuploader.min.js"></script>
<script src="${pageContext.request.contextPath }/admin/js/diyUpload.js"></script>
<script>
$(function(){

	//上传图片
	var $tgaUpload = $('#goodsUpload').diyUpload({
		url:'/uploadFilePath',
		success:function( data ) { },
		error:function( err ) { },
		buttonText : '',
		accept: {
			title: "Images",
			extensions: 'gif,jpg,jpeg,bmp,png'
		},
		thumb:{
			width:120,
			height:90,
			quality:100,
			allowMagnify:true,
			crop:true,
			type:"image/jpeg"
		}
	});


});
</script>

<form action="rfef">
<input type="file" name="fdsjifj">
<input type="submit">
</form> 
</body></html>