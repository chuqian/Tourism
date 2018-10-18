package com.front.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.entity.Buyticket;
import com.entity.Collect;
import com.entity.Comment;
import com.entity.PageQueryVo;
import com.entity.Pager;
import com.entity.Province;
import com.entity.Scenic;
import com.entity.User;
import com.front.service.FrontUserService;

@Controller
@RequestMapping("/front")
@SuppressWarnings("unchecked")
public class FrontUserController {
	
	@Autowired
	FrontUserService frontUserService;
	
	/**
	 * 登录验证
	 * @param user
	 * @param userIdentity
	 * @return
	 */
	@RequestMapping("/login")
	public ModelAndView login(User user, @RequestParam(required=true)String userIdentity){
		ModelAndView mv = null;
		Long state = frontUserService.login(user, userIdentity);
	
		if(state!=null && state == -1)
			mv = new ModelAndView("front/visitor/index.jsp");
		
		else if(state!=null && state == 0){
			mv = new ModelAndView("front/frontLogin.jsp");
			mv.addObject("message", "用户名或密码错误");
		}
		else{
			mv = new ModelAndView("front/user/index.jsp");
			mv.addObject("userId", state);
			mv.addObject("username", user.getUsername());
		}
		return mv;
	}
	
	@RequestMapping("/toRegister")
	public ModelAndView toRegister(){
		return new ModelAndView("front/user/register.jsp");
	}
	
	/**
	 * 用户注册
	 * @param user
	 * @param response
	 * @return
	 * @throws IOException 
	 */
	@RequestMapping("/register")
	public ModelAndView register(User user, HttpServletResponse response) throws IOException{
		response.getWriter().print("");
		frontUserService.register(user);
		return null;
	}

	/**
	 * 根据特定条件获取景点
	 * @param userId
	 * @param username
	 * @param scenic
	 * @param vo
	 * @return
	 */
	@RequestMapping("/getAllScenic")
	public ModelAndView getAllScenic(Long userId, String username, Scenic scenic, PageQueryVo vo){
		
		ModelAndView mv = new ModelAndView("front/user/list.jsp");
		Map<String, Object> map = frontUserService.getAllScenic(scenic, vo);

		mv.addObject("userId", userId);      //回显登录用户id
		mv.addObject("username", username);   //回显登录用户名
		mv.addObject("pager", (Pager<Scenic>) map.get("scenicPager"));
		mv.addObject("provinceList", (List<Province>)map.get("provinceList"));
		mv.addObject("scenicTypes", map.get("scenicTypes"));
		return mv;
	}
	
	/**
	 * 发表景点评论
	 * @param comment
	 * @return
	 */
	@RequestMapping("/commentPublish")
	public ModelAndView commentPublish(Comment comment){
		frontUserService.commentPublish(comment);
		return null;
	}
	
	/**
	 * 景点收藏
	 * @param collect
	 * @return
	 */
	@RequestMapping("/collectScenic")
	public ModelAndView collectScenic(Collect collect){
		frontUserService.collectScenic(collect);
		return null;
	}
	
	/**
	 * 取消收藏
	 * @param collect
	 * @return
	 */
	/*@RequestMapping("/collectCancel")
	public ModelAndView collectCancel(@RequestParam("userId")Long userId, @RequestParam("scenicId")Long scenicId){
		frontUserService.collectCancel(userId, scenicId);
		return null;
	}*/
	@RequestMapping("/collectCancel")
	public ModelAndView collectCancel(Long userId, Long scenicId){
		frontUserService.collectCancel(userId, scenicId);
		return null;
	}
	
	/*购买门票*/
	@RequestMapping("/buyTicker")
	public ModelAndView buyTicker(Buyticket buyticket, HttpServletResponse response) throws IOException {
		String state = frontUserService.buyTicker(buyticket);
		response.getWriter().write(state);
		return null;
	}
	
	/**
	 * 获取某用户的评论
	 * @param userId
	 * @return
	 */
	@RequestMapping("/getCommentByUserId")
	public ModelAndView getCommentByUserId(@RequestParam(required=true)Long userId, PageQueryVo vo){
		ModelAndView mv = new ModelAndView("front/user/comment.jsp");
		Map<String, Object> map = frontUserService.getCommentByUserId(userId, vo);

		mv.addObject("userId", userId);      //回显登录用户id
		mv.addObject("pager", (Pager<Scenic>) map.get("scenicPager"));
		mv.addObject("provinceList", (List<Province>)map.get("provinceList"));
		mv.addObject("scenicTypes", map.get("scenicTypes"));
		return mv;
	}
	
	/**
	 * 获取某用户的收藏的景点
	 * @param userId
	 */
	@RequestMapping("/getCollByUserId")
	public ModelAndView getCollByUserId(@RequestParam(required=true)Long userId, Scenic scenic, PageQueryVo vo){
		ModelAndView mv = new ModelAndView("front/user/collectList.jsp");
		Map<String, Object> map = frontUserService.getCollByUserId(userId, scenic, vo);

		mv.addObject("userId", userId);      //回显登录用户id
		mv.addObject("pager", (Pager<Scenic>) map.get("scenicPager"));
		mv.addObject("provinceList", (List<Province>)map.get("provinceList"));
		mv.addObject("scenicTypes", map.get("scenicTypes"));
		return mv;
	}
	
	/**
	 * 获取某用户的购票记录
	 * @param userId
	 * @param vo
	 * @return
	 */
	@RequestMapping("/getMyTicket")
	public ModelAndView getMyTicket(@RequestParam(required=true)Long userId, PageQueryVo vo){
		ModelAndView mv = new ModelAndView("front/user/myTicket.jsp");
		Map<String, Object> map = frontUserService.getMyTicket(userId, vo);

		mv.addObject("userId", userId);      //回显登录用户id
		mv.addObject("pager", (Pager<Scenic>) map.get("scenicPager"));
		return mv;
	}
	
}
