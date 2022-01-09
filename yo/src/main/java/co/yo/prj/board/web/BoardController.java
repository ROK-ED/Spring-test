package co.yo.prj.board.web;

import java.util.Date;

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

	// 글작성 및 수정
	@RequestMapping("/board.do")
	public void boardInsert(HttpServletRequest request, ServletResponse response, HttpSession session)
			throws Exception {
		BoardVO board = new BoardVO();
		
		//cmd insert 안받아지는 문제 및 수정페이지 
		
		String cmd = request.getParameter("cmd");

		int board_id;
		String title;
		String content;
		String email;
		
		System.out.println("cmd: " + cmd);
		
		if (("insert").equals(cmd)) {
			//BoardVO loginUser = (BoardVO) session.getAttribute("loginUser");
			title = request.getParameter("title");
			content = request.getParameter("content");

			board.setBoard_title(title);
			board.setBoard_content(content);
			board.setMember_email("admin@admin.com");

			boardDao.boardInsert(board);
			request.getRequestDispatcher("boardSelectList.do").forward(request, response);
		} else if (("update").equals(cmd)) {
			// update - board_id, title, content
			board_id = Integer.parseInt(request.getParameter("board_id"));
			title = request.getParameter("title");
			content = request.getParameter("content");

			board.setBoard_id(board_id);
			board.setBoard_title(title);
			board.setBoard_content(content);
			boardDao.boardUpdate(board);
			request.getRequestDispatcher("boardSelectList.do").forward(request, response);
		} else if (("delete").equals(cmd)) {
			board_id = Integer.parseInt(request.getParameter("board_id"));

			boardDao.boardDelete(board);
			request.getRequestDispatcher("boardSelectList.do").forward(request, response);
		}
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