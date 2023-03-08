package com.sist.vo;
import java.util.*;

import lombok.Getter;
import lombok.Setter;
/*
 * BNO        NOT NULL NUMBER         
TITLE      NOT NULL VARCHAR2(300)  
CONTENT    NOT NULL VARCHAR2(4000) 
TAG                 VARCHAR2(400)  
HIT                 NUMBER         
CREATED_AT          DATE           

 */
@Getter
@Setter
public class BestTipVO {
	private String title;
	
	private String content;
	
	private String tag;
	
	private int hit;
	
	private Date created_at;
}
