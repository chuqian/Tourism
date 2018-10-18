package com.admin.controller;

import java.util.Date;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.admin.service.CommentService;
import com.entity.PageQueryVo;
import com.entity.Pager;
import com.entity.UserCommSce;

@Controller
@RequestMapping("/comment")
@SuppressWarnings("unchecked")
public class CommentController {
	
	@Autowired
	private CommentService commentService;
	
	@RequestMapping("/{path}")
	public ModelAndView userCommentList(@PathVariable String path, String username, Date date, PageQueryVo vo){
		ModelAndView mv = new ModelAndView("comment/userComment.jsp");
		Map<String, Object> map = commentService.userCommentList(username, date, vo);
		mv.addObject("pager", (Pager<UserCommSce>)map.get("pager"));
		return mv;
	}
	
	/*@RequestMapping("/scenicComment")
	public ModelAndView scenicCommentList(){
		ModelAndView mv = new ModelAndView("comment/scenicComment.jsp");
		return mv;
	}*/
}
