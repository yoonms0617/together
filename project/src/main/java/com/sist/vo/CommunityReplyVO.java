package com.sist.vo;
import java.util.*;

import lombok.Getter;
import lombok.Setter;
@Getter
@Setter
public class CommunityReplyVO {
	private int crno,cno,mno;
	private String content;
	private Date created_at;
}
