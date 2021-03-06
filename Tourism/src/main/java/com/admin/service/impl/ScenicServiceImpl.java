package com.admin.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.admin.common.SystemConst;
import com.admin.service.ScenicService;
import com.entity.PageQueryVo;
import com.entity.Pager;
import com.entity.Scenic;
import com.mapper.ProvinceMapper;
import com.mapper.ScenicMapper;

@Service
public class ScenicServiceImpl implements ScenicService {
	
	@Autowired
	private ScenicMapper scenicMapper;
	@Autowired
	private ProvinceMapper provinceMapper;

	@Override
	public Map<String, Object> scenicList(String path, Scenic scenic, PageQueryVo vo) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		if(path.equals("list"))
			map.put("path", "scenic/scenicList.jsp");
		else if(path.equals("selectByCondition"))
			map.put("path", "scenic/scenicList2.jsp");
		
		int total = scenicMapper.recordCount(scenic);    //记录总条数
		int pageCount = total % vo.getSize()>0? 
						total/vo.getSize() + 1 : total/vo.getSize();  //记录总页数 
		vo.setStart((vo.getPage()-1) * vo.getSize());    //设置查询起始位置
		List<Scenic> scenicList = scenicMapper.selectByMulCondition(scenic, vo);
		
		Pager<Scenic> pager = new Pager<Scenic>();
		pager.setCurrentPage(vo.getPage());
		pager.setPageCount(pageCount);
		pager.setRows(scenicList);
		
		map.put("scenicPager", pager);
		map.put("provinceList", provinceMapper.selectAll());
		map.put("scenicTypes", SystemConst.ScenicTyep.values());
		return map;
	}

	@Override
	public Map<String, Object> toInput(Long scenicId) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("scenic", scenicMapper.selectByPrimaryKey(scenicId));
		map.put("provinceList", provinceMapper.selectAll());
		map.put("scenicTypes", SystemConst.ScenicTyep.values());
		return map;
	}

	@Override
	public String addOrUpdate(Scenic scenic) {
		if(scenic.getScenicId() == null){
			scenicMapper.insert(scenic);
			return "1";
		}
		else{
			scenicMapper.updateByPrimaryKey(scenic);
			return "0";
		}
	}

	@Override
	public void scenicDel(Long delId) {
		scenicMapper.del(delId);
	}

}