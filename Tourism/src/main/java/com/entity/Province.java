package com.entity;

public class Province {
    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column province.province_id
     *
     * @mbggenerated
     */
    private Long provinceId;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column province.province_name
     *
     * @mbggenerated
     */
    private String provinceName;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column province.province_id
     *
     * @return the value of province.province_id
     *
     * @mbggenerated
     */
    public Long getProvinceId() {
        return provinceId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column province.province_id
     *
     * @param provinceId the value for province.province_id
     *
     * @mbggenerated
     */
    public void setProvinceId(Long provinceId) {
        this.provinceId = provinceId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column province.province_name
     *
     * @return the value of province.province_name
     *
     * @mbggenerated
     */
    public String getProvinceName() {
        return provinceName;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column province.province_name
     *
     * @param provinceName the value for province.province_name
     *
     * @mbggenerated
     */
    public void setProvinceName(String provinceName) {
        this.provinceName = provinceName == null ? null : provinceName.trim();
    }
}