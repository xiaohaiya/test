<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:include page="head.jsp"></jsp:include>
<div style="margin: auto; width: 1000px; margin-bottom: 45px;">
        <div style="width: 500px; height: 460px; background-color: white; position: absolute; ">
            <div style="margin-left: 40px; width: 400px; height: 440px; padding-top: 20px;">
                <h3 style="color: #2BAF7B;">联系方式</h3>
                <p style="height: 1px;"></p>
                <p style="color: #696969; line-height: 45px; font-size: 15px;">电话：800-0885-460</p>
                <p style="color: #696969; line-height: 45px; font-size: 15px;">网址：www.liuhaile.xyz</p>
                <p style="color: #696969; line-height: 45px; font-size: 15px;">邮箱：941093035@qq.com</p>
                <p style="color: #696969; line-height: 45px; font-size: 15px;">地址：武汉商学院</p><br/>
                <h3 style="color: #2BAF7B;">配送时间</h3>
                <p style="height: 1px;"></p>
                <p style="color: #696969; line-height: 45px; font-size: 15px;">周一——周六</p>
                <p style="color: #696969; line-height: 45px; font-size: 15px;">上午：10:00-14:00，下午：15:00-20:00</p>
            </div>
        </div>
        <div style="width: 500px; height: 460px; background-color: #2BAF7B;  margin-left: 500px; margin-top: 40px;">
            <div style="margin-left: 40px; width: 420px; height: 440px; padding-top: 20px;">
                <p style="color: #FFFFFF;">请将您所遇到的问题反馈给我们</p><br><br>
                <form action="${pageContext.request.contextPath }/feedback_add.action" method="post">
                <div style="width: 420px; height: 340px;">
                    <input name="name" maxlength="16" style="background-color: #2BAF7B; width: 426px; height:30px; border: 1px solid white;" type="text" placeholder="姓名(必填)" required oninvalid="setCustomValidity('请填写姓名！')" oninput="setCustomValidity('')">
                    <input name="email" style="background-color: #2BAF7B; width: 426px; height:30px; border: 1px solid white; margin-top: 25px;" type="email" placeholder="邮箱(必填)"  required oninvalid="setCustomValidity('请填写正确的邮箱！')" oninput="setCustomValidity('')">
                    <input name="phone" maxlength="11" style="background-color: #2BAF7B; width: 426px; height:30px; border: 1px solid white; margin-top: 25px;" pattern="1[0-9]{10}" oninvalid="setCustomValidity('输入11位有效手机号码！')" oninput="setCustomValidity('')" type="text" placeholder="联系电话(选填)">
                    <textarea name="questions" rows="4" cols="57" style="border: 1px solid white; background-color: #2BAF7B; font-size: 14px; margin-top: 25px;" placeholder="内容(必填)" required oninvalid="setCustomValidity('请填写内容')" oninput="setCustomValidity('')"></textarea>
                    <div style="width: 420px; height: 50px; padding-top: 30px;">
                        <input type="submit" value="发送" style="width: 90px; height: 35px; color: #2BAF7B; font-size: 18px; font-weight: bolder; background-color: white; border: none;">
                    </div>
                </div>
                </form>
            </div>
        </div>
    </div>
<jsp:include page="bottom.jsp"></jsp:include>
