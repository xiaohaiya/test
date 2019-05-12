<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<jsp:include page="head.jsp"></jsp:include>
    <!--商品列表实现-->
    <div class="row" style="width: 1400px; margin: auto; margin-top: 15px; min-height: 250px;"><!-- 将要加入的略缩图放入row中 -->
        <s:iterator value="list" var="p">
        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3"><!-- 大屏幕放3张略缩图，pc端放4张，平板和手机放6张-->
            <div class="thumbnail" style="padding: 0px;">
                <a href="${pageContext.request.contextPath}/product_findById.action?id=<s:property value="#p.id"/>"><img src="<s:property value="#p.images.iterator().next().url" />" alt="<s:property value="#p.pname"/>" class="img-responsive" style="width: 318px;height: 318px;"></a>
                <div class="caption" style="padding: 9px 0px 0px 0px;">
                    <p><a  href="${pageContext.request.contextPath}/product_findById.action?id=<s:property value="#p.id"/>"><s:property value="#p.pname"/></a></p>
                    <p>价格：¥<s:property value="#p.newPrice"/></p>
                    <a href="${pageContext.request.contextPath}/product_findById.action?id=<s:property value="#p.id"/>" class="btn btn-default" style="border-radius: 0px; border: none; background-color: #F7F7F7; width: 100%; color: #4F4F4F;">立即购买</a>
                </div>
            </div>
        </div>
        </s:iterator>
    </div>
    <div class="changepage">
        <span>总记录数${totalCount}条</span>&nbsp;
        <s:if test="currPage==1">
        <a>&lt;上一页</a>&nbsp;&nbsp;
        </s:if>
        <s:else>
        <a href="${pageContext.request.contextPath }/product_findAll.action?currPage=${currPage-1}">&lt;上一页</a>&nbsp;&nbsp;
        </s:else>
        <s:iterator value="new int[totalPage]" status="page">
        	<s:if test="#page.index==currPage-1">
        	<span style="color: #dd0000;"><s:property value="#page.index+1" /></span>
        	</s:if>
        	<s:else>
	        <a href="${pageContext.request.contextPath }/product_findAll.action?currPage=<s:property value="#page.index+1" />"><s:property value="#page.index+1" /></a>
        	</s:else>
        </s:iterator>
        <s:if test='currPage==totalPage||totalPage==""'>
        <a>下一页&gt;</a>&nbsp;&nbsp;
        </s:if>
       	<s:else>
        <a href="${pageContext.request.contextPath }/product_findAll.action?currPage=${currPage+1}">下一页&gt;</a>
       	</s:else>
    </div>
<jsp:include page="bottom.jsp"></jsp:include>