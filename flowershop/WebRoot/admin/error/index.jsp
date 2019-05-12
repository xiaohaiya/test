<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>多肉之家-后台管理</title>
    <link rel="SHORTCUT ICON" href="${pageContext.request.contextPath }/admin/images/logo.ico">
    <link rel="BOOKMARK" href="${pageContext.request.contextPath }/admin/images/logo.ico">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/admin/error/main.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/admin/error/style.css" media="screen"/>
</head>
<body>
<div class="fill">
  <div class="reference"></div>
  <div class="clock" id="utility-clock" style="transform: scale(1.529);">
    <div class="centre">
      <div class="dynamic">
      	<div class="anchor" style="transform: rotate(6deg);">
	      <div class="element minute-line"></div>
	    </div>
	    <div class="anchor" style="transform: rotate(12deg);">
	    	<div class="element minute-line"></div>
	    </div>
	    <div class="anchor" style="transform: rotate(18deg);">
	    	<div class="element minute-line"></div>
	    </div>
	    <div class="anchor" style="transform: rotate(24deg);">
	    	<div class="element minute-line"></div>
	    </div>
	    <div class="minute-text" style="top: -116.9px; left: 67.5px;">05</div>
	    <div class="anchor" style="transform: rotate(36deg);">
	    	<div class="element minute-line"></div>
	    </div>
	    <div class="anchor" style="transform: rotate(42deg);">
	    	<div class="element minute-line"></div>
	    </div>
	    <div class="anchor" style="transform: rotate(48deg);">
	    	<div class="element minute-line"></div>
	    </div><div class="anchor" style="transform: rotate(54deg);">
	    	<div class="element minute-line"></div>
	    </div>
	    <div class="minute-text" style="top: -67.5px; left: 116.9px;">10</div>
	    <div class="anchor" style="transform: rotate(66deg);">
	    	<div class="element minute-line"></div>
	    </div><div class="anchor" style="transform: rotate(72deg);">
	    	<div class="element minute-line"></div>
	    </div>
	    <div class="anchor" style="transform: rotate(78deg);">
	    	<div class="element minute-line"></div>
	    </div>
	    <div class="anchor" style="transform: rotate(84deg);">
	    	<div class="element minute-line"></div>
	    </div>
	    <div class="minute-text" style="top: 0px; left: 135px;">15</div>
	    <div class="anchor" style="transform: rotate(96deg);">
	    	<div class="element minute-line"></div>
	    </div>
	    <div class="anchor" style="transform: rotate(102deg);">
	    	<div class="element minute-line"></div>
	    </div>
	    <div class="anchor" style="transform: rotate(108deg);">
	    	<div class="element minute-line"></div>
	    </div>
	    <div class="anchor" style="transform: rotate(114deg);">
	    	<div class="element minute-line"></div>
	    </div>
	    <div class="minute-text" style="top: 67.5px; left: 116.9px;">20</div>
	    <div class="anchor" style="transform: rotate(126deg);"><div class="element minute-line"></div></div><div class="anchor" style="transform: rotate(132deg);"><div class="element minute-line"></div></div>
	    <div class="anchor" style="transform: rotate(138deg);"><div class="element minute-line"></div></div><div class="anchor" style="transform: rotate(144deg);"><div class="element minute-line"></div></div>
	    <div class="minute-text" style="top: 116.9px; left: 67.5px;">25</div><div class="anchor" style="transform: rotate(156deg);"><div class="element minute-line"></div></div><div class="anchor" style="transform: rotate(162deg);"><div class="element minute-line"></div></div>
	    <div class="anchor" style="transform: rotate(168deg);"><div class="element minute-line"></div></div><div class="anchor" style="transform: rotate(174deg);"><div class="element minute-line"></div></div><div class="minute-text" style="top: 135px; left: 0px;">30</div>
	    <div class="anchor" style="transform: rotate(186deg);"><div class="element minute-line"></div></div><div class="anchor" style="transform: rotate(192deg);"><div class="element minute-line"></div></div><div class="anchor" style="transform: rotate(198deg);"><div class="element minute-line"></div></div>
	    <div class="anchor" style="transform: rotate(204deg);"><div class="element minute-line"></div></div>
	    <div class="minute-text" style="top: 116.9px; left: -67.5px;">35</div>
	    <div class="anchor" style="transform: rotate(216deg);"><div class="element minute-line"></div></div>
	    <div class="anchor" style="transform: rotate(222deg);"><div class="element minute-line"></div></div>
	    <div class="anchor" style="transform: rotate(228deg);"><div class="element minute-line"></div></div>
	    <div class="anchor" style="transform: rotate(234deg);"><div class="element minute-line"></div></div>
	    <div class="minute-text" style="top: 67.5px; left: -116.9px;">40</div>
	    <div class="anchor" style="transform: rotate(246deg);"><div class="element minute-line"></div></div>
	    <div class="anchor" style="transform: rotate(252deg);"><div class="element minute-line"></div></div>
	    <div class="anchor" style="transform: rotate(258deg);"><div class="element minute-line"></div></div>
	    <div class="anchor" style="transform: rotate(264deg);"><div class="element minute-line"></div></div>
	    <div class="minute-text" style="top: 0px; left: -135px;">45</div>
	    <div class="anchor" style="transform: rotate(276deg);"><div class="element minute-line"></div></div>
	    <div class="anchor" style="transform: rotate(282deg);"><div class="element minute-line"></div></div>
	    <div class="anchor" style="transform: rotate(288deg);"><div class="element minute-line"></div></div>
	    <div class="anchor" style="transform: rotate(294deg);"><div class="element minute-line"></div></div>
	    <div class="minute-text" style="top: -67.5px; left: -116.9px;">50</div>
	    <div class="anchor" style="transform: rotate(306deg);"><div class="element minute-line"></div></div>
	    <div class="anchor" style="transform: rotate(312deg);"><div class="element minute-line"></div></div>
	    <div class="anchor" style="transform: rotate(318deg);"><div class="element minute-line"></div></div>
	    <div class="anchor" style="transform: rotate(324deg);"><div class="element minute-line"></div></div>
	    <div class="minute-text" style="top: -116.9px; left: -67.5px;">55</div>
	    <div class="anchor" style="transform: rotate(336deg);"><div class="element minute-line"></div></div>
	    <div class="anchor" style="transform: rotate(342deg);"><div class="element minute-line"></div></div>
	    <div class="anchor" style="transform: rotate(348deg);"><div class="element minute-line"></div></div>
	    <div class="anchor" style="transform: rotate(354deg);"><div class="element minute-line"></div></div>
	    <div class="minute-text" style="top: -135px; left: 0px;">60</div>
	    <div class="hour-text hour-1" style="top: -90.9px; left: 52.5px;">1</div>
	    <div class="hour-text hour-2" style="top: -52.5px; left: 90.9px;">2</div>
	    <div class="hour-text hour-3" style="top: 0px; left: 105px;">3</div>
	    <div class="hour-text hour-4" style="top: 52.5px; left: 90.9px;">4</div>
	    <div class="hour-text hour-5" style="top: 90.9px; left: 52.5px;">5</div>
	    <div class="hour-text hour-6" style="top: 105px; left: 0px;">6</div>
	    <div class="hour-text hour-7" style="top: 90.9px; left: -52.5px;">7</div>
	    <div class="hour-text hour-8" style="top: 52.5px; left: -90.9px;">8</div>
	    <div class="hour-text hour-9" style="top: 0px; left: -105px;">9</div>
	    <div class="hour-text hour-10" style="top: -52.5px; left: -90.9px;">10</div>
	    <div class="hour-text hour-11" style="top: -90.9px; left: -52.5px;">11</div>
	    <div class="hour-text hour-12" style="top: -105px; left: 0px;">12</div>
	  </div>
      <div class="expand round circle-1"></div>
      <div class="anchor hour" style="transform: rotate(414.504deg);">
        <div class="element thin-hand"></div>
        <div class="element fat-hand"></div>
      </div>
      <div class="anchor minute" style="transform: rotate(4974.05deg);">
        <div class="element thin-hand"></div>
        <div class="element fat-hand minute-hand"></div>
      </div>
      <div class="anchor second" style="transform: rotate(298443deg);">
        <div class="element second-hand"></div>
      </div>
      <div class="expand round circle-2"></div>
      <div class="expand round circle-3"></div>
    </div>
  </div>
</div>
<div style="top:200px; position: fixed; left: 50px;">
    <div class="ih-item circle effect13 from_left_and_right"><a href="#">
        <div class="img"><img src="${pageContext.request.contextPath }/admin/images/timg1.jpg" alt="img"></div>
        <div class="info">
          <div class="info-back">
            <h3>温馨提示：</h3>
            <p>你访问的页面不存在或系统出现错误！</p>
          </div>
        </div></a></div>
</div>
<script src="${pageContext.request.contextPath }/admin/error/app.js"></script>
<script src="${pageContext.request.contextPath }/admin/error/index.js"></script>
</body></html>