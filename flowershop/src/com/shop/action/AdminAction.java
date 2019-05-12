package com.shop.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.struts2.ServletActionContext;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.serializer.SimplePropertyPreFilter;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.shop.entity.Admin;
import com.shop.entity.Cart;
import com.shop.entity.Category;
import com.shop.entity.Feedback;
import com.shop.entity.Images;
import com.shop.entity.News;
import com.shop.entity.Order;
import com.shop.entity.Product;
import com.shop.entity.Shopuser;
import com.shop.service.AdminService;
import com.shop.service.FeedbackService;
import com.shop.service.NewsService;
import com.shop.service.OrderService;
import com.shop.service.ProductService;
import com.shop.service.UserService;
import com.shop.utils.PageModel;
import com.shop.utils.UploadUtils;

public class AdminAction extends ActionSupport implements ModelDriven<Admin> {
	private Admin admin = new Admin();
	public Admin getModel() {
		return admin;
	}
	private AdminService adminService;
	public void setAdminService(AdminService adminService) {
		this.adminService = adminService;
	}
	private ProductService productService;
	public void setProductService(ProductService productService) {
		this.productService = productService;
	}
	private OrderService orderService;
	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}
	private UserService userService;
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	private FeedbackService feedbackService;
	public void setFeedbackService(FeedbackService feedbackService) {
		this.feedbackService = feedbackService;
	}
	private NewsService newsService;
	public void setNewsService(NewsService newsService) {
		this.newsService = newsService;
	}
	/**
	 * 后台管理登录页面
	 */
	public String index(){
		return "backlogin";
	}
	/**
	 * 登录操作
	 */
	public String login(){
		admin = adminService.login(admin);
		if(admin!=null){
			ServletActionContext.getRequest().getSession().setAttribute("admin", admin);
			return SUCCESS;
		}else {
			ActionContext.getContext().put("LoginMessage", "false");
			return "backlogin";
		}
	}
	/**
	 * 主页
	 * @return
	 */
	public String main(){
		return "main";
	}
	/**
	 * 退出登录
	 * @return
	 */
	public String quit(){
		ServletActionContext.getRequest().getSession().invalidate();
		return "quit";
	}
	
	//文件上传所需要的三个属性
	private String[] uploadFileName;//文件名称
	private File[] upload;//上传的文件
	private String[] uploadContentType;//文件类型
	public void setUploadFileName(String[] uploadFileName) {
		this.uploadFileName = uploadFileName;
	}
	public void setUpload(File[] upload) {
		this.upload = upload;
	}
	public void setUploadContentType(String[] uploadContentType) {
		this.uploadContentType = uploadContentType;
	}
	/**
	 * 添加商品信息
	 * @throws IOException 
	 */
	public String addpro() throws IOException{
		List<Images> list = new ArrayList<Images>();
		for (int i = 0; i < upload.length; i++) {
			list.add(new Images());
			if (upload[i] != null) {
				/*String path = "E:/uploadFile";*/
				String path = ServletActionContext.getRequest().getSession().getServletContext().getRealPath("");
				path = path+"/productimg";
				uploadFileName[i] = UploadUtils.getFileName(uploadFileName[i]);
				File file = new File(path);
				if(!file.exists()) {
					file.mkdirs();
				}
				File newfile = new File(path+"//"+uploadFileName[i]);
				//将文件进行复制
				FileUtils.copyFile(upload[i], newfile);
				list.get(i).setProduct(product);
				list.get(i).setUrl("productimg/"+uploadFileName[i]);
			}
		}
		product.setCreatetime(new Date());
		product.setStatus(0);
		productService.save(product,list);
		return "rederect";
	}
	
	public String findcategory() throws IOException{
		List<Category> list = adminService.findcategory();
		ServletActionContext.getResponse().setContentType("text/html;charset=utf-8");
		ServletActionContext.getResponse().getWriter().write(JSONArray.toJSONString(list));
		return NONE;
	}
	
	/**
	 * 查询所有商品
	 * @return
	 */
	private Integer currPage=1;
	public void setCurrPage(Integer currPage) {
		if(currPage==null) {
			currPage=1;
		}
		this.currPage = currPage;
	}
	public String allproduct(){
		DetachedCriteria detachedCriteria = DetachedCriteria.forClass(Product.class);
		if(product==null){
			detachedCriteria.add(Restrictions.eq("status", 0));
		}else{
			detachedCriteria.add(Restrictions.eq("status", product.getStatus()));
		}
		detachedCriteria.addOrder(org.hibernate.criterion.Order.desc("createtime"));
		PageModel<Product> pageModel = new PageModel<Product>();
		pageModel.setCurrPage(currPage);
		pageModel.setPageSize(8);
		pageModel = productService.findByPage(detachedCriteria,pageModel);
		ServletActionContext.getContext().getValueStack().push(pageModel);
		return "productlist";
	}
	/**
	 * 查询商品信息
	 */
	private Product product;
	public void setProduct(Product product) {
		this.product = product;
	}
	public Product getProduct() {
		return product;
	}
	public String findpro(){
		product = productService.findById(product.getId());
		ActionContext.getContext().put("product", product);
		return "findpro";
	}
	/**
	 * 修改商品信息
	 * @return
	 */
	public String updatepro(){
		productService.update(product);
		return "rederect";
	}
	/**
	 * 下架商品信息
	 * @return
	 */
	public String offpro(){
		product.setOfftime(new Date());
		productService.offpro(product);
		return "rederect";
	}
	/**
	 * 下架商品信息
	 * @return
	 */
	public String offprolist(){
		DetachedCriteria detachedCriteria = DetachedCriteria.forClass(Product.class);
		detachedCriteria.add(Restrictions.eq("status", 1));
		detachedCriteria.addOrder(org.hibernate.criterion.Order.desc("offtime"));
		PageModel<Product> pageModel = new PageModel<Product>();
		pageModel.setCurrPage(currPage);
		pageModel.setPageSize(8);
		pageModel = productService.findByPage(detachedCriteria,pageModel);
		ServletActionContext.getContext().getValueStack().push(pageModel);
		return "offproductlist";
	}
	/**
	 * 商品列表
	 * @throws IOException 
	 */
	public void findprolist() throws IOException{
		List<Product> list = productService.findAll();
		ServletActionContext.getResponse().setContentType("text/html;charset=utf-8");
		SimplePropertyPreFilter filter = new SimplePropertyPreFilter(Product.class, "id","pname");  
		ServletActionContext.getResponse().getWriter().write(JSONArray.toJSONString(list,filter));
	}
	/**
	 * 详情图上传页面
	 *
	 */
	public String prodetail(){
		return "proinfodetail";
	}
	/**
	 * 上传商品详情图
	 */
	File file;//上传的文件
	String name;//文件名称
	int productid;//商品id
	public int getProductid() {
		return productid;
	}
	public void setProductid(int productid) {
		this.productid = productid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public File getFile() {
		return file;
	}
	public void setFile(File file) {
		this.file = file;
	}
	public String proinfourl() throws IOException{
		product = productService.findById(productid);
		if (file!= null) {
			/*String path = "E:/uploadFile";*/
			String path = ServletActionContext.getRequest().getSession().getServletContext().getRealPath("");
			path = path+"/productdetail";
			name = UploadUtils.getFileName(name);
			File files = new File(path);
			if(!files.exists()) {
				files.mkdirs();
			}
			File newfile = new File(path+"//"+name);
			//将文件进行复制
			FileUtils.copyFile(file, newfile);
			if(product.getInfourl()==""||product.getInfourl()==null){
				product.setInfourl("productdetail/"+name);
			}else{
				product.setInfourl(product.getInfourl()+"-productdetail/"+name);
			}
			productService.update(product);
		}
		return NONE;
	}
	/**
	 * 已支付订单
	 */
	public String havepay(){
		DetachedCriteria detachedCriteria = DetachedCriteria.forClass(Order.class);
		PageModel<Order> pageModel = new PageModel<Order>();
		detachedCriteria.add(Restrictions.eq("status",1));
		pageModel.setCurrPage(currPage);
		pageModel.setPageSize(10);
		pageModel = orderService.findByPage(detachedCriteria, pageModel);
		ServletActionContext.getContext().getValueStack().push(pageModel);
		return "allorder";
	}
	
	/**
	 * 查询已完成的所有订单
	 */
	public String allorder(){
		DetachedCriteria detachedCriteria = DetachedCriteria.forClass(Order.class);
		PageModel<Order> pageModel = new PageModel<Order>();
		detachedCriteria.add(Restrictions.or(Restrictions.eq("status",2),Restrictions.eq("status",3),Restrictions.eq("status",4)));
		pageModel.setCurrPage(currPage);
		pageModel.setPageSize(10);
		pageModel = orderService.findByPage(detachedCriteria, pageModel);
		ServletActionContext.getContext().getValueStack().push(pageModel);
		return "allorder";
	}
	/**
	 * 查询待支付的订单
	 */
	public String waitorder(){
		DetachedCriteria detachedCriteria = DetachedCriteria.forClass(Order.class);
		PageModel<Order> pageModel = new PageModel<Order>();
		detachedCriteria.add(Restrictions.eq("status",0));
		detachedCriteria.addOrder(org.hibernate.criterion.Order.desc("createtime"));
		pageModel.setCurrPage(currPage);
		pageModel.setPageSize(10);
		pageModel = orderService.findByPage(detachedCriteria, pageModel);
		ServletActionContext.getContext().getValueStack().push(pageModel);
		return "allorder";
	}
	/**
	 * 查询申请退款的订单
	 */
	public String failedorder(){
		DetachedCriteria detachedCriteria = DetachedCriteria.forClass(Order.class);
		PageModel<Order> pageModel = new PageModel<Order>();
		detachedCriteria.add(Restrictions.eq("status",5));
		pageModel.setCurrPage(currPage);
		pageModel.setPageSize(10);
		pageModel = orderService.findByPage(detachedCriteria, pageModel);
		ServletActionContext.getContext().getValueStack().push(pageModel);
		return "allorder";
	}
	
	/**
	 * 接受申请
	 * @return
	 * @throws IOException 
	 */
	public void jieshou() throws IOException{
		order.setUpdatetime(new Date());
		order.setStatus(4);
		orderService.updatestatus(order);
		ServletActionContext.getResponse().setContentType("text/html;charset=utf-8");
		ServletActionContext.getResponse().getWriter().write("<script type=\"text/javascript\">alert(\"操作成功！\");window.location.href=\"admin_allorder.action\";</script>");
	}
	/***
	 * 订单详情页
	 * @return
	 */
	Order order;
	public Order getOrder() {
		return order;
	}
	public void setOrder(Order order) {
		this.order = order;
	}
	public String orderinfo(){
		order = orderService.findById(order);
		ActionContext.getContext().put("orderinfo", order);
		return "orderinfo";
	}
	
	/**
	 * 查询客户
	 */
	public String alluser(){
		DetachedCriteria detachedCriteria = DetachedCriteria.forClass(Shopuser.class);
		PageModel<Shopuser> pageModel = new PageModel<Shopuser>();
		detachedCriteria.add(Restrictions.eq("status",0));
		pageModel.setCurrPage(currPage);
		pageModel.setPageSize(8);
		pageModel = userService.findByPage(detachedCriteria, pageModel);
		ServletActionContext.getContext().getValueStack().push(pageModel);
		return "finduser";
	}
	/**
	 * 禁用会员账号
	 */
	private Shopuser user;
	
	public Shopuser getUser() {
		return user;
	}
	public void setUser(Shopuser user) {
		this.user = user;
	}
	public String offuser(){
		userService.updateUserStatus(user);
		return "offuser";
	}
	public String prohibituser(){
		DetachedCriteria detachedCriteria = DetachedCriteria.forClass(Shopuser.class);
		PageModel<Shopuser> pageModel = new PageModel<Shopuser>();
		detachedCriteria.add(Restrictions.eq("status",1));
		pageModel.setCurrPage(currPage);
		pageModel.setPageSize(8);
		pageModel = userService.findByPage(detachedCriteria, pageModel);
		ServletActionContext.getContext().getValueStack().push(pageModel);
		return "prohibituser";
	}
	
	//反馈信息
	/**
	 * 分页查询
	 * @return
	 * @throws IOException
	 */
	public String allfb(){
		DetachedCriteria detachedCriteria = DetachedCriteria.forClass(Feedback.class);
		PageModel<Feedback> pageModel = new PageModel<Feedback>();
		detachedCriteria.add(Restrictions.isNull("answer"));
		detachedCriteria.addOrder(org.hibernate.criterion.Order.desc("time"));
		pageModel.setCurrPage(currPage);
		pageModel.setPageSize(10);
		pageModel = feedbackService.findByPage(detachedCriteria, pageModel);
		ServletActionContext.getContext().getValueStack().push(pageModel);
		return "allfb";
	}
	private Feedback feedback;
	public Feedback getFeedback() {
		return feedback;
	}
	public void setFeedback(Feedback feedback) {
		this.feedback = feedback;
	}
	public String fbinfo(){
		feedback = feedbackService.findById(feedback);
		ServletActionContext.getContext().put("feedback", feedback);
		return "fbinfo";
	}
	/**
	 * 回复
	 * @return
	 * @throws IOException 
	 */
	public String updatefb() throws IOException{
		if(feedback.getAnswer().isEmpty()){
			ServletActionContext.getResponse().setContentType("text/html;charset=utf-8");
			ServletActionContext.getResponse().getWriter().write("<script type=\"text/javascript\">alert(\"回复失败！\");window.location.href=\"admin_allfb.action\";</script>");
			return NONE;
		}else{
		feedbackService.updateanswer(feedback);
		ServletActionContext.getResponse().setContentType("text/html;charset=utf-8");
		ServletActionContext.getResponse().getWriter().write("<script type=\"text/javascript\">alert(\"回复成功！\");window.location.href=\"admin_oldfb.action\";</script>");
		return NONE;
		}
	}
	/**
	 * 分页查询
	 * @return
	 * @throws IOException
	 */
	public String oldfb(){
		DetachedCriteria detachedCriteria = DetachedCriteria.forClass(Feedback.class);
		PageModel<Feedback> pageModel = new PageModel<Feedback>();
		detachedCriteria.add(Restrictions.isNotNull("answer"));
		detachedCriteria.addOrder(org.hibernate.criterion.Order.desc("time"));
		pageModel.setCurrPage(currPage);
		pageModel.setPageSize(10);
		pageModel = feedbackService.findByPage(detachedCriteria, pageModel);
		ServletActionContext.getContext().getValueStack().push(pageModel);
		return "allfb";
	}
	
	/**
	 * 新闻列表
	 */
	public String allnews(){
		DetachedCriteria detachedCriteria = DetachedCriteria.forClass(News.class);
		PageModel<News> pageModel = new PageModel<News>();
		detachedCriteria.add(Restrictions.eq("important", 0));
		detachedCriteria.addOrder(org.hibernate.criterion.Order.desc("createtime"));
		pageModel.setCurrPage(currPage);
		pageModel.setPageSize(10);
		pageModel = newsService.findByPage(detachedCriteria, pageModel);
		ServletActionContext.getContext().getValueStack().push(pageModel);
		return "allnews";
	}
	/**
	 * 删除新闻
	 * @throws IOException
	 */
	public void deletenews() throws IOException{
		news.setImportant(1);
		newsService.updateStatus(news);
		ServletActionContext.getResponse().setContentType("text/html;charset=utf-8");
		ServletActionContext.getResponse().getWriter().write("<script type=\"text/javascript\">alert(\"删除成功！\");window.location.href=\"admin_allnews.action\";</script>");
	}
	
	/**
	 * 以过期的新闻
	 * @return
	 */
	public String oldnews(){
		DetachedCriteria detachedCriteria = DetachedCriteria.forClass(News.class);
		PageModel<News> pageModel = new PageModel<News>();
		detachedCriteria.add(Restrictions.eq("important", 1));
		detachedCriteria.addOrder(org.hibernate.criterion.Order.desc("createtime"));
		pageModel.setCurrPage(currPage);
		pageModel.setPageSize(10);
		pageModel = newsService.findByPage(detachedCriteria, pageModel);
		ServletActionContext.getContext().getValueStack().push(pageModel);
		return "oldnews";
	}
	/**
	 * 新增新闻
	 */
	private News news;
	public News getNews() {
		return news;
	}
	public void setNews(News news) {
		this.news = news;
	}
	public String addnews(){
		news.setCreatetime(new Date());
		newsService.save(news);
		return "addnews";
	}
	
	/**
	 * 查看新闻详情
	 */
	
	public String newsinfo(){
		news = newsService.findById(news);
		ServletActionContext.getContext().put("news", news);
		return "newsinfo";
	}
	
	/**
	 * 打印订单详情
	 * @return
	 * @throws Exception
	 */
	private InputStream fis;
	
	
	public InputStream getFis() {
		return fis;
	}
	public void setFis(InputStream fis) {
		this.fis = fis;
	}
	public String OutExcel() throws Exception {
		
		
		order = orderService.findById(order);
		String status = "";
		switch (order.getStatus()) {
		case 0:
			status="待支付";
			break;
		case 1:
			status="待收货";
			break;
		case 2:
			status="已完成";
			break;
		case 3:
			status="已取消";
			break;
		case 4:
			status="已退货";
			break;
		case 5:
			status="等待退货审核";
			break;

		default:
			status = "未知错误";
			break;
		}
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		String dir = request.getSession().getServletContext().getRealPath("/output");
		File fileLocation = new File(dir);
		if (!fileLocation.exists()) {
			boolean isCreated = fileLocation.mkdir();
			if (!isCreated) {
			}
		}
		String webUrl = request.getSession().getServletContext().getRealPath("/output");
		//SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd mm-ss");
		//String createExcelname = df.format(new Date()) + "OutputExcel.xls";
		String createExcelname = order.getId() + "OutputExcel.xls";
		String outputFile = webUrl + File.separator + createExcelname;
		
		HSSFWorkbook workbook = new HSSFWorkbook();
		HSSFCellStyle cellStyle = workbook.createCellStyle();//单元格样式
		cellStyle.setAlignment(HorizontalAlignment.CENTER); // 居中
		
		HSSFSheet sheet = workbook.createSheet();
		workbook.setSheetName(0, "emp");
		List<HSSFRow> row= new ArrayList<HSSFRow>();
		List<HSSFCell> cell = new ArrayList<HSSFCell>();
		for (int i = 0; i < 50; i++) {
			row.add(sheet.createRow(i));
			for(int j=0; j<5; j++){
				cell.add(row.get(i).createCell(j));
			}
		}
		for (int i=0;i<cell.size();i++) {
			sheet.setColumnWidth(i, 30*256);
		}
		cell.get(0).setCellValue("订单详情");
		cell.get(5).setCellValue("订单编号");
		cell.get(6).setCellValue(order.getId());
		cell.get(8).setCellValue("下单日期");
		cell.get(9).setCellValue(order.getCreatetime());
		cell.get(10).setCellValue("订单状态");
		cell.get(11).setCellValue(status);
		
		cell.get(15).setCellValue("收货人信息");
		cell.get(20).setCellValue("收货人");
		cell.get(21).setCellValue(order.getAddress().getName());
		cell.get(23).setCellValue("收货地址");
		cell.get(24).setCellValue(order.getAddress().getAddress());
		cell.get(25).setCellValue("手机号");
		cell.get(26).setCellValue(order.getAddress().getPhone());
		cell.get(28).setCellValue("邮政编码");
		cell.get(29).setCellValue(order.getAddress().getPostalcode());
		
		cell.get(30).setCellValue("配送信息");
		cell.get(35).setCellValue("运费");
		cell.get(36).setCellValue(0);
		cell.get(38).setCellValue("配送方式");
		cell.get(39).setCellValue(order.getExpress());
		cell.get(40).setCellValue("备注");
		cell.get(41).setCellValue(order.getConmment());
		
		cell.get(45).setCellValue("支付信息");
		cell.get(50).setCellValue("支付状态");
		cell.get(51).setCellValue(status);
		cell.get(53).setCellValue("支付方式");
		cell.get(54).setCellValue(order.getPay());
		
		cell.get(60).setCellValue("商品信息");
		cell.get(65).setCellValue("商品名称");
		cell.get(66).setCellValue("商品价格");
		cell.get(67).setCellValue("商品数量");
		cell.get(68).setCellValue("商品小计");
		int index = 70;
		for (Cart cart : order.getCart()) {
			cell.get(index).setCellValue(cart.getProduct().getPname());
			index = index+1;
			cell.get(index).setCellValue(cart.getProduct().getNewPrice());
			index = index+1;
			cell.get(index).setCellValue(cart.getNumber());
			index = index+1;
			cell.get(index).setCellValue(cart.getNumber()*cart.getProduct().getNewPrice());
			index = index+2;
		}
		for(int i=0;i<13;i++){
			if(i%3==0){
				//CellRangeAddress region = new CellRangeAddress(i, i, 0, 4);// 下标从0开始 起始行号，终止行号， 起始列号，终止列号
				sheet.addMergedRegion(new CellRangeAddress(i, i, 0, 4));
				sheet.getRow(i).getCell(0).setCellStyle(cellStyle);
			}
		}
		response.setContentType("text/html;charset=UTF-8");
		
		FileOutputStream fOut = new FileOutputStream(outputFile);
		workbook.write(fOut);
		fOut.flush();
		fOut.close();
		File f = new File(outputFile);
		if (f.exists() && f.isFile()) {
			try {
				fis = new FileInputStream(f);
				URLEncoder.encode(f.getName(), "utf-8");
				byte[] b = new byte[fis.available()];
				fis.read(b);
				response.setCharacterEncoding("utf-8");
				response.setHeader("Content-Disposition", "attachment; filename=" + createExcelname + "");
				ServletOutputStream out = response.getOutputStream();
				out.write(b);
				out.flush();
				out.close();
				/*if (fis != null) {
					fis.close();
				}
				f.delete();*/
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return "excell";
	}
}
