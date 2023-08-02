package com.karenmm.rest;

import java.util.List;
import java.util.Map;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.karenmm.login.LoginService;

//@ResponseBody + controller  = restController   ajax용으로 사용된다

@RestController
public class ResttController {
	
	@Autowired
	private LoginService loginService;
	

	
	// 아이디 중복검사 2023-08-02
		
		@PostMapping("/checkID")
		public String checkID(@RequestParam("id") String id) {
			//System.out.println("id : " + id);
			
			int result = loginService.checkID(id);
			//System.out.println(result);
			JSONObject json = new JSONObject();
			json.put("result", result);
			System.out.println(json.toString());
			
				// return result +"";
			return json.toString();  
				
		
			}
		
		//boardList2
		@GetMapping("/boardList2")
		public String boardList2() {
			
	List<Map<String,Object>> list = loginService.boardList2();
	System.out.println(list);
			
			return "";
					
		}
		

}
