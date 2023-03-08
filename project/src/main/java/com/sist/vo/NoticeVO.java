package com.sist.vo;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class NoticeVO {

    private int nno;

    private String title;

    private String content;

    private Date createdAt;

}
