package com.sist.controller;

import com.sist.service.MemberService;
import com.sist.vo.MemberVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/member")
public class MemberController {

    @Autowired
    private MemberService memberService;

    @GetMapping("/login")
    public String loginPage() {
        return "member/login";
    }

    @GetMapping("/signup")
    public String signupPage() {
        return "member/signup";
    }

    @PostMapping("/signup")
    @ResponseBody
    public void signup(@RequestBody MemberVO memberVO) {
        memberService.signup(memberVO);
    }

    @GetMapping("/nickname/duplicate-check")
    @ResponseBody
    public String nicknameDuplicateCheck(@RequestParam("nickname") String nickname) {
        memberService.nicknameDuplicateCheck(nickname);
        return "사용 가능한 닉네임입니다.";
    }

    @GetMapping("/email/duplicate-check")
    @ResponseBody
    public String emailDuplicateCheck(@RequestParam("email") String email) {
        memberService.emailDuplicateCheck(email);
        return "사용 가능한 이메일입니다.";
    }

}
