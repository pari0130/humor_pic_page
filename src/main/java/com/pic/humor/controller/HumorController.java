package com.pic.humor.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HumorController {
	
	@RequestMapping("/wtf_list")
	public String wtf_list(){
		
		return "wtf/wtf_list";
	}

}
