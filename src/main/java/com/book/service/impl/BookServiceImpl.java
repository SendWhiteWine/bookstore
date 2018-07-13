package com.book.service.impl;

import java.awt.geom.Arc2D.Double;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.book.form.UserLogin;
import com.book.mapper.CategoryMapper;
import com.book.mapper.NewsMapper;
import com.book.mapper.OrderitemMapper;
import com.book.mapper.OrdersMapper;
import com.book.mapper.ProductMapper;
import com.book.mapper.UserMapper;
import com.book.pojo.Category;
import com.book.pojo.News;
import com.book.pojo.Orderitem;
import com.book.pojo.OrderitemExample;
import com.book.pojo.Orders;
import com.book.pojo.OrdersExample;
import com.book.pojo.ProAndCatMapper;
import com.book.pojo.Product;
import com.book.pojo.ProductExample;
import com.book.pojo.User;
import com.book.pojo.UserExample;
import com.book.pojo.UserExample.Criteria;
import com.book.service.BookService;

@Service
public class BookServiceImpl implements BookService {
	
	@Autowired
	private CategoryMapper cm;
	@Autowired
	private UserMapper um;
	@Autowired
	private OrdersMapper om;
	@Autowired
	private OrderitemMapper oim;
	@Autowired
	private ProductMapper pm;
	@Autowired
	private NewsMapper nm;

	@Override
	public List<Category> findCategorys() {
		List<Category> list = cm.selectByExample(null);
		return list;
	}

	@Override
	public List<User> checkByName(String uname) {
		UserExample ue = new UserExample();
		Criteria criteria = ue.createCriteria();
		criteria.andUnameEqualTo(uname);
		List<User> list = um.selectByExample(ue);
		return list;
	}

	@Override
	public List<User> userLogin(UserLogin userLogin) {
		UserExample ue = new UserExample();
		Criteria criteria = ue.createCriteria();
		criteria.andUnameEqualTo(userLogin.getUname());
		criteria.andUpwdEqualTo(userLogin.getUpwd());
		List<User> list = um.selectByExample(ue);
		return list;
	}

	@Override
	public void userRegister(User user) {
		String uuid = UUID.randomUUID().toString().replaceAll("-", "");
		user.setUid(uuid);
		um.insert(user);
	}

	@Override
	public void userAlter(User user) {
		um.updateByPrimaryKey(user);
	}

	@Override
	public List<Product> showpro(String cid) {
		ProductExample pe = new ProductExample();
		com.book.pojo.ProductExample.Criteria criteria = pe.createCriteria();
		criteria.andCidEqualTo(cid);
		return pm.selectByExample(pe);
	}

	@Override
	public List<Product> productSearch(String name) {
		ProductExample pe = new ProductExample();
		com.book.pojo.ProductExample.Criteria criteria = pe.createCriteria();
		criteria.andPnameLike("%"+name+"%");
		return pm.selectByExample(pe);
	}

	@Override
	public List<ProAndCatMapper> showProduct(String pid) {
		
		return pm.showProduct(pid);
	}

	@Override
	public Product findOneById(String pid) {
		
		return pm.selectByPrimaryKey(pid);
	}

	@Override
	public boolean createOrder(Orders orders) {
		int insert = 0;
		insert = om.insert(orders);
		if (insert>0) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public boolean createOrderitem(List<Orderitem> list) {
		for (Orderitem o : list) {
			oim.insert(o);
		}
		return true;
	}

	@Override
	public List<News> showNotice() {
		
		return nm.selectByExample(null);
	}

	@Override
	public List<Product> showAllProduct() {
		
		return pm.selectByExample(null);
	}

	@Override
	public List<ProAndCatMapper> showAllProAndCatMapper() {
		
		return pm.showAllProAndCatMapper();
	}

	@Override
	public void addProduct(Product product) {
		
		pm.insert(product);
	}

	@Override
	public void productUpdate(Product product) {
		pm.updateByPrimaryKey(product);
	}

	@Override
	public void productDelete(String pid) {
		OrderitemExample oe = new OrderitemExample();
		com.book.pojo.OrderitemExample.Criteria createCriteria = oe.createCriteria();
		createCriteria.andPidEqualTo(pid);
		oim.deleteByExample(oe);
		pm.deleteByPrimaryKey(pid);
	}

	@Override
	public List<Product> proSearch(Product product, double minprice, double maxprice) {
		ProductExample pe = new ProductExample();
		com.book.pojo.ProductExample.Criteria criteria = pe.createCriteria();
		if (product.getPid()!="") {
			criteria.andPidEqualTo(product.getPid());
		}
		if (product.getCid()!="") {
			criteria.andCidEqualTo(product.getCid());
		}
		if (product.getPname()!="") {
			criteria.andPnameLike("%"+product.getPname()+"%");
		}
		if (minprice==0.0 && maxprice>0.0) {
			criteria.andShopPriceLessThanOrEqualTo(maxprice);
		}
		if (minprice>0.0 && maxprice==0.0) {
			criteria.andShopPriceGreaterThanOrEqualTo(minprice);
		}
		if (minprice>0.0 && maxprice>0.0) {
			criteria.andShopPriceBetween(minprice, maxprice);
		}
		
		return pm.selectByExample(pe);
	}

	@Override
	public List<Orders> orderShow() {
		
		return om.selectByExample(null);
	}

	@Override
	public List<Orders> orderShowOne(String uid) {
		OrdersExample oe = new OrdersExample();
		com.book.pojo.OrdersExample.Criteria createCriteria = oe.createCriteria();
		createCriteria.andUidEqualTo(uid);
		
		return om.selectByExample(oe);
	}

	@Override
	public List<Orderitem> orderInfo(String oid) {
		OrderitemExample oe = new OrderitemExample();
		com.book.pojo.OrderitemExample.Criteria criteria = oe.createCriteria();
		criteria.andOidEqualTo(oid);
		List<Orderitem> list = oim.selectByExample(oe);
		for (Orderitem orderitem : list) {
			Product product = pm.selectByPrimaryKey(orderitem.getPid());
			orderitem.setProduct(product);
		}
		return list;
	}

	@Override
	public Orders showOneOrder(String oid) {
		
		return om.selectByPrimaryKey(oid);
	}

	@Override
	public List<Orders> showAllOrders() {
		List<Orders> list = om.selectByExample(null);
		for (Orders o : list) {
			o.setUname(um.selectByPrimaryKey(o.getUid()).getUname());
		}
		return list;
	}


}
