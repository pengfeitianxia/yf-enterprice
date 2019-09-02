package com.yijia.enterprise.domain.entity;

import java.util.Date;
import javax.persistence.*;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@Table(name = "bk_userandbook")
public class BkUserandbook {
    @Id
    private String id;

    @Column(name = "bk_user_id")
    private String bkUserId;

    @Column(name = "book_id")
    private String bookId;

    /**
     * 0 借出 1 归还
     */
    @Column(name = "book_state")
    private String bookState;

    @Column(name = "borrow_time")
    private Date borrowTime;

    @Column(name = "return_time")
    private Date returnTime;

    @Column(name = "create_time")
    private Date createTime;
}