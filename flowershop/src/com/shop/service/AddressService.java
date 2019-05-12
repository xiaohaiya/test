package com.shop.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.shop.dao.AddressDao;
import com.shop.entity.Address;
import com.shop.entity.Shopuser;

@Transactional
public class AddressService {
	private AddressDao addressDao;
	public void setAddressDao(AddressDao addressDao) {
		this.addressDao = addressDao;
	}
	/**
	 * 新增收货地址业务层
	 * @param address
	 */
	public void save(Address address) {
		addressDao.save(address);
	}
	/**
	 * 查询收货地址
	 * @param user
	 * @return
	 */
	public List<Address> findByUid(Shopuser user) {
		return addressDao.findByUid(user.getId());
	}
	/**
	 * 修改默认收货地址
	 * @param user
	 */
	public void updateStatus(Address addr) {
		addressDao.updateStatus(addr);
	}
	/**
	 * 删除收货地址
	 * @param address
	 */
	public void delete(Address address) {
		addressDao.delete(address);
	}
	/**
	 * 查询收货地址信息
	 * @param address
	 * @return
	 */
	public Address findById(Address address) {
		return addressDao.findById(address.getId());
	}
	/**
	 * 修改收货地址
	 * @param address
	 */
	public void update(Address address) {
		addressDao.update(address);
	}
}
