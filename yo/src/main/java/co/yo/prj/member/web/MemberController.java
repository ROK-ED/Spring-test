package co.yo.prj.member.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import co.yo.prj.member.service.MemberService;

@Controller
public class MemberController {
	@Autowired
	private MemberService memberDao;
	
	//배포시 꼭 지워야됨
//	@Autowired
//	private String saveDir; //(개발중에만 사용) 파일 저장경로를 자동주입
	
	@RequestMapping("/memberSelectList.do")
	public String memberSelectList(Model model) {
		model.addAttribute("members", memberDao.memberSelectList());
		return "member/memberSelectList";
	}
	
	@RequestMapping("memberJoinForm.do")
	public String memberJoinForm() {
		return "member/memberJoinForm";
	}
	
	
}
