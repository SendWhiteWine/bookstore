package com.book.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class GlobalJump {
	@RequestMapping("/pro/{path}")
	public String run(@PathVariable("path") String path) {
		return "user/"+path;
	}
	
	@RequestMapping("/adm/login/{path}")
	public String run1(@PathVariable("path") String path) {
		return "admin/login/"+path;
	}
	
	@RequestMapping("/adm/orders/{path}")
	public String run2(@PathVariable("path") String path) {
		return "admin/orders/"+path;
	}
	
	@RequestMapping("/adm/products/{path}")
	public String run3(@PathVariable("path") String path) {
		return "admin/products/"+path;
	}

	
}
