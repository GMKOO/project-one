package com.karenmm.web;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BoardController {
	// user -> Controller -> Servise > DAO > mybatis -> DB

	// Autowired말고 Resource로 연결
	// Autowire 스프링에서 지원하고 자동으로 타입맞는걸 찾아온다.
	
	@Autowired
	private Util util; //우리가 만든 숫자변환을 사용하기 위해서 객체 연결.( 일반적인 객체생성도 가능)
	
	
	
	@Resource(name = "boardService")
	private BoardService boardService;

	@GetMapping("/delete")
	public String delete(
			@RequestParam(value = "bno",required = true ,defaultValue = "0") int bno){ 
		//HttpServletRequest의 getParameter();
		//dto
//		System.out.println("bno :1 " + bno);
		BoardDTO dto = new BoardDTO();
		dto.setBno(bno);
//		dto.setBwrite(null);
		//추ㅜ후 로그인을 하면 사용자의 정보도 담아서 보냅니다
		
		boardService.delete(dto);		

		return "redirect:board"; // 삭제를 완료한 후에 다시 보드로
	}

	@GetMapping("/write")
	public String write() {
		return "write";
	}


	@PostMapping("/write")
	public String write(HttpServletRequest request) {
		// 사용자가 입력한 데이터 변수에 담기
		// Service > DAO > mybatis > DB로 보내서 저장하기

//		System.out.println(request.getParameter("title"));
//		System.out.println(request.getParameter("content"));

		BoardDTO dto = new BoardDTO();
		dto.setBtitle(request.getParameter("title"));
		dto.setBcontent(request.getParameter("content"));

		dto.setBwrite("홍길동");

		boardService.write(dto);

		return "redirect:board";
	}

	@GetMapping("/board")
	public String board(Model model) {
		// 서비스에서 값 가져오기
		model.addAttribute("list", boardService.boardlist());

		// 모델은 값 만 보내고 모델앤뷰는 ....
		return "board";
	}

	// 파라미터로 들어오는 값 잡기
	@GetMapping("/detail")
	public String detail(HttpServletRequest request, Model model) {
		// bno에 요청하는 값이 있습니다. 이 값을 db까지 보내겠습니다.
//		String bno = request.getParameter("bno");
		
		int bno = util.strToInt(request.getParameter("bno"));
		
//		System.out.println("bno : " + bno);

		BoardDTO dto = boardService.detail(bno);
		model.addAttribute("dto", dto);

		return "detail";
	}
	
	@GetMapping("/edit")
	public ModelAndView edit(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("edit"); // edit.jsp
		//데이터베이스에 bno를 보내서 dto를 얻어 옵니다.
	
		BoardDTO dto = boardService.detail(util.strToInt(request.getParameter("bno")));
		//mv에 실어보냅니다.
		mv.addObject("dto", dto);

		return mv;
		
	}
	
	
	
	
	
	@PostMapping("/edit")
	public String edit(BoardDTO dto) {
//		System.out.println(dto.getBcontent());
//		System.out.println(dto.getBtitle());
//		System.out.println(dto.getBno());
		boardService.edit(dto);
//		System.out.println("map : " + map);
		
		return "redirect:detail?bno="+dto.getBno(); // 보드로 이동하게 해주세요
	}
//	
}
