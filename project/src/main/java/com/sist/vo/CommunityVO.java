package com.sist.vo;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class CommunityVO {

    private int cno;

    private String title;

    private String content;

    private String type;

    private Date createdAt;

    private int mno;

}
