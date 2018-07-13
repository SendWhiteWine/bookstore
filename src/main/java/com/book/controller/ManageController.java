package com.book.controller;


import java.io.File;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.book.pojo.Orders;
import com.book.pojo.ProAndCatMapper;
import com.book.pojo.Product;
import com.book.service.BookService;
import com.book.util.CommonsUtils;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("/man")
public class ManageController {
	
	@Autowired
	private BookService bs;
	
	@RequestMapping("/showAllProduct")
	public String run(Model model,@RequestParam(defaultValue="5")Integer pageSize,
			@RequestParam(defaultValue="1")Integer currentPage, HttpServletRequest request) {
		String uri = request.getRequestURI();
		String url = uri+"?";
		PageHelper.startPage(currentPage, pageSize);//分页
		List<ProAndCatMapper> list = bs.showAllProAndCatMapper();
		PageInfo<ProAndCatMapper> pageInfo = new PageInfo<>(list, 5);
		model.addAttribute("list", list);
		model.addAttribute("pb", pageInfo);
		model.addAttribute("uri", url);
		return "forward:/adm/products/list";
	}
	
	@RequestMapping("/showAllOrders")
	public String run6(Model model,@RequestParam(defaultValue="5")Integer pageSize,
			@RequestParam(defaultValue="1")Integer currentPage, HttpServletRequest request) {
		String uri = request.getRequestURI();
		String url = uri+"?";
		PageHelper.startPage(currentPage, pageSize);//分页
		List<Orders> list = bs.showAllOrders();
		PageInfo<Orders> pageInfo = new PageInfo<>(list, 5);
		model.addAttribute("list", list);
		model.addAttribute("pb", pageInfo);
		model.addAttribute("uri", url);
		return "forward:/adm/orders/list";
	}
	
	@RequestMapping("/addProduct")
	public String run1(MultipartFile image, Product product, HttpServletRequest request) throws Exception {
		if (!image.isEmpty()) {
			String realPath = request.getServletContext().getRealPath("/static/products/1");
			String name = UUID.randomUUID().toString().replaceAll("-", "")+image.getOriginalFilename();
			File file = new File(realPath+"/"+name);
			image.transferTo(file);
			product.setPimage("products/1/"+name);
		}
		product.setPid(CommonsUtils.getUUID());
		product.setMarketPrice(product.getShopPrice()+100);
		product.setPdate(new Date());
		product.setIsHot(0);
		product.setPflag(0);
		
		bs.addProduct(product);
		
		return "redirect:/man/showAllProduct";
	}
	
	@RequestMapping("/edit")
	public String run2(String pid, Model model) {
		List<ProAndCatMapper> p = bs.showProduct(pid);
		model.addAttribute("p", p.get(0));
		return "forward:/adm/products/edit";
	}
	
	@RequestMapping("/productUpdate")
	public String run3(MultipartFile image, Product product, HttpServletRequest request) throws Exception {
		if (!image.isEmpty()) {
			String realPath = request.getServletContext().getRealPath("/static/products/1");
			String name = UUID.randomUUID().toString().replaceAll("-", "")+image.getOriginalFilename();
			File file = new File(realPath+"/"+name);
			image.transferTo(file);
			product.setPimage("products/1/"+name);
		}
		bs.productUpdate(product);
		
		return "redirect:/man/showAllProduct";
	}
	
	@RequestMapping("/delete")
	public String run4(String pid) {
		bs.productDelete(pid);
		return "redirect:/man/showAllProduct";
	}
	
	@RequestMapping("/proSearch")
	public String run5(Model model, String pid, String pname, String cid, Product product,
			double minprice, double maxprice,
			@RequestParam(defaultValue="5")Integer pageSize,
			@RequestParam(defaultValue="1")Integer currentPage, HttpServletRequest request) {
		String uri = request.getRequestURI();
		String url = uri+"?pid="+pid+"&cid="+cid+"&pname="+pname+"&minprice="+minprice+"&maxprice="+maxprice+"&";
		PageHelper.startPage(currentPage, pageSize);//分页
		List<Product> list = bs.proSearch(product,minprice,maxprice);
		PageInfo<Product> pageInfo = new PageInfo<>(list, 5);
		model.addAttribute("list", list);
		model.addAttribute("p", product);
		model.addAttribute("max", maxprice);
		model.addAttribute("min", minprice);
		model.addAttribute("pb", pageInfo);
		model.addAttribute("uri", url);
		return "forward:/adm/products/list2";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}
