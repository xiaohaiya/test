<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<jsp:include page="head.jsp"></jsp:include>
<body class="modal white">


<!--     内容      -->
<div id="content" class="white">
    <form action="${pageContext.request.contextPath }/admin_updatefb.action" method="post" enctype="multipart/form-data" target="right">
    <input type="text" name="feedback.id" value="<s:property value="#feedback.id"/>"  hidden="hidden">
    <div class="bloc">
        <div class="title">回复反馈信息</div>
        <div class="content">
            <div class="input">
                <label>问题</label>
                <textarea rows="5" cols="69" name="feedback.questions" readonly="readonly"><s:property value="#feedback.questions"/></textarea>
            </div>
            <div class="input" style="">
                <label>回复</label>
                <textarea rows="5" cols="69" name="feedback.answer" required oninvalid="setCustomValidity('请填写回复内容')" oninput="setCustomValidity('')"><s:property value="#feedback.answer"/></textarea>
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