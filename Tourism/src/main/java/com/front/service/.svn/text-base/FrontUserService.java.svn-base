package com.front.service;

import java.util.Map;

import com.entity.Buyticket;
import com.entity.Collect;
import com.entity.Comment;
import com.entity.PageQueryVo;
import com.entity.Scenic;
import com.entity.User;

public interface FrontUserService {

	/**
	 * 登录验证
	 * @param user
	 * @return 用户登录成功返回id，失败返回0;游客登录返回-1
	 */
	public Long login(User user, String userIdentity);

	/**
	 * 用户注册
	 * @param user
	 */
	public void register(User user);
	
	/**
	 * 获取景点所有相关信息
	 * @param scenic
	 * @param vo
	 * @return
	 */
	public Map<String, Object> getAllScenic(Scenic scenic, PageQueryVo vo);

	/**
	 * 景点评论
	 * @param comment
	 */
	public void commentPublish(Comment comment);

	/**
	 * 景点收藏
	 * @param userId
	 * @param scenicId
	 */
	public void collectScenic(Collect collect);

	/**
	 * 取消收藏
	 * @param userId
	 * @param scenicId
	 */
	public void collectCancel(Long userId, Long scenicId);
	
	/**
	 * 购买门票
	 * @param buyticket
	 * @return
	 */
	public String buyTicker(Buyticket buyticket);

	/**
	 * 获取用户收藏的景点
	 * @param userId
	 * @param scenic
	 * @param vo
	 * @return
	 */
	public Map<String, Object> getCollByUserId(Long userId, Scenic scenic, PageQueryVo vo);

	/**
	 * 获取用户的评论
	 * @param userId
	 * @param vo
	 * @return
	 */
	public Map<String, Object> getCommentByUserId(Long userId, PageQueryVo vo);

	/**
	 * 获取某用户的购票记录
	 * @param userId
	 * @param vo
	 * @return
	 */
	public Map<String, Object> getMyTicket(Long userId, PageQueryVo vo);

}
