package com.sist.vo;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class CustomerVO {

    private int nno;

    private int hit;
    
    private String subject;

    private String content;
    
    private String name;

    private String pwd;

    private String type;
    
    private String dbday;

    private Date createdAt;

    private int mno;

}
