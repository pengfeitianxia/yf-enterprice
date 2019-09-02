package com.yijia.enterprise.domain.entity;

import java.math.BigDecimal;
import java.util.Date;
import javax.persistence.*;

import lombok.*;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "set_consumption_amount_history")
public class SetConsumptionAmountHistory {
    @Id
    private String id;

    @Column(name = "set_amount")
    private BigDecimal setAmount;

    @Column(name = "create_time")
    private Date createTime;
}