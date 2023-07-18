package com.karenmm.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class BoardController {
	// user -> Controller -> Servise > DAO > mybatis -> DB

	// Autowired말고 Resource로 연결
	// Autowire 스프링에서 지원하고 자동으로 타입맞는걸 찾아온다.

	@GetMapping("/write")
	public String write() {
		return "write";
	}
	
	@PostMapping("/write")
	public String write(HttpServletRequest request) {
		//사용자가 입력한 데이터 변수에 담기 
		//Service > DAO > mybatis > DB로 보내서 저장하기 
		
		System.out.println(request.getParameter("title"));
		System.out.println(request.getParameter("content"));
		
		BoardDTO dto = new BoardDTO();
		dto.setBtitle(request.getParameter("title"));
		dto.setBcontent(request.getParameter("content"));
		dto.setBwrite("홍길동");
		
		boardService.write(dto);
		
		return "redirect:board";
	}
	
	@Resource(name = "boardService")
	private BoardService boardService;
	
	@GetMapping("/board")
	public String board(Model model) {
		// 서비스에서 값 가져오기
		model.addAttribute("list",boardService.boardlist());
	
		
	 //모델은 값 만 보내고  모델앤뷰는 ....
		return "board";
	} 

	
	
	//파라미터로 들어오는 값 잡기 
	@GetMapping("/detail")
	public String detail(HttpServletRequest request, Model model) {
		//bno에 요청하는 값이 있습니다. 이 값을 db까지 보내겠습니다.
	String bno=request.getParameter("bno");
	System.out.println("bno : " +bno);
	
	BoardDTO dto = boardService.detail(bno);
	model.addAttribute("dto", dto);
	
		return "detail";
	}
}
