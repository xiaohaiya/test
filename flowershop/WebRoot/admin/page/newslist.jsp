<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<jsp:include page="head.jsp"></jsp:include>
<body>
<div id="content" class="white">
    <h1><img src="../images/posts.png" alt="">新闻中心</h1>
    <div class="bloc">
        <div class="title">操作 <a class="toggle"></a><a href="#" class="toggle"></a></div>
        <div class="content dashboard">
            <div class="center" style="display: block; width: auto;">
                <a href="${pageContext.request.contextPath }/admin/page/addnews.jsp" class="shortcut zoombox w400 h402">
                    <img src="${pageContext.request.contextPath }/admin/images/glyph-add.png" alt="" width="48" height="48">添加新闻
                </a>
                <div class="cb"></div>
            </div>
        </div>
    </div>
    <div class="bloc">
        <div class="title">新闻列表<a href="" class="toggle"></a><a href="" class="toggle"></a></div>
        <div class="content">
            <table>
                <thead>
                <tr>
                    <th>标题</th>
                    <th>内容</th>
                    <th>日期</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <s:iterator value="list" var="news">
                <tr>
                	<td><s:property value="#news.title"/></td>
                    <td>
                    	<s:if test="#news.comment.length()>60">
                    	<s:property value='#news.comment.substring(0,60)+"..."' escapeHtml="false"/>
                    	</s:if>
                    	<s:else>
                    	<s:property value="#news.comment" escapeHtml="false"/>
                    	</s:else>
                    </td>
                    <td><s:property value="%{getText('{0,date,yyyy-MM-dd}',{#news.createtime})}"/></td>
                    <td>
                    	<a href="${pageContext.request.contextPath }/admin_newsinfo.action?news.id=<s:property value="#news.id"/>" class="zoombox w400 h400" title="查看详情">
							<img src="${pageContext.request.contextPath }/admin/images/viewing.png" alt="查看">
						</a>
                    	<a href="${pageContext.request.contextPath }/admin_deletenews.action?news.id=<s:property value="#news.id"/>" title="删除新闻">
							<img src="${pageContext.request.contextPath }/admin/images/delete.png" alt="删除">
						</a>
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