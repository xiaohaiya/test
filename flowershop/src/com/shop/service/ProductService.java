package com.shop.service;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.criterion.DetachedCriteria;
import org.springframework.transaction.annotation.Transactional;

import com.shop.dao.ProductDao;
import com.shop.entity.Images;
import com.shop.entity.Product;
import com.shop.utils.PageModel;

@Transactional
public class ProductService {
	/*引入dao层*/
	private ProductDao productDao;
	public void setProductDao(ProductDao productDao) {
		this.productDao = productDao;
	}
	/**
	 * 查询商品
	 * @param id
	 * @return
	 */
	public Product findById(int id) {
		return productDao.findById(id);
	}
	/**
	 * 分页查询商品
	 * @param detachedCriteria
	 * @param currPage
	 * @return
	 */
	public PageModel<Product> findByPage(DetachedCriteria detachedCriteria,
			PageModel<Product> pageModel) {
		Integer totalCount = productDao.findCount(detachedCriteria);
		pageModel.setTotalCount(totalCount);
		//封装总页数
		Double d = totalCount.doubleValue();
		//Math.ceil(d/4);//向上取整
		pageModel.setTotalPage((int) Math.ceil(d/pageModel.getPageSize()));
		//封装集合
		Integer begin = (pageModel.getCurrPage()-1)*pageModel.getPageSize();
		List<Product> list = productDao.findByPage(detachedCriteria,begin,pageModel.getPageSize());
		pageModel.setList(list);
		return pageModel;
	}
	/**
	 * 修改商品信息
	 * @param product
	 */
	public void update(Product product) {
		Product oldProduct = productDao.findById(product.getId());
		oldProduct.setCategory(product.getCategory());
		oldProduct.setNewPrice(product.getNewPrice());
		oldProduct.setOldPrice(product.getOldPrice());
		oldProduct.setPdetail(product.getPdetail());
		productDao.getHibernateTemplate().clear();
		productDao.update(oldProduct);
	}
	/**
	 * 保存商品信息
	 * @param product
	 * @param list
	 */
	public void save(Product product, List<Images> list) {
		productDao.save(product);
		for(Images img : list){
			productDao.saveimg(img);
		}
	}
	/**
	 * 商品列表
	 * @return
	 */
	public List<Product> findAll() {
		return productDao.findAll();
	}
	/**
	 * 下架商品
	 * @param product
	 */
	public void offpro(Product product) {
		productDao.offpro(product);
	}
}
