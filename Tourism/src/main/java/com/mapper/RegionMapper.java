package com.mapper;

import com.entity.Region;
import java.util.List;

public interface RegionMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table region
     *
     * @mbggenerated
     */
    int deleteByPrimaryKey(Long regionid);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table region
     *
     * @mbggenerated
     */
    int insert(Region record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table region
     *
     * @mbggenerated
     */
    Region selectByPrimaryKey(Long regionid);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table region
     *
     * @mbggenerated
     */
    List<Region> selectAll();

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table region
     *
     * @mbggenerated
     */
    int updateByPrimaryKey(Region record);
}