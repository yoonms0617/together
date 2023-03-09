package com.sist.vo;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class CommunityReplyVO {

    private int crno;

    private String content;

    private Date createdAt;

    private int cno;

    private int mno;

}
