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
@Table(name = "consumption_record")
public class ConsumptionRecord {
    @Id
    private String id;

    @Column(name = "userId")
    private String userid;

    /**
     * 消费金额
     */
    @Column(name = "consumption_amount")
    private BigDecimal consumptionAmount;

    @Column(name = "create_time")
    private Date createTime;
}