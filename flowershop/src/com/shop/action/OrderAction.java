package com.shop.action;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;

import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.internal.util.AlipaySignature;
import com.alipay.api.request.AlipayTradePagePayRequest;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.shop.alipay.AlipayConfig;
import com.shop.entity.Order;
import com.shop.entity.Shopuser;
import com.shop.service.OrderService;
import com.shop.utils.PageModel;
import com.shop.ylsdk.AcpService;
import com.shop.ylsdk.LogUtil;
import com.shop.ylsdk.SDKConfig;
import com.shop.ylsdk.SDKConstants;

public class OrderAction extends ActionSupport implements ModelDriven<Order> {

	private Order order = new Order();
	public Order getModel() {
		return order ;
	}
	private OrderService orderService;
	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}
	/**
	 * 提交订单操作
	 * @throws IOException 
	 */
	public void save() throws IOException{
		Shopuser user = (Shopuser) ServletActionContext.getRequest().getSession().getAttribute("existUser");
		order.setUser(user);
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		order.setId(dateFormat.format(new Date()));
		order.setCreatetime(new Date());
		order.setStatus(0);
		orderService.save(order);
		ServletActionContext.getResponse().sendRedirect("order_payment.action?id="+order.getId());
	}
	public String payment(){
		ServletActionContext.getRequest().setAttribute("orderid", order.getId());
		return "save";
	}
	/**
	 * 支付订单
	 */
	public String pay(){
		order = orderService.findById(order);
		ActionContext.getContext().put("order", order);
		return "pay";
	}
	/**
	 * 分页查询所有订单
	 */
	private Integer currPage=1;
	public void setCurrPage(Integer currPage) {
		if(currPage==null) {
			currPage=1;
		}
		this.currPage = currPage;
	}
	public String myorder() {
		Shopuser user = (Shopuser) ServletActionContext.getRequest().getSession().getAttribute("existUser");
		//使用detachedcriteria进行查询
		DetachedCriteria detachedCriteria = DetachedCriteria.forClass(Order.class);
		//按条件查询
		detachedCriteria.add(Restrictions.eq("user",user));
		if(order.getStatus()!=10) {
			detachedCriteria.add(Restrictions.eq("status",order.getStatus()));
		}
		detachedCriteria.addOrder(org.hibernate.criterion.Order.desc("createtime"));
		PageModel<Order> pageModel = new PageModel<Order>();
		pageModel.setCurrPage(currPage);
		pageModel.setPageSize(5);
		pageModel = orderService.findByPage(detachedCriteria,pageModel);
		//将数据放入值栈中
		ServletActionContext.getContext().getValueStack().push(pageModel);
		return "myorder";
	}
	/***
	 * 订单详情页
	 * @return
	 */
	public String orderinfo(){
		order = orderService.findById(order);
		ActionContext.getContext().put("orderinfo", order);
		return "orderinfo";
	}
	/**
	 * 订单支付
	 */
	private String code;
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public void orderpay() throws IOException{
		if(code.equals("yinlian")){
			ServletActionContext.getResponse().sendRedirect("order_ylpay.action?id="+order.getId());
		}else if(code.equals("alipay")){
			ServletActionContext.getResponse().sendRedirect("order_Alipay.action?id="+order.getId());
		}else{
			ServletActionContext.getResponse().sendRedirect("/error.jsp");
		}
	}
	/**
	 * 取消订单
	 * @return
	 * @throws IOException 
	 */
	public void cancle() throws IOException{
		order.setStatus(3);
		order.setUpdatetime(new Date());
		orderService.updatestatus(order);
		ServletActionContext.getResponse().setContentType("text/html;charset=utf-8");
		ServletActionContext.getResponse().getWriter().write("<script type=\"text/javascript\">alert(\"订单取消成功！\");window.location.href=\"order_myorder.action\";</script>");
	}
	/**
	 * 确认收货
	 * @return
	 * @throws IOException 
	 */
	public void receipt() throws IOException{
		order.setStatus(2);
		order.setUpdatetime(new Date());
		orderService.updatestatus(order);
		ServletActionContext.getResponse().setContentType("text/html;charset=utf-8");
		ServletActionContext.getResponse().getWriter().write("<script type=\"text/javascript\">alert(\"收货成功！\");window.location.href=\"order_myorder.action\";</script>");
	}
	/**
	 * 退货申请
	 * @return
	 * @throws IOException 
	 */
	public void tuihuo() throws IOException{
		order.setStatus(5);
		order.setUpdatetime(new Date());
		orderService.updatestatus(order);
		ServletActionContext.getResponse().setContentType("text/html;charset=utf-8");
		ServletActionContext.getResponse().getWriter().write("<script type=\"text/javascript\">alert(\"申请成功，等待商家退货！\");window.location.href=\"order_myorder.action\";</script>");
	}
	/**
	 * 退货的订单
	 * @return
	 */
	public String returnOrder(){
		Shopuser user = (Shopuser) ServletActionContext.getRequest().getSession().getAttribute("existUser");
		//使用detachedcriteria进行查询
		DetachedCriteria detachedCriteria = DetachedCriteria.forClass(Order.class);
		//按条件查询
		detachedCriteria.add(Restrictions.eq("user",user));
		detachedCriteria.add(Restrictions.or(Restrictions.eq("status", 4),Restrictions.eq("status", 5)));
		detachedCriteria.addOrder(org.hibernate.criterion.Order.desc("status"));
		detachedCriteria.addOrder(org.hibernate.criterion.Order.desc("updatetime"));
		PageModel<Order> pageModel = new PageModel<Order>();
		pageModel.setCurrPage(currPage);
		pageModel.setPageSize(10);
		pageModel = orderService.findByPage(detachedCriteria,pageModel);
		//将数据放入值栈中
		ServletActionContext.getContext().getValueStack().push(pageModel);
		
		return "returnorder";
	}
	
	/**
	 * 银联支付接口
	 * @throws IOException
	 */
	public void ylpay() throws IOException{
		ServletActionContext.getResponse().setContentType("text/html; charset="+ "UTF-8");
		//前台页面传过来的
		//String merId = "777290058110048";
		String merId = "700000000000001";
		String txnAmt = "1";
		String orderId = order.getId();
		String txnTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		
		Map<String, String> requestData = new HashMap<String, String>();
		
		/***银联全渠道系统，产品参数，除了encoding自行选择外其他不需修改***/
		requestData.put("version", SDKConfig.getConfig().getVersion());   			  //版本号，全渠道默认值
		requestData.put("encoding", "UTF-8"); 			  //字符集编码，可以使用UTF-8,GBK两种方式
		requestData.put("signMethod", SDKConfig.getConfig().getSignMethod()); //签名方法
		requestData.put("txnType", "01");               			  //交易类型 ，01：消费
		requestData.put("txnSubType", "01");            			  //交易子类型， 01：自助消费
		requestData.put("bizType", "000201");           			  //业务类型，B2C网关支付，手机wap支付
		requestData.put("channelType", "07");           			  //渠道类型，这个字段区分B2C网关支付和手机wap支付；07：PC,平板  08：手机
		
		/***商户接入参数***/
		requestData.put("merId", merId);    	          			  //商户号码，请改成自己申请的正式商户号或者open上注册得来的777测试商户号
		requestData.put("accessType", "0");             			  //接入类型，0：直连商户 
		requestData.put("orderId",orderId);             //商户订单号，8-40位数字字母，不能含“-”或“_”，可以自行定制规则		
		requestData.put("txnTime", txnTime);        //订单发送时间，取系统时间，格式为yyyyMMddHHmmss，必须取当前时间，否则会报txnTime无效
		requestData.put("currencyCode", "156");         			  //交易币种（境内商户一般是156 人民币）		
		requestData.put("txnAmt", txnAmt);             			      //交易金额，单位分，不要带小数点
		//requestData.put("reqReserved", "透传字段");        		      //请求方保留域，如需使用请启用即可；透传字段（可以实现商户自定义参数的追踪）本交易的后台通知,对本交易的交易状态查询交易、对账文件中均会原样返回，商户可以按需上传，长度为1-1024个字节。出现&={}[]符号时可能导致查询接口应答报文解析失败，建议尽量只传字母数字并使用|分割，或者可以最外层做一次base64编码(base64编码之后出现的等号不会导致解析失败可以不用管)。		
		
		requestData.put("riskRateInfo", "{commodityName=心雨花屋测试商品}");
		
		//前台通知地址 （需设置为外网能访问 http https均可），支付成功后的页面 点击“返回商户”按钮的时候将异步通知报文post到该地址
		//如果想要实现过几秒中自动跳转回商户页面权限，需联系银联业务申请开通自动返回商户权限
		//异步通知参数详见open.unionpay.com帮助中心 下载  产品接口规范  网关支付产品接口规范 消费交易 商户通知
		requestData.put("frontUrl", SDKConfig.getConfig().getFrontUrl());
		
		//后台通知地址（需设置为【外网】能访问 http https均可），支付成功后银联会自动将异步通知报文post到商户上送的该地址，失败的交易银联不会发送后台通知
		//后台通知参数详见open.unionpay.com帮助中心 下载  产品接口规范  网关支付产品接口规范 消费交易 商户通知
		//注意:1.需设置为外网能访问，否则收不到通知    2.http https均可  3.收单后台通知后需要10秒内返回http200或302状态码 
		//    4.如果银联通知服务器发送通知后10秒内未收到返回状态码或者应答码非http200，那么银联会间隔一段时间再次发送。总共发送5次，每次的间隔时间为0,1,2,4分钟。
		//    5.后台通知地址如果上送了带有？的参数，例如：http://abc/web?a=b&c=d 在后台通知处理程序验证签名之前需要编写逻辑将这些字段去掉再验签，否则将会验签失败
		requestData.put("backUrl", SDKConfig.getConfig().getBackUrl());

		// 订单超时时间。
		// 超过此时间后，除网银交易外，其他交易银联系统会拒绝受理，提示超时。 跳转银行网银交易如果超时后交易成功，会自动退款，大约5个工作日金额返还到持卡人账户。
		// 此时间建议取支付时的北京时间加15分钟。
		// 超过超时时间调查询接口应答origRespCode不是A6或者00的就可以判断为失败。
		requestData.put("payTimeout", new SimpleDateFormat("yyyyMMddHHmmss").format(new Date().getTime() + 15 * 60 * 1000));
		
		//////////////////////////////////////////////////
		//
		//       报文中特殊用法请查看 PCwap网关跳转支付特殊用法.txt
		//
		//////////////////////////////////////////////////
		
		/**请求参数设置完毕，以下对请求参数进行签名并生成html表单，将表单写入浏览器跳转打开银联页面**/
		Map<String, String> submitFromData = AcpService.sign(requestData,"UTF-8");  //报文中certId,signature的值是在signData方法中获取并自动赋值的，只要证书配置正确即可。
		
		String requestFrontUrl = SDKConfig.getConfig().getFrontRequestUrl();  //获取请求银联的前台地址：对应属性文件acp_sdk.properties文件中的acpsdk.frontTransUrl
		String html = AcpService.createAutoFormHtml(requestFrontUrl, submitFromData,"UTF-8");   //生成自动跳转的Html表单
		
		LogUtil.writeLog("打印请求HTML，此为请求报文，为联调排查问题的依据："+html);
		//将生成的html写到浏览器中完成自动跳转打开银联支付页面；这里调用signData之后，将html写到浏览器跳转到银联页面之前均不能对html中的表单项的名称和值进行修改，如果修改会导致验签不通过
		ServletActionContext.getResponse().getWriter().write(html);
	}
	
	public String ylback() throws IOException{
		LogUtil.writeLog("FrontRcvResponse前台接收报文返回开始");
		HttpServletRequest req = ServletActionContext.getRequest();
		String encoding = req.getParameter(SDKConstants.param_encoding);
		LogUtil.writeLog("返回报文中encoding=[" + encoding + "]");
		Map<String, String> respParam = getAllRequestParam(req);

		// 打印请求报文
		LogUtil.printRequestLog(respParam);

		Map<String, String> valideData = null;
		StringBuffer page = new StringBuffer();
		if (null != respParam && !respParam.isEmpty()) {
			Iterator<Entry<String, String>> it = respParam.entrySet()
					.iterator();
			valideData = new HashMap<String, String>(respParam.size());
			while (it.hasNext()) {
				Entry<String, String> e = it.next();
				String key = (String) e.getKey();
				String value = (String) e.getValue();
				value = new String(value.getBytes(encoding), encoding);
				page.append("<tr><td width=\"30%\" align=\"right\">" + key
						+ "(" + key + ")</td><td>" + value + "</td></tr>");
				valideData.put(key, value);
			}
		}
		if (!AcpService.validate(valideData, encoding)) {
			page.append("<tr><td width=\"30%\" align=\"right\">验证签名结果</td><td>失败</td></tr>");
			LogUtil.writeLog("验证签名结果[失败].");
		} else {
			page.append("<tr><td width=\"30%\" align=\"right\">验证签名结果</td><td>成功</td></tr>");
			LogUtil.writeLog("验证签名结果[成功].");
			//System.out.println(valideData.get("orderId")); //其他字段也可用类似方式获取
			order.setId(valideData.get("orderId"));
			order.setUpdatetime(new Date());
			order.setStatus(1);
			orderService.updatestatus(order);
			//String respCode = valideData.get("respCode");
			//判断respCode=00、A6后，对涉及资金类的交易，请再发起查询接口查询，确定交易成功后更新数据库。
		}
		LogUtil.writeLog("FrontRcvResponse前台接收报文返回结束");
		ActionContext.getContext().put("order", order);
		return "paysucess";
	}
	public void ylajaxback(){
		System.out.println("银联异步来了");
	}
	/**
	 * 支付宝支付
	 * @throws AlipayApiException
	 * @throws IOException
	 */
	public void Alipay() throws AlipayApiException, IOException{
		
		//获得初始化的AlipayClient
		AlipayClient alipayClient = new DefaultAlipayClient(AlipayConfig.gatewayUrl, AlipayConfig.app_id, AlipayConfig.merchant_private_key, "json", AlipayConfig.charset, AlipayConfig.alipay_public_key, AlipayConfig.sign_type);
		
		//设置请求参数
		AlipayTradePagePayRequest alipayRequest = new AlipayTradePagePayRequest();
		alipayRequest.setReturnUrl(AlipayConfig.return_url);
		alipayRequest.setNotifyUrl(AlipayConfig.notify_url);
		
		//商户订单号，商户网站订单系统中唯一订单号，必填
		String out_trade_no = order.getId();
		//付款金额，必填
		String total_amount = "0.01";
		//订单名称，必填
		String subject = "xh-flowershop";
		//商品描述，可空
		String body = "test";
		
		alipayRequest.setBizContent("{\"out_trade_no\":\""+ out_trade_no +"\"," 
				+ "\"total_amount\":\""+ total_amount +"\"," 
				+ "\"subject\":\""+ subject +"\"," 
				+ "\"body\":\""+ body +"\"," 
				+ "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");
		
		//若想给BizContent增加其他可选请求参数，以增加自定义超时时间参数timeout_express来举例说明
		//alipayRequest.setBizContent("{\"out_trade_no\":\""+ out_trade_no +"\"," 
		//		+ "\"total_amount\":\""+ total_amount +"\"," 
		//		+ "\"subject\":\""+ subject +"\"," 
		//		+ "\"body\":\""+ body +"\"," 
		//		+ "\"timeout_express\":\"10m\"," 
		//		+ "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");
		//请求参数可查阅【电脑网站支付的API文档-alipay.trade.page.pay-请求参数】章节
		
		//请求
		String result = alipayClient.pageExecute(alipayRequest).getBody();
		//System.out.println(result);
		result = "<html><head><meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" /></head><body>"+result+"</body></html>";
		ServletActionContext.getResponse().getWriter().write(result);
	}
	/**
	 * 支付宝同步
	 * @return
	 * @throws IOException
	 * @throws AlipayApiException
	 */
	public String alireturn() throws IOException, AlipayApiException{
		/* *
		 * 功能：支付宝服务器同步通知页面
		 * 日期：2017-03-30
		 * 说明：
		 * 以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
		 * 该代码仅供学习和研究支付宝接口使用，只是提供一个参考。


		 *************************页面功能说明*************************
		 * 该页面仅做页面展示，业务逻辑处理请勿在该页面执行
		 */
		 
		//获取支付宝GET过来反馈信息
		HttpServletRequest request = ServletActionContext.getRequest();
		Map<String,String> params = new HashMap<String,String>();
		Map<String,String[]> requestParams = request.getParameterMap();
		//System.out.println(requestParams.toString());
		for (Iterator<String> iter = requestParams.keySet().iterator(); iter.hasNext();) {
			String name = (String) iter.next();
			String[] values = (String[]) requestParams.get(name);
			String valueStr = "";
			for (int i = 0; i < values.length; i++) {
				valueStr = (i == values.length - 1) ? valueStr + values[i]
						: valueStr + values[i] + ",";
			}
			//乱码解决，这段代码在出现乱码时使用
			valueStr = new String(valueStr.getBytes("ISO-8859-1"), "utf-8");
			params.put(name, valueStr);
		}
		
		boolean signVerified = AlipaySignature.rsaCheckV1(params, AlipayConfig.alipay_public_key, AlipayConfig.charset, AlipayConfig.sign_type); //调用SDK验证签名

		//——请在这里编写您的程序（以下代码仅作参考）——
		if(signVerified) {
			//商户订单号
			String out_trade_no = new String(request.getParameter("out_trade_no").getBytes("ISO-8859-1"),"UTF-8");
		
			//支付宝交易号
			String trade_no = new String(request.getParameter("trade_no").getBytes("ISO-8859-1"),"UTF-8");
		
			//付款金额
			String total_amount = new String(request.getParameter("total_amount").getBytes("ISO-8859-1"),"UTF-8");
			
			order.setId(out_trade_no);
			order.setUpdatetime(new Date());
			order.setStatus(1);
			orderService.updatestatus(order);
			ActionContext.getContext().put("order", order);
			return "paysucess";
			//System.out.println(out_trade_no+"--->"+trade_no+"-->"+trade_no);
		}else {
			System.out.println("验签失败");
			return NONE;
		}
	}
	/**
	 * 支付宝异步
	 * @param request
	 * @return
	 * @throws UnsupportedEncodingException 
	 * @throws AlipayApiException 
	 */
	public void aliajaxreturn() throws UnsupportedEncodingException, AlipayApiException{
		/* *
		 * 功能：支付宝服务器异步通知页面
		 * 日期：2017-03-30
		 * 说明：
		 * 以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
		 * 该代码仅供学习和研究支付宝接口使用，只是提供一个参考。


		 *************************页面功能说明*************************
		 * 创建该页面文件时，请留心该页面文件中无任何HTML代码及空格。
		 * 该页面不能在本机电脑测试，请到服务器上做测试。请确保外部可以访问该页面。
		 * 如果没有收到该页面返回的 success 
		 * 建议该页面只做支付成功的业务逻辑处理，退款的处理请以调用退款查询接口的结果为准。
		 */
		 
		//获取支付宝POST过来反馈信息
		HttpServletRequest request = ServletActionContext.getRequest();
		Map<String,String> params = new HashMap<String,String>();
		Map<String,String[]> requestParams = request.getParameterMap();
		for (Iterator<String> iter = requestParams.keySet().iterator(); iter.hasNext();) {
			String name = (String) iter.next();
			String[] values = (String[]) requestParams.get(name);
			String valueStr = "";
			for (int i = 0; i < values.length; i++) {
				valueStr = (i == values.length - 1) ? valueStr + values[i]
						: valueStr + values[i] + ",";
			}
			//乱码解决，这段代码在出现乱码时使用
			valueStr = new String(valueStr.getBytes("ISO-8859-1"), "utf-8");
			params.put(name, valueStr);
		}
		
		boolean signVerified = AlipaySignature.rsaCheckV1(params, AlipayConfig.alipay_public_key, AlipayConfig.charset, AlipayConfig.sign_type); //调用SDK验证签名

		//——请在这里编写您的程序（以下代码仅作参考）——
		
		/* 实际验证过程建议商户务必添加以下校验：
		1、需要验证该通知数据中的out_trade_no是否为商户系统中创建的订单号，
		2、判断total_amount是否确实为该订单的实际金额（即商户订单创建时的金额），
		3、校验通知中的seller_id（或者seller_email) 是否为out_trade_no这笔单据的对应的操作方（有的时候，一个商户可能有多个seller_id/seller_email）
		4、验证app_id是否为该商户本身。
		*/
		if(signVerified) {//验证成功
			//商户订单号
			String out_trade_no = new String(request.getParameter("out_trade_no").getBytes("ISO-8859-1"),"UTF-8");
		
			//支付宝交易号
			String trade_no = new String(request.getParameter("trade_no").getBytes("ISO-8859-1"),"UTF-8");
		
			//交易状态
			String trade_status = new String(request.getParameter("trade_status").getBytes("ISO-8859-1"),"UTF-8");
			
			if(trade_status.equals("TRADE_FINISHED")){
				//判断该笔订单是否在商户网站中已经做过处理
				//如果没有做过处理，根据订单号（out_trade_no）在商户网站的订单系统中查到该笔订单的详细，并执行商户的业务程序
				//如果有做过处理，不执行商户的业务程序
					
				//注意：
				//退款日期超过可退款期限后（如三个月可退款），支付宝系统发送该交易状态通知
			}else if (trade_status.equals("TRADE_SUCCESS")){
				//判断该笔订单是否在商户网站中已经做过处理
				//如果没有做过处理，根据订单号（out_trade_no）在商户网站的订单系统中查到该笔订单的详细，并执行商户的业务程序
				//如果有做过处理，不执行商户的业务程序
				
				//注意：
				//付款完成后，支付宝系统发送该交易状态通知
			}
			//order.setId(out_trade_no);
			//order.setUpdatetime(new Date());
			//order.setStatus(1);
			//orderService.updatestatus(order);
			System.out.println("支付宝异步success");
			
		}else {//验证失败
			System.out.println("支付宝异步验证fail");
		
			//调试用，写文本函数记录程序运行情况是否正常
			//String sWord = AlipaySignature.getSignCheckContentV1(params);
			//AlipayConfig.logResult(sWord);
		}
	}
	public Map<String, String> getAllRequestParam(
			final HttpServletRequest request) {
		Map<String, String> res = new HashMap<String, String>();
		Enumeration<?> temp = request.getParameterNames();
		if (null != temp) {
			while (temp.hasMoreElements()) {
				String en = (String) temp.nextElement();
				String value = request.getParameter(en);
				res.put(en, value);
				// 在报文上送时，如果字段的值为空，则不上送<下面的处理为在获取所有参数数据时，判断若值为空，则删除这个字段>
				if (res.get(en) == null || "".equals(res.get(en))) {
					// System.out.println("======为空的字段名===="+en);
					res.remove(en);
				}
			}
		}
		return res;
	}
}
