<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<jsp:include page="head.jsp"></jsp:include>
<body>

<!--     内容      -->
<div id="content" class="white">
    <h1><img src="../images/posts.png" alt="">客户反馈</h1>
    <div class="bloc">
        <div class="title">反馈信息<a class="toggle"></a><a class="toggle"></a></div>
        <div class="content">
            <table>
                <thead>
                <tr>
                    <th>姓名</th>
                    <th>邮箱</th>
                    <th>电话</th>
                    <th>问题</th>
                    <s:if test='list.get(0).answer!=null&&list.get(0).answer!=""'>
                    <th>回复</th>
                    </s:if>
                    <th>时间</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <s:iterator value="list" var="f">
                <tr>
                    <td><s:property value="#f.name" /></td>
                    <td><s:property value="#f.email" /></td>
                    <td><s:property value="#f.phone" /></td>
                    <td>
                    <s:if test='#f.answer!=null&&#f.answer!=""&&#f.questions.length()>15'>
                    <s:property value='#f.questions.substring(0,15)+"..."' />
                    </s:if>
                    <s:else>
                    <s:property value="#f.questions" />
                    </s:else>
                    </td>
                    <s:if test='#f.answer!=null&&#f.answer!=""'>
                    <td>
					<s:if test="#f.answer.length()>15">
                    <s:property value='#f.answer.substring(0,15)+"..."' />
                    </s:if>
                    <s:else>
                    <s:property value="#f.answer" />
                    </s:else>
					</td>
                    </s:if>
                    <td><s:property value="%{getText('{0,date,yyyy-MM-dd}',{#f.time})}"/></td>
                    <td>
                    <s:if test='#f.answer!=null&&#f.answer!=""'>
                    <a class="zoombox w500 h349" href="${pageContext.request.contextPath }/admin_fbinfo.action?feedback.id=<s:property value="#f.id" />" title="修改"><img src="${pageContext.request.contextPath }/admin/images/edit.png" alt=""></a>
                    <a class="zoombox w500 h349" href="${pageContext.request.contextPath }/admin_fbinfo.action?feedback.id=<s:property value="#f.id" />" title="查看详情"><img src="${pageContext.request.contextPath }/admin/images/viewing.png" alt=""></a>
                    </s:if>
                    <s:else>
                    <a class="zoombox w500 h349" href="${pageContext.request.contextPath }/admin_fbinfo.action?feedback.id=<s:property value="#f.id" />" title="回复信息"><img src="${pageContext.request.contextPath }/admin/images/answer.png" alt=""></a>
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