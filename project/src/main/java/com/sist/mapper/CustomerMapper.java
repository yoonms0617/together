package com.sist.mapper;

import java.util.*;
import com.sist.vo.*;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
/*
    private int nno;

    private String subject;

    private String content;

    private String pwd;

    private String type;
    
    private String dbday;

    private Date createdAt;

    private int mno;
 */
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;

@Mapper
public interface CustomerMapper {
	// 고객센터 1:1 문의 목록 출력
<<<<<<< HEAD
	@Select("SELECT nno,subject,name,regdate,hit,num "
			+"FROM (SELECT nno,subject,name,regdate,hit,rownum as num "
			+"FROM (SELECT nno,subject,name,regdate,hit "
			+"FROM PET_HELP_2_1 ORDER BY nno DESC)) "
			+"WHERE num BETWEEN #{start} AND #{end}")
	public List<CustomerVO> csBoardListData(Map map);
	
	// 페이지네이션 (10개씩 페이지 나누기)
	@Select("SELECT CEIL(COUNT(*)/10.0) FROM PET_HELP_2_1")
	public int csBoardTotalPage();
	
	// 게시판 데이터 삽입
	@SelectKey(keyProperty="nno", resultType=int.class, before=true,
			statement="SELECT NVL(MAX(nno)+1,1) as nno FROM PET_HELP_2_1")
	@Insert("INSERT INTO spring_board VALUES("
			+"{nno}, #{name}, #{subject}, #{content}, #{pwd}, SYSDATE,0)")
	public void csBoardInserst(CustomerVO vo);
	
	// 조회수 증가
	@Update("UPDATE PET_HELP_2_1 SET "
			+"hit=hit+1 "
			+"WHERE nno=#{nno}")
	public void csBoardHitIncrement(int nno);
	
	//게시판 데이터 상세보기
	@Select("SELECT no,name,subject,content,regdate,hit "
=======
	@Select("SELECT nno,subject,name,createdAt,hit,num "
			+"FROM (SELECT nno,subject,name,createdAt,hit,rownum as num "
			+"FROM (SELECT nno,subject,name,createdAt,hit "
			+"FROM PET_HELP_2_1 ORDER BY nno DESC)) "
			+"WHERE num BETWEEN #{start} AND #{end}")
	public List<CustomerVO> csBoardListData(Map map);
	
	// 페이지네이션 (10개씩 페이지 나누기)
	@Select("SELECT CEIL(COUNT(*)/10.0) FROM PET_HELP_2_1")
	public int csBoardTotalPage();
	
	// 게시판 데이터 삽입
	@SelectKey(keyProperty="nno", resultType=int.class, before=true,
			statement="SELECT NVL(MAX(nno)+1,1) as nno FROM PET_HELP_2_")
	@Insert("INSERT INTO spring_board VALUES("
			+"{nno}, #{name}, #{subject}, #{content}, #{pwd}, SYSDATE,0)")
	public void csBoardInserst(CustomerVO vo);
	
	// 조회수 증가
	@Update("UPDATE PET_HELP_2_1 SET "
			+"hit=hit+1 "
			+"WHERE nno=#{nno}")
	public void csBoardHitIncrement(int nno);
	
	//게시판 데이터 상세보기
	@Select("SELECT no,name,subject,content,createdAt,hit "
>>>>>>> branch 'develop' of https://github.com/mechuuri/together.git
			+"FROM PET_HELP_2_1 "
			+"WHERE nno=#{nno}")
	public CustomerVO csBoardDetailData(int nno);

	// 게시글 수정/삭제 시 비밀번호 확인
	@Select("SELECT pwd FROM PET_HELP_2_1 "
			+"WHERE nno=#{nno}")
	public String csBoardGetPassword(int nno);
	
	// 게시글 수정하기
	@Update("UPDATE PET_HELP_2_1 SET "
			+"name=#{name},subject=#{subject},content=#{content} "
			+"WHERE nno=#{nno}")
	public void csBoardUpdate(CustomerVO vo);
	
	// 게시글 삭제하기
	@Delete("DELETE FROM PET_HELP_2_1 "
			+"WHERE nno=#{nno}")
	public void csBoardDelete(int nno);
	
	
}
