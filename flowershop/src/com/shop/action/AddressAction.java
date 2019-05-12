package com.shop.action;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.shop.entity.Address;
import com.shop.entity.Shopuser;
import com.shop.service.AddressService;

public class AddressAction extends ActionSupport implements ModelDriven<Address> {
	
	private Address address = new Address();
	public Address getModel() {
		return address;
	}
	private AddressService addressService;
	public void setAddressService(AddressService addressService) {
		this.addressService = addressService;
	}
	
	/**
	 * 保存收货地址
	 */
	public String save(){
		Shopuser user = (Shopuser) ServletActionContext.getRequest().getSession().getAttribute("existUser");
		address.setUser(user);
		if(address.getStatus()==1){
			/*修改该用户下其他地址为非默认*/
			addressService.updateStatus(address);
		}
		addressService.save(address);
		return SUCCESS;
	}
	/**
	 * 修改默认收货地址
	 */
	public String updateStatus(){
		Shopuser user = (Shopuser) ServletActionContext.getRequest().getSession().getAttribute("existUser");
		address.setUser(user);
		int id = address.getId();
		address.setId(0);
		addressService.updateStatus(address);
		address.setId(id);
		addressService.updateStatus(address);
		return SUCCESS;
	}
	/**
	 * 删除收货地址
	 */
	public String delete(){
		addressService.delete(address);
		return SUCCESS;
	}
	/**
	 * 查看收货地址
	 */
	public String findById(){
		address = addressService.findById(address);
		ActionContext.getContext().put("address", address);
		return "findById";
	}
	/**
	 * 修改收货地址内容
	 */
	public String update(){
		Shopuser user = (Shopuser) ServletActionContext.getRequest().getSession().getAttribute("existUser");
		address.setUser(user);
		if(address.getStatus()==1){
			/*修改该用户下其他地址为非默认*/
			Address address1 = new Address();
			address1.setUser(user);
			addressService.updateStatus(address1);
		}
		addressService.update(address);
		return SUCCESS;
	}
}
