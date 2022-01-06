package co.yo.prj.board.service;

import java.util.List;

public interface BoardService {
	List<BoardVO> boardSelectList();

	BoardVO boardSelect(BoardVO board);

	int boardInsert(BoardVO board);

	int boardUpdate(BoardVO board);

	int boardDelete(BoardVO board);
	
	List<BoardVO> boardSearch(String key, String val);
}
