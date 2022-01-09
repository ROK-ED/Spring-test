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

@Controller
public class CrawController {


	
	@RequestMapping(value = "crawling.do", method = RequestMethod.GET)
	public String startCrawl(Model model, @Param("food_name") String food_name) throws IOException {

		SimpleDateFormat formatter = new SimpleDateFormat("yyyy.MM.dd", Locale.KOREA);
		Date currentTime = new Date();

		String dTime = formatter.format(currentTime);
		String e_date = dTime;

		currentTime.setDate(currentTime.getDate() - 1);
		String s_date = formatter.format(currentTime);

		String query = "성북구";
		String s_from = s_date.replace(".", "");
		String e_to = e_date.replace(".", "");
		int page = 1;
		
		ArrayList<String> al1 = new ArrayList<>();
		ArrayList<String> al2 = new ArrayList<>();

		while (page < 20) {
			String address = "https://www.daegufood.go.kr/kor/food/food.asp?sw="+food_name;
			Document rawData = Jsoup.connect(address).timeout(5000).get();
		
			System.out.println(address);
			
			Elements blogOption = rawData.select(".img");
			String realURL = "";
			String realTITLE = "";
			String realIMG = "";

			for (Element option : blogOption) {
			
				realIMG= option.select("img").attr("src");
				
		
				al1.add(realIMG);
			}
			page += 10;
		} 
		model.addAttribute("imgs",al1);
		return "craw/craw";
	}
	
}