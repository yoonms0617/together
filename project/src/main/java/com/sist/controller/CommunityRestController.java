package com.sist.controller;
import java.util.*;

import org.apache.ibatis.annotations.Select;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.sist.vo.*;
import com.fasterxml.jackson.databind.jsonFormatVisitors.JsonArrayFormatVisitor;
import com.sist.service.*;

@RestController
public class CommunityRestController {
	@Autowired
	private CommunityService service;
	
	/*
	 * @Select("SELECT cno,hit,title,content,filesize,type,TO_CHAR(createdAt,'YYYY-MM-DD') as dbday,num "
			+"FROM (SELECT cno,hit,title,content,filesize,type,createdAt,rownum as num "
			+"FROM (SELECT /* +INDEX_DESC(pet_community_2_1 pc1_cno_pk)cno,hit,title,content,filesize,type,createdAt "
			+"FROM pet_community_2_1)) "
			+"WHERE num BETWEEN #{start} AND #{end}")
	 */
	@GetMapping(value="community/list_vue.do",produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public CommunityVO list() {
		CommunityVO communityVO=new CommunityVO();
		communityVO.setCno(communityVO.getCno());
		communityVO.setHit(communityVO.getHit());
		communityVO.setName(communityVO.getName());
		communityVO.setTitle(communityVO.getTitle());
		communityVO.setContent(communityVO.getContent());
		communityVO.setFilesize(communityVO.getFilesize());
		communityVO.setType(communityVO.getType());
		communityVO.setDbday(communityVO.getDbday());
		
		return communityVO;
	}
	/*
	 * public String community_list(int page) { Map map=new HashMap();
	 * map.put("start", (page*10)-9); map.put("end", page*10); List<CommunityVO>
	 * list=service.communityListData(map); int
	 * totalpage=service.communityTotalPage(); return ""; }
	 */
	
	
	  @GetMapping("community/insert_vue.do") 
	  public String community_insert(CommunityVO vo) 
	  {
		  service.communityInsert(vo);
		  return ""; 
	  }
	  
	  @GetMapping(value="community/detail_vue.do",produces = "text/plain;charset=UTF-8")
	  public String community_detail(int cno)
	  {
		  return"";
	  }
	  
	  @GetMapping(value="community/update_vue.do",produces = "text/plain;charset=UTF-8")
	  public String community_update(int cno)
	  {
		  return "";
	  }
	  
	  @GetMapping("community/update_ok_vue.do")
	  public String community_update_ok(CommunityVO vo)
	  {
		  String res=service.communityUpdate(vo);
		  return res;
	  }
	  
	  @GetMapping("community/community_delete_vue.do")
	  public String community_delete_ok(int cno,String pwd)
	  {
		  String res=service.communityDelete(cno, pwd);
		  return res;
	  }
	 

}
