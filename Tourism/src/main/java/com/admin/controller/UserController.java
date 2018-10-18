package com.admin.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.admin.service.UserService;
import com.entity.PageQueryVo;
import com.entity.Pager;
import com.entity.User;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private UserService userService;
	
	/**
	 * 列表显示，只用初始化页面数据显示
	 * @param vo
	 * @return
	 */
	@RequestMapping("/list")
	public ModelAndView userList(PageQueryVo vo){
		ModelAndView mv = new ModelAndView("user/userList.jsp");
		Pager<User> pager = userService.userList();

		mv.addObject("currentPage", pager.getCurrentPage());
		mv.addObject("pageCount", pager.getPageCount());
		mv.addObject("userList", pager.getRows());
		return mv;
	}
	
	/**
	 * 多条件查询
	 * @param user
	 * @param vo
	 * @return
	 */
	@RequestMapping("/selectByCondition")
	public ModelAndView selectByCondition(User user, PageQueryVo vo, String toupiao){
		ModelAndView mv = new ModelAndView("user/userList2.jsp");
		Pager<User> pager = userService.selectByCondition(user, vo);
		
		mv.addObject("currentPage", pager.getCurrentPage());
		mv.addObject("pageCount", pager.getPageCount());
		mv.addObject("userList", pager.getRows());
		//回显查询信息
		//mv.addObject("user", user);
		return mv;
	}
	
	/**
	 * 跳转至输入页面
	 * @param userId
	 * @return
	 */
	@RequestMapping("/toInput")
	public ModelAndView toAdd(Long userId){
		ModelAndView mv = new ModelAndView("user/userInput.jsp");
		mv.addObject("user", userService.toInput(userId));
		return mv;
	}
	
	/**
	 * 新增/更新
	 * @param response
	 * @param user
	 * @return
	 * @throws IOException
	 */
	@RequestMapping("/addOrUpdate")
	public ModelAndView addOrUpdate(HttpServletResponse response, User user) throws IOException{
		String type = userService.userAddOrUpdate(user);
		response.getWriter().write(type);
		return null;
	}
	
	@RequestMapping("/del")
	public ModelAndView userDel(@RequestParam(required=true) Long delId){
		userService.userDel(delId);
		return null;
	}
}
