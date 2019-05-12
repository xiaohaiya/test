package com.shop.dao;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Projections;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

/**
 * 抽取通用的dao方法
 * 
 * @author xiaohai
 *
 */
public class BaseDao<T> extends HibernateDaoSupport {

	// 方式一：通过带参数的构造方法来讲class类型传入
	/*
	 * private Class clazz; public BaseDao(Class clazz) { this.clazz = clazz; }
	 */
	// 方式二：通过父类的无参构造方法，以反射的形式将class对象获取
	private Class clazz;
	public BaseDao() {
		Class clazz = this.getClass();//获取到的是正在执行操作的类的clas对象 比如 CustomerDao、LinkManDao
		Type type = clazz.getGenericSuperclass();//得到的是正在执行类的父类的参数化类型 比如 BaseDao<User>、BaseDao<Customer>、BaseDao<LinkMan>
		//将这个type转成他的子类ParameterizedType参数化类型,才能用子类的方法得到相应的参数类型
		ParameterizedType parameterizedType = (ParameterizedType) type;
		Type[] types = parameterizedType.getActualTypeArguments();//得到的是参数类型数组，我们这里只有一个，只用获取第一个值就行
		clazz = (Class) types[0];//Type类是class类的子类
		this.clazz = clazz;
	}

	/**
	 * 保存操作
	 * 
	 * @param t
	 */
	public void save(T t) {
		this.getHibernateTemplate().save(t);
	}

	/**
	 * 更新操作
	 * 
	 * @param t
	 */
	public void update(T t) {
		this.getHibernateTemplate().update(t);
	}

	/**
	 * 删除操作
	 * 
	 * @param t
	 */
	public void delete(T t) {
		this.getHibernateTemplate().delete(t);
	}

	/**
	 * 查询操作
	 * 
	 * @param id
	 * @return
	 */
	public T findById(Serializable id) {
		return (T) this.getHibernateTemplate().get(clazz, id);
	}

	/**
	 * 查询所有记录
	 * 
	 * @return
	 */
	public List<T> findAll() {
		return (List<T>) this.getHibernateTemplate().find("from " + clazz.getSimpleName());
	}

	/**
	 * 查询总记录数
	 * 
	 * @return
	 */
	public Integer findCount(DetachedCriteria detachedCriteria) {
		detachedCriteria.setProjection(Projections.rowCount());
		List<Long> list = (List<Long>) this.getHibernateTemplate().findByCriteria(detachedCriteria);
		if (list.size() > 0) {
			return list.get(0).intValue();
		}
		return null;
	}
	/**
	 * 分页查询
	 * @param detachedCriteria
	 * @param begin
	 * @param pageSize
	 * @return
	 */
	public List<T> findByPage(DetachedCriteria detachedCriteria, Integer begin, Integer pageSize) {
		detachedCriteria.setProjection(null);
		return (List<T>) this.getHibernateTemplate().findByCriteria(detachedCriteria, begin, pageSize);
	}
}
