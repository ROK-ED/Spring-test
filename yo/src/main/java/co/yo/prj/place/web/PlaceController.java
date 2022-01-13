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
		
//		ArrayList<String> al1 = new ArrayList<>();
		
		Document rawData = Jsoup.connect(path).timeout(5000).get();
//		System.out.println("==================================================================================");
//		System.out.println(rawData);
		//Elements blogOption = rawData.select("body");
		Elements title = rawData.select("head > meta:nth-child(4)");
		System.out.println("title : " + title);
		String title_text = title.attr("content");
		System.out.println("title_text : "+title_text);
		
		Elements description = rawData.select("head > meta:nth-child(6)");
		System.out.println();
		System.out.println("description : " + description);
		String description_text = description.attr("content");
		System.out.println("description_text : " + description_text);
		System.out.println();
		Elements photo = rawData.select("html");
		System.out.println("photo : " + photo);
		
//		String realURL = "";
//		String realTITLE = "";
		//System.out.println(blogOption);
		
		System.out.println("");
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
