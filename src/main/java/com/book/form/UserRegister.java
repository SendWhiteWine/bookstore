package com.book.form;

public class UserRegister {
	private String uemail;
	private String uname;
	private String upwd;
	private String reupwd;
	private String ugender;
	private String utel;
	private String uintroduce;
	public UserRegister() {
		super();
		
	}
	public String getUemail() {
		return uemail;
	}
	public void setUemail(String uemail) {
		this.uemail = uemail;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getUpwd() {
		return upwd;
	}
	public void setUpwd(String upwd) {
		this.upwd = upwd;
	}
	public String getReupwd() {
		return reupwd;
	}
	public void setReupwd(String reupwd) {
		this.reupwd = reupwd;
	}
	public String getUgender() {
		return ugender;
	}
	public void setUgender(String ugender) {
		this.ugender = ugender;
	}
	public String getUtel() {
		return utel;
	}
	public void setUtel(String utel) {
		this.utel = utel;
	}
	public String getUintroduce() {
		return uintroduce;
	}
	public void setUintroduce(String uintroduce) {
		this.uintroduce = uintroduce;
	}
	@Override
	public String toString() {
		return "UserRegister [uemail=" + uemail + ", uname=" + uname + ", upwd=" + upwd + ", reupwd=" + reupwd
				+ ", ugender=" + ugender + ", utel=" + utel + ", uintroduce=" + uintroduce + "]";
	}
	
}
