package com.sist.vo;

import java.util.Date;

/*
PNO        NOT NULL NUMBER
IMAGE               VARCHAR2(3000)
TITLE               VARCHAR2(300)
ADDRESS             VARCHAR2(300)
TEL                 VARCHAR2(300)
HOMEPAGE            VARCHAR2(300)
OPENHOUR            VARCHAR2(300)
RESERVE             VARCHAR2(150)
CONTENT             VARCHAR2(3000)
CATEGORY   NOT NULL VARCHAR2(30)
CREATED_AT          DATE
HIT                 NUMBER
 */
public class PlaceVO {
    private int pno;
    private String image;
    private String title;
    private String address;
    private String tel;
    private String homepage;
    private String openhour;
    private String reserve;
    private String content;
    private String category;
    private Date createAt;
    private int hit;

}
