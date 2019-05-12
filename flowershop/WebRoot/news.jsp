<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<jsp:include page="head.jsp"></jsp:include>
<div style="margin:auto; width: 100%; height: 960px; background-image: url('images/odes.jpg'); background-repeat: no-repeat; background-position: center;" id="feedback">
	<div style="width: 500px;margin: auto;">
		<div style="margin-top:110px; position:absolute; padding: 0px; width: 500px; height: 695px; overflow: hidden;">
			<ul>
			<s:iterator value="list" var="news">
			<li style="border-bottom: 1px dotted #dbd4cd; height:73px; margin: 10px 0px; padding: 6px 0px;">
				<div style="float: left; text-align: center; margin-left: 30px; color: #fff; background:#666666;width:60px;height:60px;">
					<span style="line-height:41px;color:#fff;font-size:24px;display: inline-block;">
						<s:property value="%{getText('{0,date,dd}',{#news.createtime})}"/>
					</span>
					<span style="color:#fff;font-size:12px;display:block; ">
						<s:property value="%{getText('{0,date,yyyy-MM}',{#news.createtime})}"/>
					</span>
				</div>
				<div style="padding-left: 100px;">
					<p>
						<a href="${pageContext.request.contextPath }/news_findById.action?id=<s:property value="#news.id"/>" style="font-size: 18px; color: #5A5A5A;" title="<s:property value="#news.title"/>"><s:property value="#news.title"/></a>
					</p>
					<p style="margin-top: 10px;">
						<s:if test="#news.comment.length()>30">
                    	<s:property value='#news.comment.substring(0,30)+"..."' escapeHtml="false"/>
                    	</s:if>
                    	<s:else>
                    	<s:property value="#news.comment" escapeHtml="false"/>
                    	</s:else>
					</p>
				</div>
			</li>
			</s:iterator>
			</ul>
			<div style="text-align: center; position:absolute; bottom: 0px; width: 100%;">
				<span>总记录数${totalCount}条</span>&nbsp;
		        <s:if test="currPage==1">
		        <a>&lt;上一页</a>&nbsp;&nbsp;
		        </s:if>
		        <s:else>
		        <a href="${pageContext.request.contextPath }/news_findAll.action?currPage=${currPage-1}">&lt;上一页</a>&nbsp;&nbsp;
		        </s:else>
		        <s:iterator value="new int[totalPage]" status="page">
		        	<s:if test="#page.index==currPage-1">
		        	<span style="color: #dd0000;"><s:property value="#page.index+1" /></span>
		        	</s:if>
		        	<s:else>
			        <a href="${pageContext.request.contextPath }/news_findAll.action?currPage=<s:property value="#page.index+1" />"><s:property value="#page.index+1" /></a>
		        	</s:else>
		        </s:iterator>
		        &nbsp;
		        <s:if test='currPage==totalPage||totalPage==""'>
		        <a>下一页&gt;</a>&nbsp;&nbsp;
		        </s:if>
		       	<s:else>
		        <a href="${pageContext.request.contextPath }/news_findAll.action?currPage=${currPage+1}">下一页&gt;</a>
		       	</s:else>
			</div>


		</div>
	</div>
</div>
<jsp:include page="bottom.jsp"></jsp:include>