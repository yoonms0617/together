package com.sist.vo;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class TripNoteReviewVO {

    private int tnrno;

    private String writer;

    private String content;

    private Date createdAt;

    private int mno;

    private int tnno;

}
