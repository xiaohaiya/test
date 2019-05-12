package com.shop.action;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;

import com.alibaba.fastjson.JSONArray;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.shop.entity.Address;
import com.shop.entity.Cart;
import com.shop.entity.Product;
import com.shop.entity.Shopuser;
import com.shop.service.AddressService;
import com.shop.service.CartService;

public class CartAction extends ActionSupport implements ModelDriven<Cart> {

	/**
	 * 引入模型驱动
	 */
	private Cart cart = new Cart();
	public Cart getModel() {
		return cart;
	}
	private CartService cartService;
	public void setCartService(CartService cartService) {
		this.cartService = cartService;
	}
	private AddressService addressService;
	public void setAddressService(AddressService addressService) {
		this.addressService = addressService;
	}
	/**
	 * 添加购物车
	 * @return
	 * @throws IOException 
	 */
	public String addCart() throws IOException{
		Shopuser user = (Shopuser) ServletActionContext.getRequest().getSession().getAttribute("existUser");
		cart.setShopuser(user);
		Map map = new HashMap<String, String>();
		map.put("result", "false");
		if(cart.getId()==0){
			//添加购物车商品
			Cart oldcart = cartService.findByPid(cart);
			if(oldcart!=null){
				oldcart.setNumber(cart.getNumber()+oldcart.getNumber());
				oldcart.setUpdatetime(new Date());
				cartService.addCart(oldcart);
			}else{
				cart.setCreatetime(new Date());
				cart.setStatus(0);
				cart.setShopuser(user);
				cartService.addCart(cart);
			}
		}else{
			//购物项数量加减
			Cart cart1 = cartService.findById(cart.getId());
			cart1.setNumber(cart.getNumber());
			cart1.setUpdatetime(new Date());
			cartService.addCart(cart1);
			map.put("result", "true");
		}
		ServletActionContext.getResponse().setContentType("text/html;charset=utf-8");
		ServletActionContext.getResponse().getWriter().write(JSONArray.toJSONString(map));
		return NONE;
	}
	/**'
	 * 异步添加购物车
	 */
	private int productid;
	public int getProductid() {
		return productid;
	}
	public void setProductid(int productid) {
		this.productid = productid;
	}
	public void ajaxadd() throws IOException{
		Map map = new HashMap<String, String>();
		if(productid!=0){
			Shopuser user = (Shopuser) ServletActionContext.getRequest().getSession().getAttribute("existUser");
			Product product = new Product();
			product.setId(productid);
			cart.setShopuser(user);
			cart.setProduct(product);
			Cart oldcart = cartService.findByPid(cart);
			if(oldcart!=null){
				oldcart.setNumber(cart.getNumber()+oldcart.getNumber());
				oldcart.setUpdatetime(new Date());
				cartService.addCart(oldcart);
				map.put("status", 1);
			}else{
				cart.setCreatetime(new Date());
				cart.setStatus(0);
				cartService.addCart(cart);
				map.put("status", 0);
			}
		}else{
			map.put("status", 2);
		}
		ServletActionContext.getResponse().setContentType("text/html;charset=utf-8");
		ServletActionContext.getResponse().getWriter().write(JSONArray.toJSONString(map));
	}
	/**
	 * 添加购物车并进入订单状态
	 * @return
	 */
	public String findAllCart(){
		Shopuser user = (Shopuser) ServletActionContext.getRequest().getSession().getAttribute("existUser");
		if(cart.getProduct()==null){
			return "findAllCart";
		}
		cart.setShopuser(user);
		Cart oldcart = cartService.findByPid(cart);
		if(oldcart!=null){
			oldcart.setNumber(cart.getNumber()+oldcart.getNumber());
			oldcart.setUpdatetime(new Date());
			cartService.addCart(oldcart);
		}else{
			cart.setCreatetime(new Date());
			cart.setStatus(0);
			cart.setShopuser(user);
			cartService.addCart(cart);
		}
		return "findAllCart";
	}
	/**
	 * 查询所有购物项
	 * @return
	 */
	public String findCarts(){
		Shopuser user = (Shopuser) ServletActionContext.getRequest().getSession().getAttribute("existUser");
		List<Cart> list = cartService.findAllCart(user);
		ActionContext.getContext().put("carttList", list);
		return "findCarts";
	}
	/**
	 * 删除购物项
	 * @return
	 */
	public String deleteCart(){
		cartService.deleteCart(cart);
		try {
			ServletActionContext.getResponse().getWriter().print("success");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return NONE;
	}
	/**
	 * 购物车是否为空
	 * @return
	 * @throws IOException
	 */
	public String existcart() throws IOException{
		Shopuser user = (Shopuser) ServletActionContext.getRequest().getSession().getAttribute("existUser");
		List<Cart> list = cartService.findAllCart(user);
		if(list.size()>0){
			ServletActionContext.getRequest().getSession().setAttribute("mycartnumber", list.size());
			ServletActionContext.getResponse().getWriter().print("true");
		}else{
			ServletActionContext.getRequest().getSession().setAttribute("mycartnumber", 0);
			ServletActionContext.getResponse().getWriter().print("false");
		}
		return NONE;
	}
	
	public String findCart() throws IOException{
		Shopuser user = (Shopuser) ServletActionContext.getRequest().getSession().getAttribute("existUser");
		List<Cart> list1 = cartService.findAllCart(user);
		List<Address> list2 = addressService.findByUid(user);
		ServletActionContext.getRequest().setAttribute("cartList", list1);
		ServletActionContext.getRequest().setAttribute("addrList", list2);
		
		return "findCart";
	}

}
