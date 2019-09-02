package com.yijia.enterprise.domain.entity;

import java.math.BigDecimal;
import java.util.Date;
import javax.persistence.*;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@Table(name = "bk_user")
public class BkUser {
    @Id
    @Column(name = "bk_user_id")
    private String bkUserId;

    private String name;

    private String phone;

    private BigDecimal deposit;

    @Column(name = "update_time")
    private Date updateTime;

    @Column(name = "create_time")
    private Date createTime;
}