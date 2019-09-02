package com.yijia.enterprise.domain.entity;

import java.math.BigDecimal;
import java.util.Date;
import javax.persistence.*;

import lombok.*;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "user")
public class User {
    @Id
    @Column(name = "userId")
    private String userid;

    private String name;

    private Integer age;

    /**
     * 0 女  1男
     */
    private String sex;

    private Date birthday;

    /**
     * 剩余金额
     */
    @Column(name = "remain_amount")
    private BigDecimal remainAmount;

    @Column(name = "create_time")
    private Date createTime;
}