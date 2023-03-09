package com.sist.vo;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class MemberVO {

    private int mno;

    private String name;

    private String nickname;

    private String email;

    private String password;

    private String role = "ROLE_MEMBER";

    private Date createdAt;

}
