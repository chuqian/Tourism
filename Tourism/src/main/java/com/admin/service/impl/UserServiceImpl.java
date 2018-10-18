package com.admin.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.admin.service.UserService;
import com.entity.Pager;
import com.entity.PageQueryVo;
import com.entity.User;
import com.mapper.UserMapper;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserMapper userMapper;

	@Override
	public Pager<User> userList() {
		int total = userMapper.recordCount(new User());
		int pageCount = total % Pager.getSize()>0? total/Pager.getSize() + 1 : total/Pager.getSize(); 
		List<User> userList = userMapper.selectByPage(0, Pager.getSize());
		
		Pager<User> pager = new Pager<User>();
		pager.setCurrentPage(1);
		pager.setPageCount(pageCount);
		pager.setRows(userList);
		return pager;
	}

	@Override
	public User toInput(Long userid) {
		return userMapper.selectByPrimaryKey(userid);
	}
	
	@Override
	public Pager<User> selectByCondition(User user, PageQueryVo vo) {
		int total = userMapper.recordCount(user);
		int pageCount = total % vo.getSize()>0? total/vo.getSize() + 1 : total/vo.getSize(); 
		vo.setStart((vo.getPage()-1) * vo.getSize());
		List<User> userList = userMapper.selectByMulCondition(user, vo);
		
		Pager<User> pager = new Pager<User>();
		pager.setCurrentPage(vo.getPage());
		pager.setPageCount(pageCount);
		pager.setRows(userList);
		return pager;
	}

	@Override
	public String userAddOrUpdate(User user) {
		if(user.getUserId() == null){
			userMapper.insert(user);
			return "1";
		}
		else{
			userMapper.updateByPrimaryKey(user);
			return "0";
		}
	}

	@Override
	public void userUpdate(User user) {
		userMapper.updateByPrimaryKey(user);
	}

	@Override
	public void userDel(Long userid) {
		userMapper.del(userid);
	}

	

	
}
