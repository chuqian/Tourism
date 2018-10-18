package com.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.entity.PageQueryVo;

public interface BaseMapper<T> {
	
	/**
	 * 分页查询
	 * @param start
	 * @param size
	 * @return
	 */
	List<T> selectByPage(@Param("start")Integer start, @Param("size")Integer size);
	
	/**
	 * 多条件查询
	 * @param t
	 * @param vo
	 * @return
	 */
	List<T> selectByMulCondition(@Param("t")T t, @Param("vo")PageQueryVo vo);
	
	/**
	 * 实体查询
	 * @param t
	 * @return
	 */
	T selectByEntity(T t);
	
	/**
	 * 记录条数
	 * @param t
	 * @return
	 */
	int recordCount(T t);
	
	/**
	 * 删除(set del=1)
	 * @param id
	 */
	void del(Long id);
	
	/**
	 * 获取所有景点极其相关信息
	 * @param t
	 * @param vo
	 * @return
	 */
	List<T> selectByMulConditionExt(@Param("t")T t, @Param("vo")PageQueryVo vo);
	
}
