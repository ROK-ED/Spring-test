package co.yo.prj.board.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import co.yo.prj.board.service.BoardService;

@Controller
public class BoardController {
	@Autowired
	private BoardService boardDao;
	
	@RequestMapping("/boardSelectList.do")
	public String boardSelectList(Model model) {
		model.addAttribute("boardList",boardDao.boardSelectList());
		return "board/boardSelectList";
	}
}
