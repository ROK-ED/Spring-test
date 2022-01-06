package co.yo.prj.board.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface BoardMapper {
	List<BoardVO> boardSelectList();

	BoardVO boardSelect(BoardVO board);

	int boardInsert(BoardVO board);

	int boardUpdate(BoardVO board);

	int boardDelete(BoardVO board);

	List<BoardVO> boardSearch(@Param("key") String key, @Param("val") String val);
}
