package com.shop.dao;

import java.util.List;

import com.shop.entity.Admin;
import com.shop.entity.Category;
/**
 * 后台管理持久层代码
 * @author xiaohai
 *
 */
public class AdminDao extends BaseDao<Admin> {
	/**
	 * 登录
	 * @param admin
	 * @param password
	 * @return
	 */
	public Admin login(String admin, String password) {
		List<Admin> list = (List<Admin>) this.getHibernateTemplate().find("from Admin where admin = ? and password = ?", admin,password);
		if(list.size()>0){
			return list.get(0);
		}else{
			return null;
		}
	}
	/**
	 * 查询分类列表
	 * @return
	 */
	public List<Category> findcategory() {
		return (List<Category>) this.getHibernateTemplate().find("from Category");
	}

}
