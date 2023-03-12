package com.sist.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	
	@GetMapping("community/detail.do")
	public String community_detail(int cno,Model model)
	{
		model.addAttribute("cno",cno);
		return "community/detail";
	}
	
	@GetMapping("community/update.do")
	public String community_update(int cno,Model model)
	{
		model.addAttribute("cno",cno);
		return "community/update";
	}
	
	@GetMapping("community/delete.do")
	public String community_delete(int cno,Model model)
	{
		model.addAttribute("cno",cno);
		return "community/delete";
	}
}
