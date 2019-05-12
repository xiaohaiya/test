<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="${pageContext.request.contextPath}/product_save.action" method="post" enctype="multipart/form-data">
名称：<input type="text" name="pname"><br>
旧价：<input type="text" name="oldPrice"><br>
新价：<input type="text" name="newPrice"><br>
详情：<input type="text" name="pdetail"><br>
分类：<input type="text" name="category.id"><br>
图1：<input type="file" name="upload"><br>
<input type="submit" value="提交">
</form>

<br>
<hr>
<script language="javascript" type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>
<input class="Wdate" type="text" id="d15" onclick="WdatePicker({isShowClear:false,readOnly:true})"/>
<s:actionerror />
<s:fielderror></s:fielderror>
</body>
</html>