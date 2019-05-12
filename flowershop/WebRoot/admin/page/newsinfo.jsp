<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags"  prefix="s"%>
<jsp:include page="head.jsp"></jsp:include>
<body class="modal white">
<!--     内容      -->
<div id="content" class="white">
    <div class="bloc">
        <div class="title">新闻咨询详情</div>
        <div class="content">
            <div class="input">
                <div class="input">
                <label>新闻标题</label>
                <textarea rows="3" cols="55" name="news.title" required oninvalid="setCustomValidity('请填写新闻标题')" oninput="setCustomValidity('')"><s:property value="#news.title"/></textarea>
            </div>
            </div>
            <div class="input">
                <label>新闻内容</label>
                <textarea rows="13" id="comment" cols="55" name="news.comment" required oninvalid="setCustomValidity('请填写新闻内容')" oninput="setCustomValidity('')"><s:property value="#news.comment"/></textarea>
            </div>
        </div>
    </div>
</div>
<div id="ui-datepicker-div" class="ui-datepicker ui-widget ui-widget-content ui-helper-clearfix ui-corner-all"></div>
</body>
<script type="text/javascript">
		var text = $("#comment").val().replace(new RegExp("<br/>","g"),"\r\n");
		$("#comment").val(text);
</script>
</html>