package com.book.service;

import java.util.List;

import com.book.form.UserLogin;
import com.book.pojo.Category;
import com.book.pojo.News;
import com.book.pojo.Orderitem;
import com.book.pojo.Orders;
import com.book.pojo.ProAndCatMapper;
import com.book.pojo.Product;
import com.book.pojo.User;

public interface BookService {

	List<Category> findCategorys();

	List<User> checkByName(String uname);

	List<User> userLogin(UserLogin userLogin);

	void userRegister(User user);

	void userAlter(User user);

	List<Product> showpro(String cid);

	List<Product> productSearch(String name);

	List<ProAndCatMapper> showProduct(String pid);

	Product findOneById(String pid);

	boolean createOrder(Orders orders);

	boolean createOrderitem(List<Orderitem> list);

	List<News> showNotice();

	List<Product> showAllProduct();

	List<ProAndCatMapper> showAllProAndCatMapper();

	void addProduct(Product product);

	void productUpdate(Product product);

	void productDelete(String pid);

	List<Product> proSearch(Product product, double minprice, double maxprice);

	List<Orders> orderShow();

	List<Orders> orderShowOne(String uid);

	List<Orderitem> orderInfo(String oid);

	Orders showOneOrder(String oid);

	List<Orders> showAllOrders();

}
