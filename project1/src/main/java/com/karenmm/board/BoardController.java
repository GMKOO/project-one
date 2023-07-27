package com.karenmm.board;

import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.karenmm.util.PageDTO;
import com.karenmm.util.Util;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class BoardController {
	// user -> Controller -> Servise > DAO > mybatis -> DB

	// Autowired말고 Resource로 연결
	// Autowire 스프링에서 지원하고 자동으로 타입맞는걸 찾아온다.

	@Autowired
	private Util util; // 우리가 만든 숫자변환을 사용하기 위해서 객체 연결.( 일반적인 객체생성도 가능)

	@Resource(name = "boardService")
	private BoardService boardService;

	@GetMapping("/delete")
	public String delete(@RequestParam(value = "bno", required = true, defaultValue = "0") int bno , HttpSession session) {
		
		if(session.getAttribute("mid")!=null) {
			BoardDTO dto = new BoardDTO();
			dto.setBno(bno);
			dto.setM_id((String)session.getAttribute("mid"));
//			dto.setBwrite(null);
			// 추ㅜ후 로그인을 하면 사용자의 정보도 담아서 보냅니다

			boardService.delete(dto);
			return "redirect:board";
			
		} else {
			
			
			return "redirect:/login";
			
		}
		
//		System.out.println("mid : " + session.getAttribute("mid"));
		
		// HttpServletRequest의 getParameter();
		// dto
//		System.out.println("bno :1 " + bno);

	 // 삭제를 완료한 후에 다시 보드로
	}

	@GetMapping("/write")
	public String write(HttpServletRequest request) {
		HttpSession session = request.getSession();
		
		

		if (session.getAttribute("mname") != null) {
			return "write";

		} else {

			return "redirect:/login";
		}

	}

	@PostMapping("/write")
	public String write2(HttpServletRequest request) {
		// 사용자가 입력한 데이터 변수에 담기
		// Service > DAO > mybatis > DB로 보내서 저장하기

//		System.out.println(request.getParameter("title"));
//		System.out.println(request.getParameter("content"));

		HttpSession session = request.getSession();
		if (session.getAttribute("mid") != null) {
		
			BoardDTO dto = new BoardDTO();
			dto.setBtitle(request.getParameter("title"));
			dto.setBcontent(request.getParameter("content"));
			dto.setUuid(UUID.randomUUID().toString());
			

			
			if(dto.getBcontent().isEmpty() || dto.getBtitle().isEmpty() ||
					dto.getBcontent().length()<10 || dto.getBtitle().length()<3) {
				
				
				return "redirect:/write";
				
				
			}
			// 세션에서 불러오겠습니다.
			dto.setM_id((String) session.getAttribute("mid")); // 이건 임시로 적었습니다.
			dto.setM_name((String) session.getAttribute("mname"));
			

			boardService.write(dto);

			return "redirect:board";

			// 로그인 했습니다. = 아래 로직을 여기로 가져오세요.
		} else {

			// 로그인 안했어요
			return "redirect:/login";
		}

	}

	@GetMapping("/board")
	public String board(@RequestParam(value= "pageNo",required=false,defaultValue = "1")
						int pageNo, Model model) {
		// 서비스에서 값 가져오기
		//페이지네이션인포 -> 값 넣고 -> DB -> JSP
		//PaginationInfo에 필수 정보를 넣어준다.
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(pageNo); //현재페이지정보
		paginationInfo.setRecordCountPerPage(10); //한페이지 게시되는 게시물 건수
		paginationInfo.setPageSize(10); //페이징 리스트의 사이즈
		
		//전체 글수 가져오는 명령문장
		int totalCount=boardService.totalCount();
		paginationInfo.setTotalRecordCount(totalCount); // 전체 게실물 건 수
		
		int firstRecordIndex = paginationInfo.getFirstRecordIndex(); // 시작위치
		int recordCountPerPage = paginationInfo.getRecordCountPerPage(); // 페이지당 몇개?
		
		System.out.println(firstRecordIndex);
		System.out.println(recordCountPerPage);
		System.out.println(pageNo);
		System.out.println(totalCount);
		
		PageDTO page = new PageDTO();
		page.setFirstRecordIndex(firstRecordIndex);
		page.setRecordCountPerPage(recordCountPerPage);
		
		//보드서비스 수정합니다.
		List<BoardDTO> list = boardService.boardlist(page);
		
		
		
		model.addAttribute("list", list);
		model.addAttribute("paginationInfo", paginationInfo);

		// 모델은 값 만 보내고 모델앤뷰는 ....
		return "board";
	}
	
	@GetMapping("/warning")
	public String warning(Model model) {
		// 서비스에서 값 가져오기
		

		// 모델은 값 만 보내고 모델앤뷰는 ....
		return "warning";
	}

	// 파라미터로 들어오는 값 잡기
	@GetMapping("/detail")
	public String detail(HttpServletRequest request, Model model) {
		// bno에 요청하는 값이 있습니다. 이 값을 db까지 보내겠습니다.
//		String bno = request.getParameter("bno");

		int bno = util.strToInt(request.getParameter("bno"));

//		System.out.println("bno : " + bno);

		// DTO로 변경합니다.
		BoardDTO dto = new BoardDTO();
		dto.setBno(bno);
		// dto.setM_id(null); 글 상세보기에서는 mid가 없어도됩니다.

		BoardDTO result = boardService.detail(dto);
		model.addAttribute("dto", result);

		return "detail";
	}

	@GetMapping("/edit")
	public ModelAndView edit(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		// 객체생성 () 괄호안으로 jsp이동"redirect:/login"
		// 데이터베이스에 bno를 보내서 dto를 얻어 옵니다.

		HttpSession session = request.getSession();
		if (session.getAttribute("mid") != null) {

			// if문으로 만들어주세요.
			// if(

			BoardDTO dto = new BoardDTO();
			dto.setBno(util.strToInt(request.getParameter("bno")));

			dto.setM_id((String) session.getAttribute("mid"));

			BoardDTO result = boardService.detail(dto);

			if (result != null) {
				// 내 글을 수정 했습니다.
				mv.addObject("dto", result); // mv에 실어보냅니다
				mv.setViewName("edit"); // 이동할 jsp명을 적어줍니다.
			} else {// 다른 사람 글이라면 null입니다 . 경고창으로 이동 합니다.
				mv.setViewName("warning");
			}

			// 내글만 수정 할수 있도록 세션에 있는 mid도 보냅니다.

			// mv에 실어보냅니다.

		} else {
			mv.setViewName("redirect:/login");

		}
		return mv;
	}

	@PostMapping("/edit")
	public String edit(BoardDTO dto) {
//		System.out.println(dto.getBcontent());
//		System.out.println(dto.getBtitle());
//		System.out.println(dto.getBno());
		boardService.edit(dto);
//		System.out.println("map : " + map);

		return "redirect:detail?bno=" + dto.getBno(); // 보드로 이동하게 해주세요
	}
//	
}
