package com.entity;

public class Region {
    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column region.regionId
     *
     * @mbggenerated
     */
    private Long regionid;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column region.regionName
     *
     * @mbggenerated
     */
    private String regionname;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column region.regionId
     *
     * @return the value of region.regionId
     *
     * @mbggenerated
     */
    public Long getRegionid() {
        return regionid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column region.regionId
     *
     * @param regionid the value for region.regionId
     *
     * @mbggenerated
     */
    public void setRegionid(Long regionid) {
        this.regionid = regionid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column region.regionName
     *
     * @return the value of region.regionName
     *
     * @mbggenerated
     */
    public String getRegionname() {
        return regionname;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column region.regionName
     *
     * @param regionname the value for region.regionName
     *
     * @mbggenerated
     */
    public void setRegionname(String regionname) {
        this.regionname = regionname == null ? null : regionname.trim();
    }
}