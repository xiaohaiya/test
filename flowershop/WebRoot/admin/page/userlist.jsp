<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<jsp:include page="head.jsp"></jsp:include>
<body>
<div id="content" class="white">
    <h1><img src="../images/posts.png" alt="">客户管理</h1>
    <div class="bloc">
        <div class="title">会员列表<a href="" class="toggle"></a><a href="" class="toggle"></a></div>
        <div class="content">
            <table>
                <thead>
                <tr>
                    <th>图像</th>
                    <th>用户名</th>
                    <th>姓名</th>
                    <th>性别</th>
                    <th>电话</th>
                    <th>邮箱</th>
                    <th>生日</th>
                    <th>注册日期</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <s:iterator value="list" var="user">
                <tr>
                	<td>
						<a href="${pageContext.request.contextPath }/<s:property value="#user.picture"/>" class="zoombox">
							<image width="35" height="35" src="${pageContext.request.contextPath }/<s:property value="#user.picture"/>" />
						</a>
					</td>
                	<td><s:property value="#user.username"/></td>
                    <td><s:property value="#user.name"/></td>
                    <td><s:property value="#user.gender"/></td>
                    <td><s:property value="#user.phone"/></td>
                    <td><s:property value="#user.email"/></td>
                    <td><s:property value="%{getText('{0,date,yyyy-MM-dd}',{#user.birthday})}"/></td>
                    <td><s:property value="%{getText('{0,date,yyyy-MM-dd HH:mm:ss}',{#user.createtime})}"/></td>
                    <td>
                    	<s:if test="#user.status==1">
                    	<a href="${pageContext.request.contextPath }/admin_offuser.action?user.status=0&user.id=<s:property value="#user.id"/>" title="恢复">
							<img src="${pageContext.request.contextPath }/admin/images/restore.png" alt="恢复">
						</a>
                    	</s:if>
                    	<s:else>
                    	<a href="${pageContext.request.contextPath }/admin_offuser.action?user.status=1&user.id=<s:property value="#user.id"/>" title="禁用">
							<img src="${pageContext.request.contextPath }/admin/images/disabled.png" alt="禁用">
						</a>
                    	</s:else>
					</td>
                </tr>
                </s:iterator>
                </tbody>
            </table>
            <div class="pagination">
			<s:if test="currPage==1">
				<a class="prev" title="上一页">«</a>
			</s:if>
			<s:else>
				<a href="${pageContext.request.contextPath }/admin_allorder.action?currPage=${currPage-1}" class="prev" title="上一页">«</a>
			</s:else>
			<s:iterator value="new int[totalPage]" status="page">
			<s:if test="currPage==#page.index+1">
			<a class="current">${currPage}</a>
			</s:if>
			<s:else>
			<a href="${pageContext.request.contextPath }/admin_allorder.action?currPage=<s:property value="#page.index+1"/>"><s:property value="#page.index+1" /></a>
			</s:else>
			</s:iterator>
			<s:if test='currPage==totalPage||totalPage==""'>
				<a class="next" title="下一页">»</a>
			</s:if>
			<s:else>
				<a href="${pageContext.request.contextPath }/admin_allorder.action?currPage=${currPage+1}" class="next" title="下一页">»</a>
			</s:else>
		</div>
        </div>
    </div>
</div>
<br>
<div id="ui-datepicker-div" class="ui-datepicker ui-widget ui-widget-content ui-helper-clearfix ui-corner-all"></div>
<br>
</body></html>