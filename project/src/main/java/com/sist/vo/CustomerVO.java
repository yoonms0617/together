package com.sist.vo;
import java.util.*;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter

public class CustomerVO {
	private int nno, mno;
	private String subject,content,pwd,type;
	private Date regdate;
}
