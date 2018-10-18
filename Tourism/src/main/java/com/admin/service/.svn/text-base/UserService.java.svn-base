package com.admin.service;

import com.entity.PageQueryVo;
import com.entity.Pager;
import com.entity.User;

public interface UserService {

	/**
	 * 用户列表
	 * @return
	 */
	public Pager<User> userList();
	
	/**
	 * 跳转至输入页面
	 * @param userId
	 * @return
	 */
	public User toInput(Long userId);
	
	/**
	 * 多条件查询
	 * @param user
	 * @param vo
	 * @return
	 */
	public Pager<User> selectByCondition(User user, PageQueryVo vo);

	/**
	 * 用户添加、更新
	 * @param user
	 * @return 状态信息("1"代表Add、"0"代表Update)
	 */
	public String userAddOrUpdate(User user);

	/**
	 * 用户更新
	 * @param user
	 */
	public void userUpdate(User user);

	/**
	 * 用户删除(set user.del=1)
	 * @param userid
	 */
	public void userDel(Long userid);
}
