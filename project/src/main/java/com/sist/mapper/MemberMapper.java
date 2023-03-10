package com.sist.mapper;

import com.sist.vo.MemberVO;

import org.apache.ibatis.annotations.Mapper;

import java.util.Optional;

@Mapper
public interface MemberMapper {

    void save(MemberVO memberVO);

    Optional<MemberVO> findById(int mno);

    Optional<MemberVO> findByEmail(String email);

    boolean existsByNickname(String nickname);

    boolean existsByEmail(String email);

}
