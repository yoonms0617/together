package com.sist.vo;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class PlaceVO {

    private int pno;

    private String image;

    private String title;

    private String subtitle;

    private String address;

    private String tel;

    private String homepage;

    private String openHour;

    private String reserve;

    private String content;

    private String category;

    private Date createdAt;

    private int hit;

}
