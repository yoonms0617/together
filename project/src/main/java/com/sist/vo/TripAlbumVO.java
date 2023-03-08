package com.sist.vo;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class TripAlbumVO {

    private int tano;

    private String title;

    private String writer;

    private String content;

    private int hit;

    private Date createdAt;

    private int mno;

}
