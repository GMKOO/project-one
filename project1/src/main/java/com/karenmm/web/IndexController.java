package com.karenmm.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class IndexController {
	
	@GetMapping("/board2")
	public String board2() {
		return "board2";
	}
	
	@GetMapping("/help")
	public String help() {
		return "help";
	}
	@GetMapping("/notice")
	public String notice() {
		return "notice";
	}
	
	
	//value = {} 매개변수 여러가지 처리 가능
	@GetMapping(value= { "/", "/index" ,"/home"})
	public String index() {
		
		return "index";  // 데이터 붙임 없이 index.jsp페이지만 보여줍니다.
		
		
		
	}
	
	


}
