package com.shop.action;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.shop.entity.Address;
import com.shop.entity.Shopuser;
import com.shop.service.AddressService;
import com.shop.service.UserService;
import com.shop.utils.CheckImg;
import com.shop.utils.SendEmail;
import com.shop.utils.UploadUtils;

public class UserAction extends ActionSupport implements ModelDriven<Shopuser> {

	private Shopuser user = new Shopuser();
	public Shopuser getModel() {
		// TODO Auto-generated method stub
		return user;
	}
	private UserService userService;
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	private AddressService addressService;
	public void setAddressService(AddressService addressService) {
		this.addressService = addressService;
	}
	/**
	 * 验证密码图片
	 * @return
	 * @throws IOException
	 */
	public String getImg() throws IOException{
		HttpServletResponse response = ServletActionContext.getResponse();
		// 设置响应的类型格式为图片格式
        response.setContentType("image/jpeg");
        //禁止图像缓存。
        response.setHeader("Pragma", "no-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expires", 0);
        CheckImg vCode = new CheckImg(80,30);;
        ServletActionContext.getRequest().getSession().setAttribute("code", vCode.getCode());
        vCode.write(response.getOutputStream());
		return NONE;
	}
	/**
	 * 用户注册的方法
	 */
	private String checkcode;
	public void setCheckcode(String checkcode) {
		this.checkcode = checkcode;
	}
	public String regist() {
		String code =  (String) ServletActionContext.getRequest().getSession().getAttribute("code");
		ServletActionContext.getRequest().getSession().removeAttribute("code");
		if(checkcode==null){return "regist";}
		if(checkcode.equalsIgnoreCase(code)){
			user.setGender("男");
			user.setCreatetime(new Date());
			user.setStatus(0);
			user.setPicture("userportrait/default.jpg");
			userService.regist(user);
			return LOGIN;
		}else{
			ActionContext.getContext().put("message", "false");
			return "regist";
		}
	}
	/**
	 * 查询用户名是否已存在
	 * @return
	 * @throws IOException 
	 */
	public String findByUserName() throws IOException{
		user = userService.findByUserName(user);
		if(user==null){
			ServletActionContext.getResponse().getWriter().write("true");
		}else{
			ServletActionContext.getResponse().getWriter().write("false");
		}
		return NONE;
	}
	/**
	 * 用户登录操作
	 * @return
	 */
	public String login() {
		if(user.getUsername()!=null){
			Shopuser existUser = userService.login(user);
			//判断用户是否存在
			if(existUser!=null) {
				//将用户信息存入session中
				ServletActionContext.getRequest().getSession().setAttribute("existUser", existUser);
				//ActionContext.getContext().getSession().put("existUser", existUser);//存入session的第二种方式
				return SUCCESS;
			}else {
				this.addActionError("用户名或密码错误！");
				return LOGIN;
			}
		}else {
			return LOGIN;
		}
	}
	/**
	 * 用户退出操作
	 * @return
	 */
	public String quit() {
		ServletActionContext.getRequest().getSession().invalidate();
		return "quit";
	}
	
	/**
	 * 用户信息
	 */
	public String info(){
		user = (Shopuser) ServletActionContext.getRequest().getSession().getAttribute("existUser");
		user = userService.findById(user);
		ActionContext.getContext().put("userinfo", user);
		return "info";
	}
	/**
	 * 更新用户信息
	 * @return
	 */
	private String newbirthday;
	public void setNewbirthday(String newbirthday) {
		this.newbirthday = newbirthday;
	}
	public String updateinfo() throws ParseException{
		Shopuser olduser = userService.findById(user);
		SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd");
		olduser.setBirthday(simpleDateFormat.parse(newbirthday));
		olduser.setName(user.getName());
		olduser.setEmail(user.getEmail());
		olduser.setPhone(user.getPhone());
		olduser.setGender(user.getGender());
		olduser.setAddress(user.getAddress());
		userService.update(olduser);
		return "updateinfo";
	}
	/**
	 * 查询收货地址
	 * @return
	 */
	public String findaddr(){
		user = (Shopuser) ServletActionContext.getRequest().getSession().getAttribute("existUser");
		List<Address> list = addressService.findByUid(user);
		ActionContext.getContext().put("addrList", list);
		return "findaddr";
	}
	/**
	 * 修改图像
	 */
	public String portrait(){
		return "portrait";
	}
	//文件上传所需要的三个属性
	private String uploadFileName;//文件名称
	private File upload;//上传的文件
	private String uploadContentType;//文件类型
	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}
	public void setUpload(File upload) {
		this.upload = upload;
	}
	public void setUploadContentType(String uploadContentType) {
		this.uploadContentType = uploadContentType;
	}
	/**
	 * 修改用户图像信息
	 * @throws IOException 
	 */
	public String upload() throws IOException {
		user = (Shopuser) ServletActionContext.getRequest().getSession().getAttribute("existUser");
		//文件上传操作
		if(upload!=null){
			/*String path = "E:/uploadFile";*/
			String path = ServletActionContext.getRequest().getSession().getServletContext().getRealPath("");
			path = path+"/userportrait";
			uploadFileName = UploadUtils.getFileName(uploadFileName);
			File file = new File(path);
			if(!file.exists()) {
				file.mkdirs();
			}
			File newfile = new File(path+"//"+uploadFileName);
			//将文件进行复制
			FileUtils.copyFile(upload, newfile);
			user.setPicture("userportrait/"+uploadFileName);
		}
		userService.update(user);
		return "upload";
	}
	
	//修改密码页面
	public String updatepasword(){
		return "updatepasword";
	}
	
	//修改密码
	public String updatepaswd(){
		String password = user.getPassword();
		user = (Shopuser) ServletActionContext.getRequest().getSession().getAttribute("existUser");
		user.setPassword(password);
		System.out.println(user.getPassword());
		userService.updatePassword(user);
		return "updatepasword";
	}
	
	//忘记密码
	public String forgetui(){
		return "forgetui";
	}
	
	//忘记密码
	public String forgetPaswd(){
		String code =  (String) ServletActionContext.getRequest().getSession().getAttribute("code");
		ServletActionContext.getRequest().getSession().removeAttribute("code");
		if(checkcode==null){return "forgetui";}
		if(checkcode.equalsIgnoreCase(code)){
			String email = user.getEmail();
			user = userService.findByUserName(user);
			if(user!=null&&user.getEmail().equals(email)){
				try {
					String emailmesssage ="您的验证码为：";
					int randomcode = (int)((Math.random()*9+1)*100000);
					emailmesssage = emailmesssage +randomcode+"，请在十五分钟之内使用，过期无效，不能重复使用。";
					new SendEmail().send(user.getEmail(),emailmesssage);
					ServletActionContext.getRequest().getSession().setAttribute("randomcode", String.valueOf(randomcode));
					ActionContext.getContext().put("message", "success");
					ActionContext.getContext().put("user", user);
					return "forgetui";
				} catch (Exception e) {
					e.printStackTrace();
					ActionContext.getContext().put("message", "emailerror");
					return "forgetui";
				}
			}else{
				ActionContext.getContext().put("message", "paramerror");
				return "forgetui";
			}
		}else{
			ActionContext.getContext().put("message", "codeerror");
			return "forgetui";
		}
	}
	
	//重置密码
	public String reupaswd(){
		String randomcode =  (String) ServletActionContext.getRequest().getSession().getAttribute("randomcode");
		if(checkcode!=null&&checkcode.equalsIgnoreCase(randomcode)){
			userService.updatePassword(user);
			ActionContext.getContext().put("message", "updatesuccess");
			ServletActionContext.getRequest().getSession().removeAttribute("randomcode");
			return LOGIN;
		}else{
			ActionContext.getContext().put("message", "emailcodeerror");
			return "forgetui";
		}
	}
	
}



/*
 招商银行借记卡：6226090000000048
    手机号：18100000000
    密码：111101
    短信验证码：111111（先点获取验证码之后再输入）
    证件类型：01
    证件号：510265790128303
    姓名：张三
 */
