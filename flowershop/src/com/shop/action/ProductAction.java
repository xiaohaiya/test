package com.shop.action;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.shop.entity.Cart;
import com.shop.entity.Category;
import com.shop.entity.Images;
import com.shop.entity.Order;
import com.shop.entity.Product;
import com.shop.entity.Shopuser;
import com.shop.service.CartService;
import com.shop.service.ProductService;
import com.shop.utils.CheckImg;
import com.shop.utils.PageModel;
import com.shop.utils.UploadUtils;
/**
 * 商品的action
 * @author xiaohai
 *
 */
public class ProductAction extends ActionSupport implements ModelDriven<Product> {
	 /*注入模型驱动*/
	private Product product = new Product();
	public Product getModel() {
		// TODO Auto-generated method stub
		return product;
	}
	/*引入service层*/
	private ProductService productService;
	public void setProductService(ProductService productService) {
		this.productService = productService;
	}
	private CartService cartService;
	public void setCartService(CartService cartService) {
		this.cartService = cartService;
	}
	/**加入购物车变量*/
	private Cart cart;
	public void setCart(Cart cart) {
		this.cart = cart;
	}
	public Cart getCart() {
		return cart;
	}
	/**
	 * 首页查询所有商品
	 * @return
	 */
	private Integer currPage=1;
	public void setCurrPage(Integer currPage) {
		if(currPage==null) {
			currPage=1;
		}
		this.currPage = currPage;
	}
	public String findAll(){
		//使用detachedcriteria进行查询
		DetachedCriteria detachedCriteria = DetachedCriteria.forClass(Product.class);
		//按条件查询
		if(product.getCategory()!=null){
			detachedCriteria.add(Restrictions.eq("category",product.getCategory()));
		}
		detachedCriteria.add(Restrictions.eq("status", 0));
		PageModel<Product> pageModel = new PageModel<Product>();
		pageModel.setCurrPage(currPage);
		pageModel.setPageSize(8);
		pageModel = productService.findByPage(detachedCriteria,pageModel);
		//将数据放入值栈中
		ServletActionContext.getContext().getValueStack().push(pageModel);
		return "findAll";
	}
	/**
	 * 根据ID查询商品
	 * @return
	 */
	public String findById(){
		product = productService.findById(product.getId());
		List<Product> list = productService.findAll();
		int[] index = randomCommon(0, list.size()-1, 4);
		List<Product> list1 = new ArrayList<Product>();
		for(int i:index){
			list1.add(list.get(i));
		}
		ServletActionContext.getRequest().setAttribute("product", product);
		ServletActionContext.getRequest().setAttribute("list", list1);
		return "findById";
	}
	/** 
	 * 随机指定范围内N个不重复的数 
	 * 最简单最基本的方法 
	 * @param min 指定范围最小值 
	 * @param max 指定范围最大值 
	 * @param n 随机数个数 
	 */  
	private int[] randomCommon(int min, int max, int n){  
	    if (n > (max - min + 1) || max < min) {  
	           return null;  
	       }  
	    int[] result = new int[n];  
	    int count = 0;  
	    while(count < n) {  
	        int num = (int) (Math.random() * (max - min)) + min;  
	        boolean flag = true;  
	        for (int j = 0; j < n; j++) {  
	            if(num == result[j]){  
	                flag = false;  
	                break;  
	            }  
	        }  
	        if(flag){  
	            result[count] = num;  
	            count++;  
	        }  
	    }  
	    return result;  
	}
	
	/**
	 * 保存商品
	 * @return
	 */
	//文件上传所需要的三个属性
	/*private String uploadFileName;//文件名称
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
	public String save() throws IOException{
		productService.save(product);
		DetachedCriteria detachedCriteria = DetachedCriteria.forClass(Product.class);
		detachedCriteria.add(Restrictions.eq("pname",product.getPname()));
		PageModel<Product> pageModel = new PageModel<Product>();
		pageModel.setCurrPage(currPage);
		pageModel.setPageSize(2);
		pageModel = productService.findByPage(detachedCriteria,pageModel);
		product = pageModel.getList().get(0);
		Images img = new Images();
		img.setProduct(product);
		if(upload!=null){
			String path = "E:/uploadFile";
			String path = ServletActionContext.getRequest().getSession().getServletContext().getRealPath("");
			path = path+"/productimg";
			uploadFileName = UploadUtils.getFileName(uploadFileName);
			File file = new File(path);
			if(!file.exists()) {
				file.mkdirs();
			}
			File newfile = new File(path+"//"+uploadFileName);
			//将文件进行复制
			FileUtils.copyFile(upload, newfile);
			img.setUrl("productimg/"+uploadFileName);
		}
		for(int i=0;i<3;i++){
			productService.saveimg(img);
			productService.saveimg(img);
			productService.saveimg(img);
		}
		return "save";
	}*/
}
