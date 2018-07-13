package com.book.controller;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.book.form.UserLogin;
import com.book.pojo.Cart;
import com.book.pojo.CartItem;
import com.book.pojo.Category;
import com.book.pojo.News;
import com.book.pojo.Orderitem;
import com.book.pojo.Orders;
import com.book.pojo.ProAndCatMapper;
import com.book.pojo.Product;
import com.book.pojo.User;
import com.book.service.BookService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("/book")
public class BookController {
	
	@Autowired
	private BookService bs;
	@Autowired
	private HttpServletRequest request;
	@Autowired
	private HttpServletResponse response;
	
	
	@RequestMapping("/findCategorys")
	@ResponseBody
	public List<Category> run() {
		List<Category> list = bs.findCategorys();
		return list;
	}
	
	@RequestMapping("/showNotice")
	@ResponseBody
	public List<News> run13() {
		List<News> list = bs.showNotice();
		return list;
	}
	
	@RequestMapping("/userLogin")
	public String run2(UserLogin userLogin) {
		List<User> list = bs.userLogin(userLogin);
		Cookie c=new Cookie("username",userLogin.getUname());
		Cookie c1=new Cookie("upwd",userLogin.getUpwd());
		Cookie c2=new Cookie("autoLogin",userLogin.getAutoLogin());
		if(list.size()!=0){
			//登陆成功
			if("on".equals(userLogin.getRememberMe())){//勾选了记住我框
				//设置时长15天
				c.setMaxAge(15*24*3600);
				c1.setMaxAge(15*24*3600);
			}else{
				//登陆成功不想记录
				c.setMaxAge(0);
				c1.setMaxAge(0);
			}
			//存储cookie
			response.addCookie(c);
			response.addCookie(c1);
			
			
			if("on".equals(userLogin.getAutoLogin())){
				c2.setMaxAge(15*24*3600);
				Cookie[] cookies = request.getCookies();
				for (Cookie cookie : cookies) {
					if ("JSESSIONID".equals(cookie.getName())) {
						cookie.setMaxAge(15*24*3600);
						cookie.setPath("/ssh/");
						request.getSession().setMaxInactiveInterval(15*24*3600);
						response.addCookie(cookie);
					}
				}
			} else {
				c2.setMaxAge(0);
			}
			
			response.addCookie(c2);
			request.getSession().setAttribute("user", list.get(0));
			return "redirect:/pro/index";
		}else{
			//错误
			return "redirect:/pro/login";
		}
	}
	
	@RequestMapping("/loginShow")
	public String run15(HttpServletResponse response) {
		
		//取出cookie
		Cookie[] cookies=request.getCookies();
		
		return "forward:/pro/login";
	}
	
	@RequestMapping("/checkByName")
	@ResponseBody
	public Map<String, Object> run1(String uname) {
		Map<String, Object> map = new HashMap<>();
		List<User> list = bs.checkByName(uname);
		if (list.size()==0) {
			map.put("flag", 0);
		} else {
			map.put("flag", 1);
		}
		return map;
	}
	
	@RequestMapping("/userRegister")
	public String run4(User user) {
		HttpSession session = request.getSession();
		String word = (String) session.getAttribute("checkcode_session");
		if (user.getCode().equals(word)) {
			bs.userRegister(user);
			return "redirect:/pro/registersuccess";
		} else {
			return "redirect:/pro/register";
		}
	}
	
	@RequestMapping("/productSearch")
	public String run8(String name,Model model,@RequestParam(defaultValue="5")Integer pageSize,
			@RequestParam(defaultValue="1")Integer currentPage) {
		String uri = request.getRequestURI();
		String url = uri+"?name="+name+"&";
		PageHelper.startPage(currentPage, pageSize);
		List<Product> pro = bs.productSearch(name);
		PageInfo<Product> pageInfo = new PageInfo<>(pro, 5);
		model.addAttribute("pro", pro);
		model.addAttribute("pb", pageInfo);
		model.addAttribute("uri", url);
		return "forward:/pro/product_list1";
	}
	
	@RequestMapping("/userAlter")
	public String run6(User user) {
		User user1 = (User) request.getSession().getAttribute("user");
		if (user1==null) {
			return "redirect:/pro/login";
		} else {
			user1.setUpwd(user.getUpwd());
			user1.setUgender(user.getUgender());
			user1.setUtel(user.getUtel());
			bs.userAlter(user1);
			return "redirect:/pro/modifyUserInfoSuccess";
			
		}
	}
	
	@RequestMapping("/userLogout")
	public String run5(HttpServletResponse response) {
		request.getSession().invalidate();//销毁session
		//autoLogin自动登录的cookie
		Cookie[] cookies = request.getCookies();
		if(cookies!=null){
			for(Cookie c:cookies){
				if("autoLogin".equals(c.getName())){
					c.setMaxAge(0);
					response.addCookie(c);
				}
				if("username".equals(c.getName())){
					c.setMaxAge(0);
					response.addCookie(c);
				}
				if("upwd".equals(c.getName())){
					c.setMaxAge(0);
					response.addCookie(c);
				}
			}
		}
		
		return "redirect:/pro/index";
	}
	
	@RequestMapping("/productShow")
	public String run7(Model model,@RequestParam(defaultValue="5")Integer pageSize,
			@RequestParam(defaultValue="1")Integer currentPage, String cid, HttpServletRequest request) {
		String uri = request.getRequestURI();
		String url = uri+"?cid="+cid+"&";
		PageHelper.startPage(currentPage, pageSize);//分页
		List<Product> pro = bs.showpro(cid);
		PageInfo<Product> pageInfo = new PageInfo<>(pro, 5);
		model.addAttribute("pro", pro);
		model.addAttribute("pb", pageInfo);
		model.addAttribute("uri", url);
		return "forward:/pro/product_list";
	}
	
	@RequestMapping("/productDetails")
	public String run9(String pid, Model model) {
		List<ProAndCatMapper> p = bs.showProduct(pid);
		if (p.size()==0) {
			return "redirect:/pro/login";
		} else {
			model.addAttribute("p", p.get(0));
			return "forward:/pro/product_info";
		}
	}
	
	@RequestMapping("/productDelete")
	public String run11(String pid) {
		HttpSession session = request.getSession();
		Cart cart = (Cart) session.getAttribute("cart");
		Map<String, CartItem> items = cart.getItems();
		cart.setTotal(cart.getTotal()-items.get(pid).getSubTotal());
		items.remove(pid);
		session.setAttribute("cart", cart);
		return "redirect:/pro/cart";
	}
	
	@RequestMapping("/addToCart")
	public String run10(String pid, Model model, Integer buyNum) {
		HttpSession session = request.getSession();
		Product product = null;
		product = bs.findOneById(pid);
		Cart cart = (Cart) session.getAttribute("cart");
		if (cart==null) {
			cart = new Cart();
		}
		Map<String, CartItem> items = cart.getItems();
		if (items.containsKey(pid)) {
			CartItem c = items.get(pid);
			c.setBuyNum(c.getBuyNum()+buyNum);
			c.setProduct(product);
			c.setSubTotal(c.getBuyNum()*c.getProduct().getShopPrice());
			items.put(pid, c);
			cart.setTotal(cart.getTotal()+buyNum*c.getProduct().getShopPrice());
		} else {
			CartItem cartItem = new CartItem();
			cartItem.setProduct(product);
			cartItem.setBuyNum(buyNum);
			cartItem.setSubTotal(buyNum*product.getShopPrice());
			items.put(pid, cartItem);
			cart.setTotal(cart.getTotal()+cartItem.getSubTotal());
		}
		session.setAttribute("cart", cart);
		return "redirect:/pro/cart";
	}
	
	@RequestMapping("/orderCreate")
	public String run12(Orders orders) {
		HttpSession session = request.getSession();
		Cart cart = (Cart) session.getAttribute("cart");
		User user = (User) session.getAttribute("user");
		if (user==null) {
			return "redirect:/pro/login";
		} else {
			if(cart==null){
				return "redirect:/pro/cart";
			}else{
				String oid = UUID.randomUUID().toString().replaceAll("-", "");
				orders.setOid(oid);
				orders.setOrdertime(new Date());
				orders.setTotal(cart.getTotal());
				orders.setState(0);
				orders.setUid(user.getUid());
				boolean flag1 = bs.createOrder(orders);
				Map<String, CartItem> items = cart.getItems();
				
				Collection<CartItem> values = items.values();
				
				List<Orderitem> list = new ArrayList<>();
				for (CartItem c : values) {
					Orderitem o = new Orderitem();
					o.setCount(c.getBuyNum());
					o.setItemid(UUID.randomUUID().toString().replaceAll("-", ""));
					o.setOid(oid);
					o.setPid(c.getProduct().getPid());
					o.setSubtotal(c.getSubTotal());
					
					list.add(o);
				}
				
				boolean flag2 = bs.createOrderitem(list);
				
				if(flag1&&flag2){
					//清空购物车
					session.removeAttribute("cart");
					
					//跳转到支付界面
					return "redirect:/pro/index";
				} else {
					return "redirect:/pro/index";
				}
			}
		}
		
	}
	
	
	@RequestMapping("/orderShow")
	public String run16(Model model,@RequestParam(defaultValue="5")Integer pageSize,
			@RequestParam(defaultValue="1")Integer currentPage, HttpServletRequest request) {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		if (user==null) {
			return "redirect:/pro/myAccount";
		} else {
			String uri = request.getRequestURI();
			String url = uri+"?";
			PageHelper.startPage(currentPage, pageSize);//分页
			List<Orders> orders = bs.orderShowOne(user.getUid());
			PageInfo<Orders> pageInfo = new PageInfo<>(orders, 5);
			model.addAttribute("orders", orders);
			model.addAttribute("pb", pageInfo);
			model.addAttribute("uri", url);
			return "forward:/pro/orderlist";
			
		}
	}
	
	@RequestMapping("/orderInfo")
	public String run17(Model model,@RequestParam(defaultValue="5")Integer pageSize,
			@RequestParam(defaultValue="1")Integer currentPage, String oid, HttpServletRequest request) {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		if (user==null) {
			return "redirect:/pro/myAccount";
		} else {
			Orders order = bs.showOneOrder(oid);
			String uri = request.getRequestURI();
			String url = uri+"?oid="+oid+"&";
			PageHelper.startPage(currentPage, pageSize);//分页
			List<Orderitem> orders = bs.orderInfo(oid);
			PageInfo<Orderitem> pageInfo = new PageInfo<>(orders, 5);
			model.addAttribute("orders", orders);
			model.addAttribute("order", order);
			model.addAttribute("pb", pageInfo);
			model.addAttribute("uri", url);
			return "forward:/pro/orderInfo";
			
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
