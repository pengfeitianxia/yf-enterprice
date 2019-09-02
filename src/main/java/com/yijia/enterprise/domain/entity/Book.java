package com.yijia.enterprise.domain.entity;

import java.math.BigDecimal;
import java.util.Date;
import javax.persistence.*;

import lombok.*;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "book")
public class Book {
    @Id
    private String id;

    @Column(name = "book_name")
    private String bookName;

    @Column(name = "purchase_price")
    private BigDecimal purchasePrice;

    private BigDecimal price;

    /**
     * 0 未卖出  1 已卖出
     */
    private String state;

    @Column(name = "create_time")
    private Date createTime;
}