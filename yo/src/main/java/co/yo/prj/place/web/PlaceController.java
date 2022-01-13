package co.yo.prj.place.web;

import javax.swing.text.Document;

import org.jsoup.Jsoup;
import org.jsoup.nodes.*;
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
		//Document rawData = Jsoup.connect(path).timeout(5000).get();
		String b = null;
		return b;
	}

}
