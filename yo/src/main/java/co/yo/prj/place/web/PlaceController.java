package co.yo.prj.place.web;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
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

	// 업소명, 주소 가져오기
	@PostMapping("/ajaxPlace.do")
	@ResponseBody
	public Map<String, String> ajaxPlace(String path) throws IOException {
		// System.out.println(path);

		Map<String, String> al1 = new HashMap();

		Document rawData = Jsoup.connect(path).timeout(5000).get();
//		System.out.println("==================================================================================");
//		System.out.println(rawData);
		// Elements blogOption = rawData.select("body");
		Elements title = rawData.select("head > meta:nth-child(4)");
		// System.out.println("title : " + title);
		String title_text = title.attr("content");
		// System.out.println("title_text : "+title_text);

		Elements description = rawData.select("head > meta:nth-child(6)");
		// System.out.println();
		// System.out.println("description : " + description);
		String description_text = description.attr("content");
		// System.out.println("description_text : " + description_text);
		// System.out.println();

		// model.addAttribute("path", path);
		// model.addAttribute("title_text", title_text);
		// model.addAttribute("description_text", description_text);

		al1.put("path", path);
		al1.put("description_text", description_text);
		al1.put("title_text", title_text);

		System.out.println(al1.toString());

		return al1;
	}

	

}
