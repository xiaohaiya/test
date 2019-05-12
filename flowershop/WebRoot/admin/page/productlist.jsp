<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<jsp:include page="head.jsp"></jsp:include>
<body>
<!--     内容      -->
<div id="content" class="white">
		<h1><img src="${pageContext.request.contextPath }/admin/images/posts.png" alt="">商品管理</h1>
    <div class="bloc">
        <div class="title">操作 <a class="toggle"></a><a href="#" class="toggle"></a></div>
        <div class="content dashboard">
            <div class="center" style="display: block; width: auto;">
                <a href="${pageContext.request.contextPath }/admin/page/add_product.jsp" class="shortcut zoombox w350 h500">
                    <img src="${pageContext.request.contextPath }/admin/images/glyph-add.png" alt="" width="48" height="48">添加商品
                </a>
                <div class="cb"></div>
            </div>
        </div>
    </div>
		<div class="bloc">
				<div class="title">全部商品<a href="#" class="toggle"></a><a href="#" class="toggle"></a></div>
				<div class="content">
						<table>
								<thead>
										<tr>
												<th></th>
												<th>商品名称</th>
												<th>原价</th>
												<th>促销价</th>
												<th>描述</th>
												<th>上架时间</th>
												<th>所属分类</th>
												<th>操作</th>
										</tr>
								</thead>
								<tbody>
								<s:iterator value="list" var="p">
									<tr>
										<td>
					                		<a href="${pageContext.request.contextPath }/<s:property value="#p.images.iterator().next().url"/>" class="zoombox">
												<image width="35" height="35" src="${pageContext.request.contextPath }/<s:property value="#p.images.iterator().next().url"/>" />
											</a>
										</td>
										<td><s:property value="#p.pname"/></td>
										<td><s:property value="#p.oldPrice"/></td>
										<td><s:property value="#p.newPrice"/></td>
										<td>
											<s:if test="#p.pdetail.length()>20">
												<s:property value='#p.pdetail.substring(0,20)+"..."'/>
											</s:if>
											<s:else>
												<s:property value='#p.pdetail'/>
											</s:else>
										</td>
										<td><s:property value="%{getText('{0,date,yyyy-MM-dd HH:mm:ss}',{#p.createtime})}"/></td>
										<td><s:property value="#p.category.cname"/></td>
										<td>
											<a class="zoombox w350 h500" href="${pageContext.request.contextPath }/admin_findpro.action?product.id=<s:property value="#p.id"/>" title="修改">
												<img src="${pageContext.request.contextPath }/admin/images/edit.png" alt="修改">
											</a>
											<a href="${pageContext.request.contextPath }/admin_offpro.action?product.id=<s:property value="#p.id"/>" title="下架">
												<img src="${pageContext.request.contextPath }/admin/images/delete.png" alt="下架">
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
								<a href="${pageContext.request.contextPath }/admin_allproduct.action?currPage=${currPage-1}" class="prev" title="上一页">«</a>
							</s:else>
							<s:iterator value="new int[totalPage]" status="page">
							<s:if test="currPage==#page.index+1">
							<a class="current">${currPage}</a>
							</s:if>
							<s:else>
							<a href="${pageContext.request.contextPath }/admin_allproduct.action?currPage=<s:property value="#page.index+1"/>"><s:property value="#page.index+1" /></a>
							</s:else>
							</s:iterator>
							<s:if test='currPage==totalPage||totalPage==""'>
								<a class="next" title="下一页">»</a>
							</s:if>
							<s:else>
								<a href="${pageContext.request.contextPath }/admin_allproduct.action?currPage=${currPage+1}" class="next" title="下一页">»</a>
							</s:else>
						</div>
				</div>
		</div>
</div>
<div id="ui-datepicker-div" class="ui-datepicker ui-widget ui-widget-content ui-helper-clearfix ui-corner-all"></div>
</body></html>