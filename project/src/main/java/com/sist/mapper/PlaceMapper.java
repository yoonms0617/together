package com.sist.mapper;

import com.sist.vo.*;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;
import java.util.Map;
@Mapper
public interface PlaceMapper {
    /*@Select("SELECT pno, title, image "
            +"FROM pet_place_2_1 "
            +"WHERE pno=#{pno}")
    public List<PlaceVO> PlaceListData(int pno);*/
    
	@Select("SELECT pno, title, image FROM pet_place_2_1 WHERE pno BETWEEN 1 AND 21")
    public List<PlaceVO> PlaceListData();
	
	@Select("select pno, image, title, address, tel, homepage, openhour, reserve, content, category "
			+ "FROM pet_place_2_1 "
			+ "where pno = #{pno}")
	public List<PlaceVO> placeDetailData(int pno);

    /*@Select("SELECT fno,title,image,num "
            +"FROM (SELECT fno,title,image,rownum as num "
            +"FROM (SELECT fno,title,image "
            +"FROM pet_place_2_1 WHERE address LIKE '%'||#{address}||'%' ORDER BY fno ASC)) "
            +"WHERE num BETWEEN #{start} AND #{end}")
    public List<PlaceVO> placeSearchData(Map map);*/
    
    
}
