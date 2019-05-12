<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:include page="head.jsp"></jsp:include>
<body>
<!--      左侧菜单     -->
<div id="sidebar">
		<ul>
				<li class="current">
						<a style="cursor: pointer;"><img src="../images/layout.png" alt="">订单管理</a>
						<ul style="display: block;">
                            <li><a href="${pageContext.request.contextPath }/admin_waitorder.action" target="right">待支付订单</a></li>
                            <li><a href="${pageContext.request.contextPath }/admin_havepay.action" target="right">待收货订单</a></li>
                            <li><a href="${pageContext.request.contextPath }/admin_allorder.action" target="right">已完成订单</a></li>
                            <li><a href="${pageContext.request.contextPath }/admin_failedorder.action" target="right">退款申请</a></li>
                        </ul>
				</li>
				<li>
						<a style="cursor: pointer;"><img src="../images/brush.png" alt="">商品管理</a>
						<ul style="display: none;">
                            <li><a href="${pageContext.request.contextPath }/admin_allproduct.action" target="right">全部商品</a></li>
                            <li><a href="${pageContext.request.contextPath }/admin_prodetail.action" target="right">添加商品详情图</a></li>
                            <li><a href="${pageContext.request.contextPath }/admin_offprolist.action" target="right">已下架的商品</a></li>
						</ul>
				</li>
				<li>
						<a style="cursor: pointer;"><img src="../images/huser.png" alt="">客户管理</a>
						<ul style="display: none;">
                            <li><a href="${pageContext.request.contextPath }/admin_alluser.action" target="right">活跃会员</a></li>
                            <li><a href="${pageContext.request.contextPath }/admin_prohibituser.action" target="right">禁用会员</a></li>
                            
                        </ul>
				</li>
				<li>
						<a style="cursor: pointer;"><img src="../images/comment.png" alt=""> 客户反馈</a>
						<ul style="display: none;">
                            <li><a href="${pageContext.request.contextPath }/admin_allfb.action" target="right">最新信息</a></li>
                            <li><a href="${pageContext.request.contextPath }/admin_oldfb.action" target="right">已回复信息</a></li>
                        </ul>
				</li>
				<li>
						<a style="cursor: pointer;"><img src="../images/news.png" alt="">新闻咨询</a>
						<ul style="display: none;">
                            <li><a href="${pageContext.request.contextPath }/admin_allnews.action" target="right">所有新闻</a></li>
                            <li><a href="${pageContext.request.contextPath }/admin_oldnews.action" target="right">过期新闻</a></li>
                        </ul>
				</li>
				<li>
						<a style="cursor: pointer;"><img src="../images/lab.png" alt="">系统工具</a>
						<ul style="display: none;">
                            <li><a href="null.jsp" target="right">待定</a></li>
                        </ul>
				</li>
		</ul>
</div>
</body></html>