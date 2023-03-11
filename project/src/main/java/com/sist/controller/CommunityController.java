package com.sist.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CommunityController {
	@GetMapping("community/list.do")
	public String community_list()
	{
		return "community/list";
	}
	
	@GetMapping("community/insert.do")
	public String community_insert()
	{
		return "community/insert";
	}
}
