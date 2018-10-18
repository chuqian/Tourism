package com.admin.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.admin.service.ScenicService;
import com.entity.PageQueryVo;
import com.entity.Pager;
import com.entity.Province;
import com.entity.Scenic;

@SuppressWarnings("unchecked")
@Controller
@RequestMapping("/scenic")
public class ScenicController {
	
	@Autowired
	private ScenicService scenicService;
	
	@RequestMapping("/{path}")
	public ModelAndView scenicList(@PathVariable String path ,Scenic scenic, PageQueryVo vo){
		Map<String, Object> map = scenicService.scenicList(path, scenic, vo);
		ModelAndView mv = new ModelAndView((String)map.get("path"));
		
		mv.addObject("pager", (Pager<Scenic>) map.get("scenicPager"));
		mv.addObject("provinceList", (List<Province>)map.get("provinceList"));
		mv.addObject("scenicTypes", map.get("scenicTypes"));
		return mv;
	}
	
	@RequestMapping("/toInput")
	public ModelAndView toInput(Long scenicId){
		ModelAndView mv = new ModelAndView("scenic/scenicInput.jsp");
		Map<String, Object> map = scenicService.toInput(scenicId);
		
		mv.addObject("scenic", (Scenic)map.get("scenic"));
		mv.addObject("provinceList", (List<Province>)map.get("provinceList"));
		mv.addObject("scenicTypes", map.get("scenicTypes"));
		return mv;
	}
	
	@RequestMapping("/addOrUpdate")
	public ModelAndView scenicAdd(HttpServletResponse response, Scenic scenic) throws IOException{
		String type = scenicService.addOrUpdate(scenic);
		response.getWriter().write(type);
		return null;
	}
	
	@RequestMapping("/del")
	public ModelAndView scenicDel(@RequestParam(required=true) Long delId){
		scenicService.scenicDel(delId);
		return null;
	}
	
	public static void main(String[] args) {
		System.out.println(Math.random());
	}
}
