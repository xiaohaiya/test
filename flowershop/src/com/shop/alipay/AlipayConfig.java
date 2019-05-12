package com.shop.alipay;

import java.io.FileWriter;
import java.io.IOException;

/* *
 *类名：AlipayConfig
 *功能：基础配置类
 *详细：设置帐户有关信息及返回路径
 *修改日期：2017-04-05
 *说明：
 *以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
 *该代码仅供学习和研究支付宝接口使用，只是提供一个参考。
 */

public class AlipayConfig {
	
//↓↓↓↓↓↓↓↓↓↓请在这里配置您的基本信息↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓

	// 应用ID,您的APPID，收款账号既是您的APPID对应支付宝账号
	//public static String app_id = "2018092261517145";
	public static String app_id = "2016092100564659";
	
	// 商户私钥，您的PKCS8格式RSA2私钥
    public static String merchant_private_key = "MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCzhPox7ugEQvtLbWA2Wx6MjJl66So7O5g73O8FnfA4u9sCY0PG7hUu/RySo9xXuqq2/n/qZLvKYRveyOsReOVB/qmiNR667wDlOTL5lZN+jrKVTCEu5jul8l9Jy3yapZDAbqZ/fQZ1JUzSSXbc90cJUeBLT/vYedbsla+C5PnHvt0siJ9rxSPkxgbrYJyyPmjQLMsrR4grZx2cGHX9wYtdHBNsjraHJLO3PrEtXFcuY1oskRbd457JEeIn9LC+mMVykRFopEMxG/Z3sYtT6xZfQnVM/ccLedilH01h7ekNmx0D72i4MVn2YrMQOfFul+BDeKtIF6IKdNKencn8iQs9AgMBAAECggEBAKD9zzZ6jx5LR3t0QkVc3/+hk36zncjy/+onjz+VTTpD1fvFM6IyH1M9cKNdShxu7ewgPmzhG7w57DmWK6FGryrJDC3Iv59a+Y2YB0vmxRhJNoRHerbJiJKg0q2mTD+P3UmFsdFBOUpTQhqQAYXWSKFmCOThfPS9B26yKm0TlaF32ijxr3yaaX7/MhZ/c1p3VasKEgUJMkcDh7aI3HS/5ENRQo9Rxby9WyKUjfnnkvGxoJV8je4WIFnyKxBFMsxDiSaGMbLQ94xOJxg5BJyWhiXQ5TtKJb/siEugSiUF9TUybDfy65PDrpAMXHyBVDEHbOGkqkSKm3I7zFA884+3FYECgYEA7CeRS7a5jINEmykD39fYAnjSaw9kiT8/hkD2TgYIxzR1ifEXVXYYLj3qCJrasyrruVZl+6ano0Cyq7HLfK+WBBBo5IDQ+tI52WZX99R4ekbcFbvBu5nPdqETMYWmUwhwvziWyvv20169B+ZWmq2z2QIpykbD+jfz7LjbR5FXpSECgYEAwpsCT27XAiWkPqXs9hi9oJSI8CPIYGGbqgq1+zftn4RzKnxDEQO5azIvdCPmDwChFKWEvKiVYdploPLmSAyqec0IQopdmh9TWRe1c9nKH0IedtOAS232Qkmzp0cWGXQ5ttZN+iXm8kR5fqTodmnvM4JXYJsRTNytbcL6YaSqBp0CgYBGTjVUfC7bZU0sgFZ18rWNbtj+JJQCxECuQHLTobpFTBneGlefCsyCH86oByorAxEwmUc9V007LgzDTuhM051u0k/YD32n3qR4U57G2ouPo77r/Xzc1BrOr3+eU7LDr5SZaUiDX+YI4YCXdHy+Cg6sAZfdb5nyyWumQxaNRPj54QKBgC6riAlOtqegKVyQ5Fw8oLVzCcg1fKeIoRFNkkkWJ5ma5ReqR1c8Qmpv1auPtGuipf7Slxu7fl/CRZ8swYdD6lpdjn6OulXs70stgWmwMGYAsFek716nl2hcToZuaOFf2zt696ZnEpTFUTHLEKjdTO1Yc+YKKkL5pWnuWaezGseNAoGATkrO0WcfdWN4lGE60bbNAQAftd9PYtBYpCrj1yfZIQz8Ajks+HRqxL46mbSFPhONaCFhB8WmK0LhhA/bmAEuw748qawBvKW0DuyFgj6UH9h6/uCZYrkaFA91aeJL9J6LjnUAiBSL6rGbZutZkF/BSsTTD3OxWj18glfcenM8q9I=";
    
	// 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
    public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA51tKe1tQy9DpQu9aYRbFUStan0mDzcycWswqxQ1weioPEoO5vwPB5s/OvGXpW1f1POKcxn7VSmVXf+kth7+KRhyhe1e9bqhUnyn3t+64TOx7k5IjYDFTEuEIlSLfw95gj4CEjCyM2w6cEsYEwEOKcbUUVRyT3V4g+ea0c05cC3cPYnh2gocrBLTNP7FKhCj5WTGSudcxaK9I2+L69IS3+li7mIZEoP3/KmL1CJKhnwUnBGONioCt4LJkfeOiGqwQK4vCRWIwnDToalpXrM4zD+GcTS4FzyagjApsKRxBoQRHWVvjFn67Xy4vZD27L3uGcM8cLoJQtHUKIm8Mzde6swIDAQAB";
	// 服务器异步通知页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String notify_url = "http://www.liuhaile.xyz/flowershop/order_aliajaxreturn.action";

	// 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String return_url = "http://www.liuhaile.xyz/flowershop/order_alireturn.action";

	// 签名方式
	public static String sign_type = "RSA2";
	
	// 字符编码格式
	public static String charset = "utf-8";
	
	// 支付宝网关
	//public static String gatewayUrl = "https://openapi.alipay.com/gateway.do";
	public static String gatewayUrl = "https://openapi.alipaydev.com/gateway.do";
	//public static final String OPEN_API_DOMAIN="https://openapi.alipaydev.com/gateway.do";
	
	// 支付宝网关
	public static String log_path = "C:\\";


//↑↑↑↑↑↑↑↑↑↑请在这里配置您的基本信息↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

    /** 
     * 写日志，方便测试（看网站需求，也可以改成把记录存入数据库）
     * @param sWord 要写入日志里的文本内容
     */
    public static void logResult(String sWord) {
        FileWriter writer = null;
        try {
            writer = new FileWriter(log_path + "alipay_log_" + System.currentTimeMillis()+".txt");
            writer.write(sWord);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (writer != null) {
                try {
                    writer.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}

