<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<div style="width: 100%; min-width: 1400px; background-color: #d9d9d9; height: 171px;">
        <div style="padding: 25px 25px; width: 80%;float: left;">
            <ul style="margin: 0px; padding: 0px; list-style: none;">
                <li style="display: inline-block; width: 100px;"><a href="${pageContext.request.contextPath }/AboutUs.jsp" style="text-decoration: none; color: #000000;">关于我们</a></li>
                <li style="display: inline-block; width: 100px;"><a href="${pageContext.request.contextPath }/Contact.jsp" style="text-decoration: none; color: #000000;">联系我们</a></li>
                <li style="display: inline-block; width: 100px;"><a href="${pageContext.request.contextPath }/Lease.jsp" style="text-decoration: none; color: #000000;">植物租赁</a></li>
                <li style="display: inline-block; width: 100px;"><a href="${pageContext.request.contextPath }/Cooperation.jsp" style="text-decoration: none; color: #000000;">商业合作</a></li>
                <li style="display: inline-block; width: 100px;"><a href="${pageContext.request.contextPath }/news_findAll.action" style="text-decoration: none; color: #000000;">资讯中心</a></li>
                <li style="display: inline-block; width: 100px;"><a href="${pageContext.request.contextPath }/Feedback.jsp" style="text-decoration: none; color: #000000;">即时反馈</a></li>
            </ul>
            <hr style="border-color: black;">
            <p>Copyright © 2018-2019&nbsp;&nbsp;心雨花屋&nbsp;&nbsp;版权所有&nbsp;&nbsp;&nbsp;&nbsp;手机版&nbsp;&nbsp;&nbsp;&nbsp;微信订花有惊喜&nbsp;&nbsp;&nbsp;&nbsp;订花电话：400 999 8888</p>
            <p>E-mail：kefu@999999.com&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;沪ICP备10000000号&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;技术支持：xiaohai</p>
        </div>
        <div style="width: 20%;float: left; padding-top: 20px;">
            <img src="bootstrap/img/weixin.jpg" width="100px" height="100px">
            <p>&nbsp;&nbsp;微&nbsp;信&nbsp;扫&nbsp;一&nbsp;扫</p>
        </div>

    </div>
</div>

<!--右侧-->
<div class="cndns-right">
    <div class="cndns-right-meau meau-car">
        <a href="${pageContext.request.contextPath }/cart_findAllCart.action" class="cndns-right-btn">
            <span class="demo-icon">&#xe900;</span>
            <sup id="mycartnum">0</sup>
        </a>
    </div>
    <div class="cndns-right-meau meau-code">
        <!-- <a href=#" class="cndns-right-btn" style="background-image: url(images/fkf-6.png);background-size: 100%;" title="疑难解答">
            <span class="demo-icon"></span>
        </a> -->
        <a href="${pageContext.request.contextPath }/Program.jsp" class="cndns-right-btn">
            <span class="demo-icon"><img alt="" src="images/fkf-6.png" width="30px" height="30px" style="margin-top: -10px;"></span>
            <p>
		                疑难<br />
		                解答
            </p>
        </a>
    </div>
    <div class="cndns-right-meau meau-sev">
        <a href="javascript:" class="cndns-right-btn">
            <span class="demo-icon">&#xe901;</span>
            <p>
                在线<br />
                客服
            </p>
        </a>
        <div class="cndns-right-box">
            <div class="box-border">
                <div class="sev-t">
                    <span class="demo-icon">&#xe901;</span>
                    <p>在线客服<i>服务时间：9:00-24:00</i></p><br><br>
                    <div class="clear"></div>
                    <div class="sev-b">
                        <h4>选择下列客服在线沟通：</h4>
                        <ul id="zixunUl">
                            <li><a href="http://wpa.qq.com/msgrd?v=3&amp;uin=941093035&amp;site=qq&amp;Menu=yes"
                                    class="qq skin02B" target="_blank">腾讯QQ客服</a></li>
                            <div class="clear"></div>
                        </ul>
                    </div>
                </div>
                <span class="arrow-right"></span>
            </div>
        </div>
    </div>
    <div class="cndns-right-meau meau-contact">
        <a href="javascript:" class="cndns-right-btn">
            <span class="demo-icon">&#xe902;</span>
            <p>
                客服<br />
                热线
            </p>
        </a>
        <div class="cndns-right-box">
            <div class="box-border">
                <div class="sev-t">
                    <span class="demo-icon">&#xe902;</span>
                    <p>400-000-0000<br /><i>7*24小时客服服务热线</i></p>
                    <div class="clear"></div>
                </div>
                <span class="arrow-right"></span>
            </div>
        </div>
    </div>
    <div class="cndns-right-meau meau-code">
        <a href="javascript:" class="cndns-right-btn">
            <span class="demo-icon">&#xe903;</span>
            <p>
                关注<br />
                微信
            </p>
        </a>
        <div class="cndns-right-box">
            <div class="box-border" style="width: 200px;">
                <div class="sev-t">
                    <img src="images/saoma.jpg" />
                    <i>关注官方微信</i>
                </div>
                <span class="arrow-right"></span>
            </div>
        </div>
    </div>
    <div class="cndns-right-meau meau-top" id="top-back">
        <a href="javascript:" class="cndns-right-btn" onclick="topBack()">
            <span class="demo-icon">&#xe904;</span>
            <i>顶部</i>
        </a>
    </div>

</div>
<script type="text/javascript">
    //置顶图标显示
    $('#top-back').hide()
    $(window).scroll(function(){
        if($(this).scrollTop() > 100){
            $("#top-back").fadeIn();
        }
        else{
            $("#top-back").fadeOut();
        }
    })
    //置顶事件
    function topBack(){
        $('body,html').animate({scrollTop:0},300);
    }
</script>
</body>
</html>