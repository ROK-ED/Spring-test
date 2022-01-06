package co.yo.prj.board.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.yo.prj.board.service.BoardMapper;
import co.yo.prj.board.service.BoardService;
import co.yo.prj.board.service.BoardVO;

@Repository("boardDao")
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardMapper map;
	
	@Override
	public List<BoardVO> boardSelectList() {
		// TODO Auto-generated method stub
		return map.boardSelectList();
	}

	@Override
	public BoardVO boardSelect(BoardVO board) {
		// TODO Auto-generated method stub
		return map.boardSelect(board);
	}

	@Override
	public int boardInsert(BoardVO board) {
		// TODO Auto-generated method stub
		return map.boardInsert(board);
	}

	@Override
	public int boardUpdate(BoardVO board) {
		// TODO Auto-generated method stub
		return map.boardUpdate(board);
	}

	@Override
	public int boardDelete(BoardVO board) {
		// TODO Auto-generated method stub
		return map.boardDelete(board);
	}

	@Override
	public List<BoardVO> boardSearch(String key, String val) {
		// TODO Auto-generated method stub
		return map.boardSearch(key, val);
	}

}
