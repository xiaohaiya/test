<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:include page="head.jsp"></jsp:include>
<body>
<div id="head">
		<div class="left"> <a class="button profile"><img src="../images/huser.png" alt=""></a>你好！ <a style="cursor: pointer;">${session.admin.admin}</a> </div>
        <div class="right"><a href="${pageContext.request.contextPath}/admin_quit.action" style="cursor: pointer;" target="_parent">退出登录</a></div>
</div>
</body>
</html>