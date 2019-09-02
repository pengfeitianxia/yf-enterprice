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
@Table(name = "recharge")
public class Recharge {
    @Id
    private String id;

    @Column(name = "userId")
    private String userid;

    /**
     * 充值金额
     */
    private BigDecimal amount;

    @Column(name = "create_time")
    private Date createTime;
}