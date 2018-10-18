package com.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.admin.service.LoginService;
import com.entity.Role;

@Controller
/*@RequestMapping("/operate")*/
public class OperateController {

	@Autowired
	LoginService loginService;
	
	@RequestMapping("/login")
	public ModelAndView login(Role role){
		String pageUrl = loginService.selectRole(role);
		return new ModelAndView(pageUrl);
		/*return null;*/
	}
}
