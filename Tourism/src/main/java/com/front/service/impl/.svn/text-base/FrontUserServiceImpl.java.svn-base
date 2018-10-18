package com.front.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.admin.common.SystemConst;
import com.entity.Buyticket;
import com.entity.Collect;
import com.entity.Comment;
import com.entity.PageQueryVo;
import com.entity.Pager;
import com.entity.Scenic;
import com.entity.User;
import com.front.service.FrontUserService;
import com.mapper.BuyticketMapper;
import com.mapper.CollectMapper;
import com.mapper.CommentMapper;
import com.mapper.ProvinceMapper;
import com.mapper.ScenicMapper;
import com.mapper.UserMapper;

@Service
public class FrontUserServiceImpl implements FrontUserService {

	@Autowired
	UserMapper userMapper;
	@Autowired
	ScenicMapper scenicMapper;
	@Autowired
	CommentMapper commentMapper;
	@Autowired
	CollectMapper collectMapper;
	@Autowired
	ProvinceMapper provinceMapper;
	@Autowired
	BuyticketMapper buyticketMapper;
	
	@Override
	public Long login(User user, String userIdentity) {
		if(userIdentity!=null && userIdentity.equals("游客"))
			return -1L;
		else{
			User userResult = userMapper.selectByEntity(user);
			if(userResult != null)
				return userResult.getUserId();
			else 
				return 0L;
		}
	}

	@Override
	@Transactional
	public void register(User user) {
		userMapper.insert(user);
	}
	
	@Override
	public Map<String, Object> getAllScenic(Scenic scenic, PageQueryVo vo) {
		
		Map<String, Object> map = new HashMap<String, Object>();	
		int total = scenicMapper.recordCount(scenic);    //记录总条数
		vo.setSize(5);
		int pageCount = total % vo.getSize()>0? 
						total/vo.getSize() + 1 : total/vo.getSize();  //记录总页数 
		vo.setStart((vo.getPage()-1) * vo.getSize());    //设置查询起始位置
		List<Scenic> scenicList = scenicMapper.selectByMulConditionExt(scenic, vo);

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
	@Transactional
	public void commentPublish(Comment comment) {
		commentMapper.insert(comment);
	}

	@Override
	public void collectScenic(Collect collect) {
		if(collectMapper.selectByPrimaryKey(collect.getUserId(), collect.getScenicId()) == null)
			collectMapper.insert(collect);
	}

	@Override
	public void collectCancel(Long userId, Long scenicId) {
		if(collectMapper.selectByPrimaryKey(userId, scenicId) != null);
			collectMapper.del(userId, scenicId);
	}

	@Override
	public String buyTicker(Buyticket buyticket) {
		int ticketRemainder = scenicMapper.selectByPrimaryKey(buyticket.getScenicId()).getTicketRemainder();
		if(buyticket.getCount() < ticketRemainder){
			buyticketMapper.insert(buyticket);
			scenicMapper.updateTicket(buyticket.getScenicId(), buyticket.getCount());
			return "购买成功";
		}
		return "购买失败";
	}

	@Override
	public Map<String, Object> getCommentByUserId(Long userId, PageQueryVo vo) {
		Map<String, Object> map = new HashMap<String, Object>();	
		int total = scenicMapper.recordSceCountByUserId(userId);    //记录总条数
		vo.setSize(5);
		int pageCount = total % vo.getSize()>0? 
						total/vo.getSize() + 1 : total/vo.getSize();  //记录总页数 
		vo.setStart((vo.getPage()-1) * vo.getSize());    //设置查询起始位置
		List<Scenic> scenicList = scenicMapper.selectSceByUserId(userId, vo);
		for(Scenic scenic : scenicList)
			scenic.setCommentListByUser(commentMapper.selectByUserId(userId, scenic.getScenicId()));
		
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
	public Map<String, Object> getCollByUserId(Long userId, Scenic scenic, PageQueryVo vo) {
		Map<String, Object> map = new HashMap<String, Object>();	
		int total = scenicMapper.recordCollCountByUserId(userId, scenic);    //记录总条数
		vo.setSize(5);
		int pageCount = total % vo.getSize()>0? 
						total/vo.getSize() + 1 : total/vo.getSize();  //记录总页数 
		vo.setStart((vo.getPage()-1) * vo.getSize());    //设置查询起始位置
		List<Scenic> scenicList = scenicMapper.selectCollByByUserId(userId, scenic, vo);

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
	public Map<String, Object> getMyTicket(Long userId, PageQueryVo vo) {
		Map<String, Object> map = new HashMap<String, Object>();	
		int total = scenicMapper.ticketSceRecordCount(userId);    //记录总条数
		vo.setSize(5);
		int pageCount = total % vo.getSize()>0? 
						total/vo.getSize() + 1 : total/vo.getSize();  //记录总页数 
		vo.setStart((vo.getPage()-1) * vo.getSize());    //设置查询起始位置
		List<Scenic> scenicList = scenicMapper.ticketSceRecord(userId, vo);
		for(Scenic scenic : scenicList)
			scenic.setTicketListByUser(buyticketMapper.selectByUserSce(userId, scenic.getScenicId()));

		Pager<Scenic> pager = new Pager<Scenic>();
		pager.setCurrentPage(vo.getPage());
		pager.setPageCount(pageCount);
		pager.setRows(scenicList);
		
		map.put("scenicPager", pager);
		return map;
	}

}
