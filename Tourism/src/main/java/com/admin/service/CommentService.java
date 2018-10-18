package com.admin.service;

import java.util.Date;
import java.util.Map;

import com.entity.PageQueryVo;

public interface CommentService {

	/**
	 * 用户评论
	 * @param username
	 * @param date
	 * @param vo 
	 * @return
	 */
	Map<String, Object> userCommentList(String username, Date date, PageQueryVo vo);

}
