package com.sist.vo;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class CustomerVO {

    private int nno;

    private String subject;

    private String content;

    private String pwd;

    private String type;

    private Date createdAt;

    private int mno;

}
