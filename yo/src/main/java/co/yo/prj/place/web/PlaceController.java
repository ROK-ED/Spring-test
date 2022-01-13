package co.yo.prj.place.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class PlaceController {
	
	@RequestMapping("placeSelectList.do")
	public String placeSelectList(Model model) {
		return "place/placeSelectList";
	}
	
	@PostMapping("/ajaxPlace.do") // 아이디 중복 체크
	@ResponseBody
	public String ajaxPlace(String path, Model model ) {
		String b = null;
		return b;
	}

}
