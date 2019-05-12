<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:include page="head.jsp"></jsp:include>

<div class="user-page-content">
<div class="clearfix w">
<script type="text/javascript">
function displayed(i){
   $("#ul"+i).toggle();
   if($("#ss"+i).attr("class")=="user_ss"){
	  $("#ss"+i).attr("class","user_tt");
   }else{
	  $("#ss"+i).attr("class","user_ss");
   }
 }
    </script>
<div class="user_menu">
    <div class="navs" id="JS_u_navs">
        <div id="ss1" style="cursor: pointer;" onclick="displayed(1);"><h3><span class="s1"></span>订单中心</h3></div>
        <ul id="ul1">
            <li><a href="#">我的订单</a></li>
            <li><a href="#">退货订单</a></li>
            <li><a href="#">站内信息</a></li>
        </ul>
        
        <div id="ss2" style="cursor: pointer;" onclick="displayed(2);"><h3><span class="s2"></span>账户管理</h3></div>
        <ul id="ul2">
            <li><a href="#">个人资料</a></li>
            <li><a href="#">收货地址</a></li>
            <li><a href="#">修改密码</a></li>
        </ul>
        
        <div id="ss3" style="cursor: pointer;" onclick="displayed(3);"><h3><span class="s3"></span>服务与评价</h3></div>
        <ul id="ul3">
            <li><a href="#">商品评论</a></li>
            <li><a href="#">购买咨询</a></li>
        </ul>
    </div>
</div>
    	<div class="user_main">
         	<div class="content-one content-hei">
            	<div class="user_title">
                	修改头像
                    <span class="fr">
                    	<a href="/shopMember/profile.jspx" class="no_button">返回个人资料</a>
                    </span>
                </div>
                <form id="jvForm" action="updateAvatar.jspx" method="post">
                <table border="0" align="center" cellpadding="3" cellspacing="0" style="margin:5px auto;">  
                <tr>
                <td width="115" height="115" align="left">
                	<img src="/u/201903/15124436bgdg.gif" alt="预览" width="100" height="100" id="preImg0" noResize="true"/>
                </td>
                <td>
                <div style=" margin:12px 0; overflow:hidden;">
                    <input type="text" id="uploadImgPath0" name="picPaths" vld="{required:true}" value="/u/201903/15124436bgdg.gif" style="width:350px; height:27px;" class="ss_input fl" />
                    <input type="hidden" id="zoomWidth0" name="zoomWidth" value="100"/>
                    <input type="hidden" id="zoomHeight0" name="zoomHeight" value="100"/>
                    <a href="javascript:void(0);" onclick="$('#picTable0').remove();" style="background:#ddd; width:60px; border:0; color:#000; display:block; height:30px; line-height:30px; text-align:center; float:left; margin-left:10px; margin-top:4px; ">删除</a>
                </div>
                <div>
                    <span id="ufc0">
                    <input type="file" id="uploadFile0" size="10" style="width:350px;" class="ss_input fl" />
                    </span> 
                    <input type="button" value="上传" onclick="upload(0);" style="background:#ddd; width:60px; border:0; color:#000; display:block; height:30px; line-height:30px; text-align:center; float:left; margin-left:10px; margin-top:4px; font-size:12px;" />
                </div>
                </td>
                </tr>
                <tr>
                <td colspan="2"></td>
                </tr>
                <tr>
                <td height="80">
                &nbsp;
				</td>
                <td height="80">
                <input type="submit" value="提交" class="ss_button" />&nbsp;&nbsp;
                <input type="reset" value="重置" class="no_button" />
                </td>
                </tr>
                </table>
                </form>
            </div>
         </div>   	
    </div>
</div>
<jsp:include page="bottom.jsp"></jsp:include>