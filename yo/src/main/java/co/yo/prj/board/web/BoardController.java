package co.yo.prj.board.web;

import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import co.yo.prj.board.service.BoardService;
import co.yo.prj.board.service.BoardVO;

@Controller
public class BoardController {
	@Autowired
	private BoardService boardDao;

	// 리스트 출력
	@RequestMapping("/boardSelectList.do")
	public String boardSelectList(HttpSession session, Model model) {
		model.addAttribute("boardList", boardDao.boardSelectList());
		return "board/boardSelectList";
		/*
		 * MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		 * if(loginUser.getMember_email() != null) { model.addAttribute("boardList",
		 * boardDao.boardSelectList()); return "board/boardSelectList"; }
		 * 
		 * return "member/login";
		 */
	}

	
	// 글작성 폼으로 이동
	@RequestMapping("/boardInsertForm.do")
	public String boardInsertForm() {
		return "board/boardInsertForm";
	}

	// 글 작성
	@RequestMapping("/boardInsert.do")
	public void boardInsert(HttpServletRequest request, ServletResponse response, HttpSession session)
			throws Exception {
		BoardVO board = new BoardVO();

		String title = request.getParameter("title");
		String content = request.getParameter("content");
		// String email = (String) session.getAttribute("member_email");
		board.setBoard_title(title);
		board.setBoard_content(content);
		board.setMember_email("admin@admin.com");

		boardDao.boardInsert(board);
		request.getRequestDispatcher("boardSelectList.do").forward(request, response);
	}
	
	// 게시글 디테일
	@RequestMapping("boardDetail.do")
	public String boardDetail(HttpServletRequest request, ServletResponse response, HttpSession session, Model model) {
		int board_id = Integer.parseInt(request.getParameter("board_id"));
		
		BoardVO board = new BoardVO();
		board.setBoard_id(board_id);
		
		model.addAttribute("board", boardDao.boardSelect(board));
		
		return "board/boardDetail";
	}
}
