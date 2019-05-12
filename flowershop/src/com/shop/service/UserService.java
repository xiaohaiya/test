package com.shop.service;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.springframework.transaction.annotation.Transactional;

import com.shop.dao.UserDao;
import com.shop.entity.Order;
import com.shop.entity.Shopuser;
import com.shop.utils.MD5Utils;
import com.shop.utils.PageModel;

@Transactional
public class UserService {
	private UserDao userDao;

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	/**
	 * 业务层中注册用户的方法
	 * @param user
	 */
	public void regist(Shopuser user) {
		//对用户的密码进行加密
		String password = MD5Utils.md5(user.getPassword());
		user.setPassword(password);
		userDao.save(user);
	}
	/**
	 * 业务层用户登录
	 * @param user
	 * @return
	 */
	public Shopuser login(Shopuser user) {
		user.setPassword(MD5Utils.md5(user.getPassword()));
		return userDao.findUser(user);
	}
	/**
	 * 查询所有用户
	 * @return
	 */
	public List<Shopuser> findAll() {
		return userDao.findAll();
	}

	public Shopuser findByUserName(Shopuser user) {
		return userDao.findByUserName(user);
	}

	public void update(Shopuser user) {
		userDao.update(user);
	}

	public Shopuser findById(Shopuser user) {
		return userDao.findById(user.getId());
	}

	public PageModel<Shopuser> findByPage(DetachedCriteria detachedCriteria,
			PageModel<Shopuser> pageModel) {
		Integer totalCount = userDao.findCount(detachedCriteria);
		pageModel.setTotalCount(totalCount);
		//封装总页数
		Double d = totalCount.doubleValue();
		//Math.ceil(d/4);//向上取整
		pageModel.setTotalPage((int) Math.ceil(d/pageModel.getPageSize()));
		//封装集合
		Integer begin = (pageModel.getCurrPage()-1)*pageModel.getPageSize();
		List<Shopuser> list = userDao.findByPage(detachedCriteria, begin, pageModel.getPageSize());
		pageModel.setList(list);
		return pageModel;
	}
	/**
	 * 禁用会员
	 * @param user
	 */
	public void updateUserStatus(Shopuser user) {
		userDao.updateUserStatus(user);
	}
	/**
	 * 修改用户密码
	 * @param user
	 */
	public void updatePassword(Shopuser user) {
		//对密码进行加密
		String password = MD5Utils.md5(user.getPassword());
		user.setPassword(password);
		userDao.updatePassword(user);
	}


}
