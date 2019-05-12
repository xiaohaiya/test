package com.shop.dao;

import java.util.List;

import com.shop.entity.Shopuser;

public class UserDao extends BaseDao<Shopuser> {
	 
	public Shopuser findUser(Shopuser user) {
		List<Shopuser> list = (List<Shopuser>) this.getHibernateTemplate().find("from Shopuser where username = ? and password = ?", user.getUsername(), user.getPassword());
		if(list.size()>0) {
			return list.get(0);
		}else {
			return null;
		}
	}

	public Shopuser findByUserName(Shopuser user) {
		List<Shopuser> list = (List<Shopuser>) this.getHibernateTemplate().find("from Shopuser where username= ?", user.getUsername());
		if(list.size()>0){
			return list.get(0);
		}else{
			return null;
		}
	}

	public void updateUserStatus(Shopuser user) {
		this.getHibernateTemplate().bulkUpdate("update Shopuser set status = ? where id = ?", user.getStatus(),user.getId());
	}
	
	public void updatePassword(Shopuser user) {
		this.getHibernateTemplate().bulkUpdate("update Shopuser set password = ? where id = ?", user.getPassword(),user.getId());
	}

}

