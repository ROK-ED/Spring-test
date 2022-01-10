package co.yo.prj.board.web;

import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import co.yo.prj.Message;
import co.yo.prj.board.service.BoardService;
import co.yo.prj.board.service.BoardVO;

@Controller
public class BoardController {
	@Autowired
	private BoardService boardDao;

	// 리스트 출력
	@RequestMapping("/boardSelectList.do")
	public String boardSelectList(HttpSession session, Model model) {
		String member_email = (String) session.getAttribute("member_email");
		if (member_email != null) {
			model.addAttribute("boardList", boardDao.boardSelectList());
			return "board/boardSelectList";
		} else {
			return "member/memberLoginForm";
		}
	}

	// 글작성 폼으로 이동
	@RequestMapping("/boardInsertForm.do")
	public String boardInsertForm(HttpServletRequest request, HttpSession session, Model model) {
		// board_id가 있으면 수정 없으면 등록
		String member_email = (String) session.getAttribute("member_email");
		if (member_email != null) {
			BoardVO board = new BoardVO();
			String str_bId = request.getParameter("board_id");

			if (str_bId != null) {
				// 수정
				int board_id = Integer.parseInt(str_bId);
				board.setBoard_id(board_id);
				model.addAttribute("data", boardDao.boardSelect(board));
				return "board/boardInsertForm";
			} else {
				return "board/boardInsertForm";
			}

		} else {
			return "member/memberLoginForm";
		}

	}

	// 글작성 및 수정
	@RequestMapping("/board.do")
	public void boardInsert(HttpServletRequest request, ServletResponse response, HttpSession session)
			throws Exception {
		String member_email = (String) session.getAttribute("member_email");
		if (member_email != null) {
			BoardVO board = new BoardVO();

			String cmd = request.getParameter("cmd");

			int board_id;
			String title;
			String content;
			String email;

			System.out.println("cmd: " + cmd);

			if (("insert").equals(cmd)) {
				title = request.getParameter("title");
				content = request.getParameter("content");
				email = (String) session.getAttribute("member_email");

				board.setBoard_title(title);
				board.setBoard_content(content);
				board.setMember_email(email);

				boardDao.boardInsert(board);
				request.getRequestDispatcher("boardSelectList.do").forward(request, response);
			} else if (("update").equals(cmd)) {
				board_id = Integer.parseInt(request.getParameter("board_id"));
				title = request.getParameter("title");
				content = request.getParameter("content");
				email = (String) session.getAttribute("member_email");

				System.out.println("Update board_id: " + board_id);
				System.out.println("Delete email: " + email);

				board.setBoard_id(board_id);
				board.setBoard_title(title);
				board.setBoard_content(content);
				board.setMember_email(email);

				boardDao.boardUpdate(board);
				request.getRequestDispatcher("boardSelectList.do").forward(request, response);
			} else if (("delete").equals(cmd)) {
				board_id = Integer.parseInt(request.getParameter("board_id"));
				email = (String) session.getAttribute("member_email");
				System.out.println("Delete board_id: " + board_id);
				System.out.println("Delete email: " + email);

				board.setBoard_id(board_id);
				board.setMember_email(email);

				boardDao.boardDelete(board);
				request.getRequestDispatcher("boardSelectList.do").forward(request, response);
			}
		} else {
			request.getRequestDispatcher("memberLogin.do").forward(request, response);
		}
		
		
	}

	// 게시글 디테일
	@RequestMapping("boardDetail.do")
	public String boardDetail(HttpServletRequest request, HttpSession session, Model model) {
		int board_id = Integer.parseInt(request.getParameter("board_id"));

		BoardVO board = new BoardVO();
		board.setBoard_id(board_id);

		model.addAttribute("board", boardDao.boardSelect(board));

		return "board/boardDetail";
	}

}