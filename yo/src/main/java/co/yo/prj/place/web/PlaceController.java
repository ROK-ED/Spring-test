package co.yo.prj.place.web;


import java.io.IOException;
import java.util.ArrayList;

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
	
	@PostMapping("/ajaxPlace.do") // 아이디 중복 체크
	@ResponseBody
	public String ajaxPlace(String path, Model model ) throws IOException {
		System.out.println(path);
		
		ArrayList<String> al1 = new ArrayList<>();
		
		Document rawData = Jsoup.connect(path).timeout(5000).get();
		Elements blogOption = rawData.select("body");
		String realURL = "";
		String realTITLE = "";
		System.out.println("==================================================================================");
		System.out.println(rawData);
		System.out.println("==================================================================================");
		System.out.println("==================================================================================");
		System.out.println(blogOption);
//		for (Element option : blogOption) {
//			System.out.println("여기오냐");
//			realURL = option.select("a").attr("href");
//			realTITLE = option.select("a").attr("title");
//			System.out.println(realURL);
//			System.out.println(realTITLE);
//		}
		
		return model.toString();
	}

}
