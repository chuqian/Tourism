package com.admin.service;

import java.util.Map;

import com.entity.PageQueryVo;
import com.entity.Scenic;

public interface ScenicService {

	/**
	 * 景点列表
	 * @return
	 */
	public Map<String, Object> scenicList(String path, Scenic scenic, PageQueryVo vo);
	
	/**
	 * 跳转至输入页面
	 * @param scenicId
	 * @return
	 */
	public Map<String, Object> toInput(Long scenicId);

	public String addOrUpdate(Scenic scenic);

	public void scenicDel(Long delId);
}
