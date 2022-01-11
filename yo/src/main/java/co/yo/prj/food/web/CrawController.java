package co.yo.prj.food.web;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class CrawController {

	@RequestMapping("/oneImgCrawl.do")
	@ResponseBody
	public String oneImgCrawl(@RequestParam("food_name") String food_name, @RequestParam("food_id") String food_id)
			throws IOException {

		ArrayList<String> al1 = new ArrayList<>();
		//System.out.println("음식점 이름 =======" + food_name);
		//System.out.println("음식점 번호 ======= " + food_id);

		String address = "https://www.daegufood.go.kr/kor/food/food.asp?sw=" + food_name;
		Document rawData = Jsoup.connect(address).timeout(5000).get();

		//System.out.println(address);

		Elements blogOption = rawData.select(".food_list02");

		String realIMG = "";

		for (Element option : blogOption) {

			realIMG = option.select("img").attr("src");
			realIMG = "https://www.daegufood.go.kr" + realIMG;

			al1.add(realIMG);
			//System.out.println("이미지 경로" + realIMG);
		}

		return realIMG;
	}

	@RequestMapping("/crawling.do")
	public String startCrawl(Model model, @Param("food_name") String food_name) throws IOException {

		ArrayList<String> al1 = new ArrayList<>();

		String address = "https://www.daegufood.go.kr/kor/food/food.asp?idx=" + "621" + "&gotoPage=1";
		Document rawData = Jsoup.connect(address).timeout(5000).get();

		Elements blogOption = rawData.select(".imgsize");

		String realIMG = "";

		for (Element option : blogOption) {

			realIMG = option.attr("src");
			realIMG = "https://www.daegufood.go.kr" + realIMG;

			al1.add(realIMG);
		}

		model.addAttribute("imgs", al1);

		return "craw/craw";
	}

}