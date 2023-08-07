package com.karenmm.rest;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.karenmm.board.BoardService;
import com.karenmm.login.LoginService;
import com.karenmm.util.Util;

//@ResponseBody + controller  = restController   ajax용으로 사용된다

@RestController
public class ResttController {
	
	@Autowired
	private LoginService loginService;
	
	@Autowired
	private BoardService boardService;
	
	@Autowired
	private Util util;
	

	
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
		
		//자바스크립트로 만든 것.
		@PostMapping("/checkID2")
		public String checkID2(@RequestParam("id") String id) {
			int result = loginService.checkID(id);
			return result+"";
		}
		
		//boardList2
		@GetMapping(value = "/boardList2", produces = "application/text; charset=UTF-8")
		public String boardList2(@RequestParam("pageNo") int pageNo) {
			System.out.println("jq가 보내주는 :" + pageNo);
	List<Map<String,Object>> list = loginService.boardList2((pageNo-1)*10);
	System.out.println(list);
	JSONObject json = new JSONObject();
	JSONArray arr = new JSONArray(list);
	json.put("totalCount", loginService.totalCount());
	json.put("list", arr);
	json.put("pageNo", pageNo);
	System.out.println(json.toString());
			return json.toString();
					
		}
		
	/*	boardList2 = { totalCount : 128, 
						pageNo:1,
						list : [
						{bno:1, btitle:....}
						{bno:1, btitle:....}
						{bno:1, btitle:....}
						{bno:1, btitle:....}
						{bno:1, btitle:....}
						{bno:1, btitle:....}
						         ] 
						}        
						        
			객체 : {키 : 값, 이름 : 값,........}			        
						       */
		@PostMapping("/cdelR")
		public String cdelR(@RequestParam Map<String,Object> map, HttpSession session) {
			
			//if문 추가하기
			
			int result = 0;
			
			System.out.println(map);
			
			map.put("mid", session.getAttribute("mid"));
		
			System.out.println(map); // bno, cno , mid 나타남
			
			result = boardService.cdel(map);
			
			JSONObject json = new JSONObject();
			json.put("result",result);
			
			return json.toString();
			
		}
		/*	if(session.getAttribute("mid") != null) {
				 
				 if(map.containsKey("bno")&& map.get("cno")!=null &&
						 
					 !(map.get("bno").equals("")) && !(map.get("cno").equals(""))
						&& util.isNum(map.get("bno")) && util.isNum(map.get("cno")))
					 
					 map.put("mid", session.getAttribute("mid"));
				 	result = boardService.cdel(map);
				 	System.out.println("삭제결과: " + result);
			
			 } */
			 // return result+"";
	
						
		
		
		}



