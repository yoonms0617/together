package com.sist.mapper;
import java.util.*;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;

import com.sist.vo.*;

/*
    private int cno;
    
    private int hit;

    private String title;

    private String content;
    
    private int filesize;
    
    private String filename;

    private String type;
    
    private String dbday;

    private Date createdAt;

    
    private int mno;
 */
public interface CommunityMapper {
	@Select("SELECT cno,hit,name,title,content,filesize,type,TO_CHAR(createdAt,'YYYY-MM-DD') as dbday,num "
			+"FROM (SELECT cno,hit,name,title,content,filesize,type,createdAt,rownum as num "
			+"FROM (SELECT /* +INDEX_DESC(pet_community_2_1 pc1_cno_pk)*/cno,hit,name,title,content,filesize,type,createdAt "
			+"FROM pet_community_2_1)) "
			+"WHERE num BETWEEN #{start} AND #{end}")
	public List<CommunityVO> communityListData(Map map);
	
	/*
	 * @Select("SELECT CEIL(COUNT(*)/10.0) FROM pet_community_2_1") public int
	 * communityTotalPage();
	 */
	
	
	  @SelectKey(keyProperty = "cno",resultType = int.class,before = true, 
	  statement = "SELECT NVL(MAX(no)+1,1) as no FROM pet_community_2_1")
	 
	@Insert("INSERT INTO pet_community_2_1 VALUES(" 
			+ "#{cno},#{title},#{content},#{type},#{filesize},#{filename},SYSDATE,0)")
	public void communityInsert(CommunityVO vo);
	  
	@Update("UPDATE pet_community_2_1 SET "
			+"hit=hit+1 "
			+"WHERE no=#{no}")
	public void communityHitIncrement(int cno);
	
	@Select("SELECT cno,name,title,content,filesize,TO_CHAR(createdAt,'YYYY-MM-DD') as dbday,hit "
			+"FROM pet_community_2_1 "
			+"WHERE cno=#{cno}")
	public CommunityVO communityDetailData(int cno);
	
	@Select("SELECT pwd FROM pet_community_2_1 "
			+"WHERE cno=#{cno}")
	public String communityGetPassword(int no);
	
	@Update("UPDATE pet_community_2_1 SET "
			+"name=#{name},title=#{title},content=#{content} "
			+"WHERE cno=#{cno}")
	public void communityUpdate(CommunityVO vo);
	
	@Delete("DELETE FROM pet_community_2_1 "
			+"WHERE cno=#{cno}")
	public void communityDelete(int cno);
	
	
}
