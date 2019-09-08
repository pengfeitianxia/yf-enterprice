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
@Table(name = "p_recharge")
public class PRecharge implements Serializable {
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

    private static final long serialVersionUID = 1L;
}