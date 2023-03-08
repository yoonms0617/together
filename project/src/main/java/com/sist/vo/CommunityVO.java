package com.sist.vo;
import java.util.*;

import lombok.Getter;
import lombok.Setter;
@Getter
@Setter
public class CommunityVO {
		private int cno,mno;
		private String title,content,type;
		private Date created_at;
}
