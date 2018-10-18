package com.admin.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.admin.service.CommentService;
import com.entity.PageQueryVo;
import com.entity.Pager;
import com.entity.UserCommSce;
import com.mapper.CommentMapper;

@Service
public class CommentServiceImpl implements CommentService {

	@Autowired
	CommentMapper commentMapper;

	@Override
	public Map<String, Object> userCommentList(String username, Date date, PageQueryVo vo) {
		int total = commentMapper.recordCount(username, date);
		int pageCount = total % vo.getSize()>0? total/vo.getSize() + 1 : total/vo.getSize(); 
		vo.setStart((vo.getPage()-1) * vo.getSize());
		List<UserCommSce> userList = commentMapper.selectUserComment(username, date, vo);
		
		Pager<UserCommSce> pager = new Pager<UserCommSce>();
		pager.setCurrentPage(vo.getPage());
		pager.setPageCount(pageCount);
		pager.setRows(userList);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pager", pager);
		return map;
	}
	
}
