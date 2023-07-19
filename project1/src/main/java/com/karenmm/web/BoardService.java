package com.karenmm.web;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.inject.Named;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestAttribute;

@Service("boardService")
public class BoardService {

	@Inject
	@Named("boardDAO")
	private BoardDAO boardDAO;

	@Autowired
	private Util util;

	// 보드 리스트 불러오는 메소드
	public List<Map<String, Object>> boardlist() {

//		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
//		
//		for (int i = 1; i < 11; i++) {
//			Map<String, Object> map = new HashMap<String, Object>();
//			map.put("bno", i);
//			map.put("btitle", i+"번째 글 입니다.");
//			map.put("bwrite", "홍길동");
//			map.put("bdate", "2023-07-17");
//			map.put("blike", i * 10 );
//			list.add(map);

		return boardDAO.boardList();
	}

	public BoardDTO detail(String bno) {

		BoardDTO dto = boardDAO.detail(bno);

		// 검사 : .이 없거나, null 이면 실행 하지 않게 해주세요.
		if (dto.getBip() != null && dto.getBip().indexOf(".") != -1) {

			// 여기서 ip 뽑아 올수 잇쬬
			// ip
			String ip = dto.getBip();
			String[] ipArr = ip.split("[.]");

			ipArr[1] = "♥";
			dto.setBip(String.join(".", ipArr));

		}
		return dto;
	}

	// 글쓰기 입니다.
	public void write(BoardDTO dto) {

		// btitle 가져와서 replase()로 < &lt; > &gt;로 변경

		String btitle = util.exchange(dto.getBtitle());

		dto.setBtitle(btitle);

		dto.setBip(util.getIp()); // 얻어온 ip도 저장해서 데이터베이스로 보내겠습니
		boardDAO.write(dto);
	}

	public void delete(BoardDTO dto) {
		boardDAO.delete(dto);
		
		
	}

}
