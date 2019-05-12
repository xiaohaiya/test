package com.shop.dao;

import java.util.List;

import com.shop.entity.Address;
import com.shop.entity.Shopuser;

public class AddressDao extends BaseDao<Address> {
	/**
	 * 持久层查询用户的收货地址列表
	 * @param id
	 * @return
	 */
	public List<Address> findByUid(int id) {
		// TODO Auto-generated method stub
		return (List<Address>) this.getHibernateTemplate().find("from Address where uid = ?", id);
	}
	/**
	 * 修改默认收货地址
	 * @param user
	 * @param addr
	 */
	public void updateStatus(Address addr) {
		if(addr.getId()==0){
			this.getHibernateTemplate().bulkUpdate("update Address set status = ? where uid = ?", 0, addr.getUser().getId());
		}else{
			this.getHibernateTemplate().bulkUpdate("update Address set status = ? where id = ?", 1, addr.getId());
		}
	}
	
}
