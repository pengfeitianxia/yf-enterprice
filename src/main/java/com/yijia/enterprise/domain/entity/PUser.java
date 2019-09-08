package com.yijia.enterprise.domain.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import javax.persistence.*;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@Table(name = "p_user")
public class PUser implements Serializable {
    @Id
    @Column(name = "userId")
    private String userid;

    private String name;

    private String phone;

    private Integer age;

    /**
     * 0 女  1男
     */
    private String sex;

    private String birthday;

    /**
     * 剩余金额
     */
    @Column(name = "remain_amount")
    private BigDecimal remainAmount;

    private String memo;

    @Column(name = "modify_time")
    private Date modifyTime;

    @Column(name = "create_time")
    private Date createTime;

    private static final long serialVersionUID = 1L;
}