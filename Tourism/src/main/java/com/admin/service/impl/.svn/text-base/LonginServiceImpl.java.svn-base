package com.admin.service.impl;

import org.springframework.stereotype.Service;

import com.admin.service.LoginService;
import com.entity.Role;

@Service
public class LonginServiceImpl implements LoginService {

	@Override
	public String selectRole(Role role) {
		if(role.getRoleName()!=null && role.getRoleName().equals("admin")){
			if(role.getRolePassword()!=null && role.getRolePassword().equals("admin"))
				return "admin/index.jsp";
		}
		return "admin/adminLogin.jsp";
	}

}
