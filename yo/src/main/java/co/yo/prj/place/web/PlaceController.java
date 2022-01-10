package co.yo.prj.place.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PlaceController {
	
	@RequestMapping("placeSelectList.do")
	public String placeSelectList(Model model) {
		return "place/placeSelectList";
	}

}
