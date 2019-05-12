package com.shop.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.shop.dao.AdminDao;
import com.shop.entity.Admin;
import com.shop.entity.Category;

/**
 * 商城后台管理登录业务层
 * @author xiaohai
 *
 */
@Transactional
public class AdminService {
	private AdminDao adminDao;
	public void setAdminDao(AdminDao adminDao) {
		this.adminDao = adminDao;
	}
	/**
	 * 登录操作
	 * @param admin
	 */
	public Admin login(Admin admin) {
		return adminDao.login(admin.getAdmin(),admin.getPassword());
	}
	/**
	 * 查询所有分类
	 * @return
	 */
	public List<Category> findcategory() {
		return adminDao.findcategory();
	}
	
	
}
