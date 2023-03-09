package com.sist.vo;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class TripNoteVO {

    private int tnno;

    private String writer;

    private String title;

    private String content;

    private Date createdAt;

    private int mno;

}
