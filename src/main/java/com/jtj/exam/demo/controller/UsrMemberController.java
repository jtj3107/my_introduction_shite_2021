package com.jtj.exam.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UsrMemberController {
	@RequestMapping("/usr/member/login")
	public String showMain() {
		return "usr/member/login";
	}
	
}
