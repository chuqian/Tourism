package com.mapper;

import com.entity.Comment;
import com.entity.PageQueryVo;
import com.entity.UserCommSce;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface CommentMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table comment
     *
     * @mbggenerated
     */
    int deleteByPrimaryKey(Long commentId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table comment
     *
     * @mbggenerated
     */
    int insert(Comment record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table comment
     *
     * @mbggenerated
     */
    Comment selectByPrimaryKey(Long commentId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table comment
     *
     * @mbggenerated
     */
    List<Comment> selectAll();

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table comment
     *
     * @mbggenerated
     */
    int updateByPrimaryKey(Comment record);
    
    /**
     * 记录条数
     * @param username
     * @param date
     * @return
     */
    int recordCount(@Param("username")String username, @Param("date")Date date);

    /**
     * 用户评论
     * @param username
     * @param date
     * @param vo
     * @return
     */
	List<UserCommSce> selectUserComment(@Param("username")String username, @Param("date")Date date, @Param("vo")PageQueryVo vo);
    
    /**
     * 查询某用户对某景点的评论
     * @param userId
     * @param scenicId
     * @return
     */
    List<Comment> selectByUserId(@Param("userId")Long userId, @Param("scenicId")Long scenicId);

}