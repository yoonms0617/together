package com.sist.vo;
import java.util.*;

import lombok.Getter;
import lombok.Setter;
@Getter
@Setter
public class NoticeVO {
	private int nno;
	private String title,content;
	private Date created_at;
}
