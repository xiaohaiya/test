<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>心雨花屋</title>
    <link rel="SHORTCUT ICON" href="${pageContext.request.contextPath }/admin/images/logo.ico">
    <link rel="BOOKMARK" href="${pageContext.request.contextPath }/admin/images/logo.ico">
    <link rel="stylesheet" href="bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="css/index.css">
    <link rel="stylesheet" href="css/member.css">
    <link href="css/base.css" rel="stylesheet" type="text/css" />
    <script src="bootstrap/js/jquery-3.3.1.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/jquery.jqzoom.js"></script>

</head>
<body>
<script type="text/javascript">
$(function () {
	function mynum() {
		$.ajax({
			url:"${pageContext.request.contextPath }/cart_existcart.action",
			type:"post",
			success:function(data){
				
			}

		 });
	}
	if(!<s:property value="#session.existUser == null"/>){
		mynum();
		$("#mycartnum").text(<s:property value="#session.mycartnumber"/>);
	}
});
</script>
<div class="container" style="background-color: #f5f5f5;">
    <nav class="navbar navbar-inverse" role="navigation" style="border-radius:0PX; margin-bottom: 0px;">
        <div class="container-fluid">
            <div class="navbar-header">
                <a href="${pageContext.request.contextPath }" class="navbar-brand" style="padding: 0px 150px;">
                	<img src="images/xyhw.png" width="200" height="50">
                </a>
            </div>
            <div>
                <ul class="nav navbar-nav">
                    <li class="active"><a href="${pageContext.request.contextPath }">首页</a></li>
                    <li class="dropdown">
                        <a href="JavaScript:void(0)" class="dropdown-toggle" data-toggle="dropdown">
                            鲜花
                            <b class="caret"></b>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a href="${pageContext.request.contextPath }/product_findAll.action?category.id=1">鲜花花束</a></li>
                            <li><a href="${pageContext.request.contextPath }/product_findAll.action?category.id=2">鲜花礼盒</a></li>
                            <li><a href="${pageContext.request.contextPath }/product_findAll.action?category.id=3">商业花篮</a></li>
                            <li><a href="${pageContext.request.contextPath }/product_findAll.action?category.id=4">手提花篮</a></li>
                            <li><a href="${pageContext.request.contextPath }/product_findAll.action?category.id=5">桌花台花</a></li>
                            <li><a href="${pageContext.request.contextPath }/product_findAll.action?category.id=6">手捧花</a></li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="JavaScript:void(0)" class="dropdown-toggle" data-toggle="dropdown">
                            植物
                            <b class="caret"></b>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a href="${pageContext.request.contextPath }/product_findAll.action?category.id=7">水培植物</a></li>
                            <li><a href="${pageContext.request.contextPath }/product_findAll.action?category.id=8">多肉植物</a></li>
                            <li><a href="${pageContext.request.contextPath }/product_findAll.action?category.id=9">艺术盆栽</a></li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="JavaScript:void(0)" class="dropdown-toggle" data-toggle="dropdown">
                            进口花
                            <b class="caret"></b>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a href="${pageContext.request.contextPath }/product_findAll.action?category.id=10">永生花</a></li>
                            <li><a href="${pageContext.request.contextPath }/product_findAll.action?category.id=11">进口鲜花</a></li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="JavaScript:void(0)" class="dropdown-toggle" data-toggle="dropdown">
                            礼品
                            <b class="caret"></b>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a href="${pageContext.request.contextPath }/product_findAll.action?category.id=12">水果礼蓝</a></li>
                            <li><a href="${pageContext.request.contextPath }/product_findAll.action?category.id=13">巧克力</a></li>
                            <li><a href="${pageContext.request.contextPath }/product_findAll.action?category.id=14">小熊花束</a></li>
                            <li><a href="${pageContext.request.contextPath }/product_findAll.action?category.id=15">毛绒公仔</a></li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a>包月鲜花</a>
                    </li>
                </ul>
					<ul class="nav navbar-nav navbar-right">
						<s:if test="#session.existUser!=null">
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown">Hi~ <s:property value="#session.existUser.username" /><b class="caret"></b>
						</a>
							<ul class="dropdown-menu">
								<li><a href="${pageContext.request.contextPath }/order_myorder.action">我的订单</a></li>
								<li><a href="${pageContext.request.contextPath }/cart_findAllCart.action">我的购物车</a></li>
								<li><a href="${pageContext.request.contextPath }/user_info.action">个人中心</a></li>
								<li><a href="${pageContext.request.contextPath }/user_quit.action">退出登录</a></li>
							</ul>
						</li>
						</s:if>
						<s:if test="#session.existUser==null">
						<li class="dropdown">
							<a href="${pageContext.request.contextPath }/user_login.action">登录</a>
						</li>
						</s:if>
					</ul>
				</div>
        </div>
    </nav>

    <!--轮播图区域-->
    <div id="myCarousel" class="carousel slide" data-ride="carousel" data-interval="3000">
        <div style="position: absolute; width: 200px; height: 300px; margin: 25px 230px; z-index: 10; background-color: white; opacity: 0.8; border-radius: 3px;">
            <div style="margin: auto; text-align: center; width: 180px;">
                <img src="images/weixin.jpg" width="180" height="180">
                <span style="font-size: 14px; font-family: 微软雅黑; line-height: 200%; display: block;">微信扫一扫</span>
                <span style="font-size: 14px; font-family: 微软雅黑; line-height: 200%; display: block;">在线订花优惠多多</span>
                <span style="font-size: 14px; font-family: 微软雅黑; line-height: 200%; display: block; color: black;">订花电话：1223454646</span>
                <span style="font-size: 14px; font-family: 微软雅黑; line-height: 200%; display: block;">一分钟下单，一小时送达！</span>
            </div>
        </div>
        <!-- 轮播（Carousel）指标 -->
        <ol class="carousel-indicators">
            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#myCarousel" data-slide-to="1"></li>
            <li data-target="#myCarousel" data-slide-to="2"></li>
        </ol>
        <!-- 轮播（Carousel）项目 -->
        <div class="carousel-inner">
            <div class="item active">
                <img src="./bootstrap/img/lunbo1.jpg" alt="First slide">
            </div>
            <div class="item">
                <img src="./bootstrap/img/lunbo2.jpg" alt="Second slide">
            </div>
            <div class="item">
                <img src="./bootstrap/img/lunbo3.jpg" alt="Third slide">
            </div>
        </div>
        <!-- 轮播（Carousel）导航 -->
        <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>