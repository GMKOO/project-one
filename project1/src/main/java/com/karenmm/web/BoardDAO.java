package com.karenmm.web;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.inject.Named;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;


// Inject 사용해보기

@Repository("boardDAO")
public class BoardDAO {
	
//	public List<Map<String,Object>> boardList() {
	
		@Inject
		@Named("sqlSession")
		private SqlSession sqlSession;
		
		public List<BoardDTO> boardList()	{	
		
		return sqlSession.selectList("board.boardList");
	}

		public BoardDTO detail(BoardDTO dto2) {
			return sqlSession.selectOne("board.detail", dto2);  //앞에는 네임스페이스.아이디,값
		}

		public void write(BoardDTO dto) {
			sqlSession.insert("board.write",dto); // 네임스페이스.id 값
			//실행만 시키고 결과를 받지 않습니다. 
			
			//select를 제외한 나머지는 영향받은 행의 수를 받아오기도합니다
			
		}

		public void delete(BoardDTO dto) {
			sqlSession.delete("board.delete", dto);
			
		}

		public void edit(BoardDTO dto) {
			sqlSession.update("board.edit", dto);
		}

		public void likeUp(BoardDTO dto2) {
			sqlSession.update("board.likeUp", dto2);
		}

	

		
	
	

}
