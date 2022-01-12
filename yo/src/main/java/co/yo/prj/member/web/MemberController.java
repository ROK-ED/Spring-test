package co.yo.prj.member.web;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.SessionScope;
import org.springframework.web.servlet.ModelAndView;

import co.yo.prj.Message;
import co.yo.prj.member.service.MemberService;
import co.yo.prj.member.service.MemberVO;

@Controller
public class MemberController {
	@Autowired
	private MemberService memberDao;

	// 회원목록
	@RequestMapping("/memberSelectList.do")
	public String memberSelectList(Model model) {
		model.addAttribute("members", memberDao.memberSelectList());
		return "member/memberSelectList";
	}

	// 회원가입화면
	@RequestMapping("memberJoinForm.do")
	public String memberJoinForm() {
		return "member/memberJoinForm";
	}

	// 회원가입
	@PostMapping("memberJoin.do")
	ModelAndView memberJoin(MemberVO member, ModelAndView mav, HttpSession session) {
		try {
			memberDao.memberInsert(member);
			session.setAttribute("member_email", member.getMember_email()); // 세션에 아이디값 담는다.
			session.setAttribute("member_author", member.getMember_author());
			session.setAttribute("member_nick", member.getMember_nick());
			session.setAttribute("member_x", member.getMember_x());
			session.setAttribute("member_y", member.getMember_y());
			
			mav.addObject("data", new Message("'" + member.getMember_nick() + "'" + "님 회원가입에 감사드립니다.", "home.do"));
			mav.setViewName("Message");

		} catch (Exception e) {// 이거쓸일 없음
			mav.addObject("data", new Message("회원가입에 실패하였습니다.", "home.do"));
			mav.setViewName("Message");
		}
		return mav;

	}

	@PostMapping("/ajaxIsidCheck.do") // 아이디 중복 체크
	@ResponseBody
	public boolean ajaxIsidCheck(String member_email) {
		System.out.println(member_email);
		boolean b = memberDao.isIdCheck(member_email);
		System.out.println(b);
		return b;
	}

	// 로그인화면
	@RequestMapping("/memberLoginForm.do") // 단순히 입력폼을 호출할때
	public String memberLoginForm() {
		return "member/memberLoginForm";
	}

	@PostMapping("/memberLogin.do") // post 일때 get방식으로 보내면 403오류뜬다 반대의 경우도 동일
	ModelAndView memberLogin(MemberVO member, ModelAndView mav, HttpSession session) {

		try {
			member = memberDao.memberselect(member);

			if (member != null) {
				if (member.getMember_author().equals("ice")) {

					mav.addObject("data", new Message("동결된 계정, 해제를 원할시 관리자에게 연락바랍니다.", "home.do"));
					mav.setViewName("Message");

				} else {
					session.setAttribute("member_email", member.getMember_email()); // 세션에 아이디값 담는다.
					session.setAttribute("member_author", member.getMember_author());
					session.setAttribute("member_nick", member.getMember_nick());
					session.setAttribute("member_x", member.getMember_x());
					session.setAttribute("member_y", member.getMember_y());
					

					mav.addObject("data", new Message("'" + member.getMember_nick() + "'" + "님 환영합니다.", "home.do"));
					mav.setViewName("Message");
				}
			} else {

				mav.addObject("data", new Message("아이디 혹은 패스워드를 확인바랍니다.", "home.do"));
				mav.setViewName("Message");
			}
		} catch (Exception e) {// 이거쓸일 없을껄?
			mav.addObject("data", new Message("로그인에 실패하였습니다.", "home.do"));
			mav.setViewName("Message");
		}

		return mav;
	}

	// 로그아웃
	@RequestMapping("/memberLogout.do")
	ModelAndView memberLogout(ModelAndView mav, HttpSession session) {
		session.invalidate(); // 세션을 서버에서 삭제한다.
		mav.addObject("data", new Message("정상적으로 로그아웃 되었습니다.", "home.do"));
		mav.setViewName("Message");
		return mav;
	}

	// 마이페이지
	@RequestMapping("/memberselectForm.do")
	public String memberselectForm(MemberVO member, Model model, HttpSession session) {
		String email = (String) session.getAttribute("member_email");
		member.setMember_email(email);
		// System.out.println(session.getAttribute("member_email"));
		model.addAttribute("member", memberDao.memberselect(member));
		return "member/memberselectForm";
	}

	// 삭제
	@PostMapping("memberDelete.do")
	ModelAndView memberDelete(ModelAndView mav, String member_email, MemberVO member, HttpSession session) {
		member.setMember_email(member_email);
		memberDao.memberDelete(member);
		mav.addObject("data", new Message("계정이 삭제되었습니다.", "home.do"));
		mav.setViewName("Message");
		session.invalidate(); // 세션을 서버에서 삭제한다.
		return mav;
	}

	// 수정화면
	@RequestMapping("memberUpdateForm.do")
	public String memberUpdateForm(MemberVO member, Model model, HttpSession session) {
		// 기존값 뿌리기
		String email = (String) session.getAttribute("member_email");
		member.setMember_email(email);
		model.addAttribute("member", memberDao.memberselect(member));
		return "member/memberUpdateForm";
	}

	// 수정
	@PostMapping("/memberUpdate.do")
	public String memberUpdate(MemberVO member, Model model, HttpSession session) {
		String email = (String) session.getAttribute("member_email");
		member.setMember_email(email);
		// System.out.println(member.getMember_email());
		// System.out.println(member.getMember_pwd());
		// System.out.println(member.getMember_author());//
		// System.out.println(member.getMember_nick());//

		if (member.getMember_nick() == "") {
			// System.out.println("빈칸");
			// System.out.println(member.getMember_nick());
			String result = memberDao.memebrUpdateSelect(member).getMember_nick();
			// System.out.println(result);
			member.setMember_nick(result);
		}

		if (member.getMember_tel() == "") {
			// System.out.println(member.getMember_tel());
			String result = memberDao.memebrUpdateSelect(member).getMember_tel();
			// System.out.println(result);
			member.setMember_tel(result);
		}

		if (member.getMember_addr() == "") {
			// System.out.println(member.getMember_addr());
			String result = memberDao.memebrUpdateSelect(member).getMember_addr();
			// System.out.println(result);
			member.setMember_addr(result);
		}

		if (member.getMember_pwd() == "") {
			// System.out.println(member.getMember_pwd());
			String result = memberDao.memebrUpdateSelect(member).getMember_pwd();
			// System.out.println(result);
			member.setMember_pwd(result);
		}

//		System.out.println(member.getMember_x());
//		System.out.println(member.getMember_y());
		// System.out.println("DB실행");
		int r = memberDao.memberUpdate(member);
		// System.out.println(r + "건입력");

		// session 값 수정
		if (member.getMember_author() != null) {
			session.setAttribute("member_author", member.getMember_author());
		}
		if (member.getMember_nick() != null) {
			session.setAttribute("member_nick", member.getMember_nick());
		}
		// 수정 후 마이페이지
		model.addAttribute("member", memberDao.memebrUpdateSelect(member));
		return "member/memberselectForm";
	}

//	ModelAndView memberUpdate(MemberVO member, ModelAndView mav) {
//		memberDao.memberUpdate(member);
//		mav.addObject("data", new Message("계정이 수정되었습니다.", "memberselectForm.do"));
//		mav.setViewName("Message");
//		return mav;
//	}

	@PostMapping("/ajaxIce.do") // 동결 및 해제
	@ResponseBody
	public String ajaxIce(Model model, String member_email, MemberVO member) {

		System.out.println(member_email);
		//System.out.println(member_author);

		member.setMember_email(member_email);
		
		System.out.println("기존 데이터를 불러옵니다.");
		member = memberDao.memebrUpdateSelect(member);
		String author = member.getMember_author();
		System.out.println(member.getMember_author());
		if (author.equals("USER")) {
			System.out.println("USER ~ ice");
			String author2 = "ice";
			member.setMember_author(author2);
		} else if (author.equals("HOST")) {
			System.out.println("HOST ~ ice");
			String author2 = "ice";
			member.setMember_author(author2);
		} else if (author.equals("ADMIN")) {
			System.out.println("ADMIN 변경안할꺼임");
			String author2 = "ADMIN";
			member.setMember_author(author2);
		} else if (author.equals("ice")) {
			System.out.println("ice ~ USER");
			String author2 = "USER";
			member.setMember_author(author2);
		}
		System.out.println(member.getMember_email());
		System.out.println(member.getMember_author());
		System.out.println("업데이트 실행");
		memberDao.memberUpdate(member);
		System.out.println("업데이트 됨");
		
		
		// 동결 후 다시 리스트 페이지로
		System.out.println("리스트 불러오기 시작");
		model.addAttribute("members", memberDao.memberSelectList());
		System.out.println("리스트 불러오기 되면 화면 전환");
		return "member/memberSelectList";
	}
}
