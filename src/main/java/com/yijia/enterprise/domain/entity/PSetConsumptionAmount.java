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
@Table(name = "p_set_consumption_amount")
public class PSetConsumptionAmount {
    @Id
    private String id;

    @Column(name = "set_amount")
    private BigDecimal setAmount;

    @Column(name = "create_time")
    private Date createTime;
}