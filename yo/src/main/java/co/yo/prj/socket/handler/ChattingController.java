package co.yo.prj.socket.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.socket.WebSocketSession;

@Controller
public class ChattingController {
	
	@RequestMapping(value = "/chat.do", method = RequestMethod.GET)
	public String chat(HttpServletRequest request, HttpServletResponse response, Model model, HttpSession session) {
		String member_email = (String) session.getAttribute("member_email");
		if (member_email != null) {
			return "chat/chat";
		} else {
			return "member/memberLoginForm";
		}
	}
}
