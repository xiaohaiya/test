<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:include page="head.jsp"></jsp:include>
<body class="modal white">
<!--     内容      -->
<div id="content" class="white">
    <form id="XHForm" action="${pageContext.request.contextPath }/admin_addnews.action" method="post" enctype="multipart/form-data" target="right">
    <div class="bloc">
        <div class="title">新增新闻咨询</div>
        <div class="content">
            <div class="input">
                <div class="input">
                <label>新闻标题</label>
                <textarea rows="3" cols="55" name="news.title" required oninvalid="setCustomValidity('请填写新闻标题')" oninput="setCustomValidity('')"></textarea>
            </div>
            </div>
            <div class="input">
                <label>新闻内容</label>
                <textarea onblur="replace()" rows="10" cols="55" id="comment" required oninvalid="setCustomValidity('请填写新闻内容')" oninput="setCustomValidity('')"></textarea>
            </div>
            <textarea id="comment1" name="news.comment" hidden="hidden"></textarea>
            <div class="input"></div>
            <div class="submit">
                <input type="submit" value="确定">
            </div>
        </div>
    </div>
    </form>
</div>
<script type="text/javascript">
function replace () {
		var text = $("#comment").val().replace(/[\r\n]/g,"<br/>");
		$("#comment1").val(text);
	};
</script>
<div id="ui-datepicker-div" class="ui-datepicker ui-widget ui-widget-content ui-helper-clearfix ui-corner-all"></div>
</body>

</html>