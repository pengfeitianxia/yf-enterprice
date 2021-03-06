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
@Table(name = "bk_book_info")
public class BkBookInfo implements Serializable {
    @Id
    @Column(name = "book_id")
    private String bookId;

    @Column(name = "book_name")
    private String bookName;

    @Column(name = "purchase_price")
    private BigDecimal purchasePrice;

    private BigDecimal price;

    /**
     * 0 未卖出  1 已卖出  2 借出
     */
    private String state;

    @Column(name = "modify_time")
    private Date modifyTime;

    @Column(name = "create_time")
    private Date createTime;

    private static final long serialVersionUID = 1L;
}