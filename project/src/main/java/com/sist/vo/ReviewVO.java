package com.sist.vo;
import java.util.*;

import lombok.Getter;
import lombok.Setter;
/*
 * PRNO          NUMBER         
PNO           NUMBER         
MNO           NUMBER         
CONTENT       VARCHAR2(4000) 
CREATED_AT    DATE    
 */
@Getter
@Setter
public class ReviewVO {
	private int pno;
	
	private int mno;
	
	private String content;
	
	private Date created_at;
}
