package com.sist.controller;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sist.vo.*;
import com.sist.service.*;

@RestController
public class CommunityRestController {
	@Autowired
	private CommunityService service;
	
	@GetMapping(value="community/list_vue.do",produces = "text/plain;charset=UTF-8")
	public String community_list(int page)
	{
		Map map=new HashMap();
		return "";
	}
}
