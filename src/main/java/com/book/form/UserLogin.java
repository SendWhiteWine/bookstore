package com.book.form;

public class UserLogin {
	private String uname;
	private String upwd;
	private String rememberMe;
	private String autoLogin;
	public UserLogin() {
		super();
		
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
	public String getRememberMe() {
		return rememberMe;
	}
	public void setRememberMe(String rememberMe) {
		this.rememberMe = rememberMe;
	}
	public String getAutoLogin() {
		return autoLogin;
	}
	public void setAutoLogin(String autoLogin) {
		this.autoLogin = autoLogin;
	}
	@Override
	public String toString() {
		return "UserLogin [uname=" + uname + ", upwd=" + upwd + ", rememberMe=" + rememberMe + ", autoLogin="
				+ autoLogin + "]";
	}
	
}
