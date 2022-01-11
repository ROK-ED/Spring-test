package co.yo.prj.food.web;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import co.yo.prj.food.service.FoodImgService;
import co.yo.prj.food.service.FoodImgVO;

@Controller
public class CrawController {

	@Autowired
	private FoodImgService foodImgDao;

	// 이미지 하나만 들고와서 저장하기! 한번만 돌리면 됨
	// 이미지 하나만 들고와서 저장하기! 한번만 돌리면 됨
	@RequestMapping("/oneImgCrawl.do")
	@ResponseBody
	public String oneImgCrawl(@RequestParam("food_id") String food_id,@RequestParam("food_name") String food_name)
			throws IOException {

		ArrayList<String> al1 = new ArrayList<>();
		
		String address = "https://www.daegufood.go.kr/kor/food/food.asp?sw=" + food_name;
		Document rawData = Jsoup.connect(address).timeout(5000).get();
		System.out.println("음식점 이름 =======" + food_name);
		System.out.println("음식점 번호 ======= " + food_id);

		System.out.println("주소 ======================="+address);

		Elements blogOption = rawData.select(".food_list02");
		
		String realIMG = "";
		//String path = "C:\\Users\\temp\\food"; // 저장할 경로

		for (Element option : blogOption) {
			FoodImgVO foodImg = new FoodImgVO();

			realIMG = option.select("img").attr("src");
			realIMG = "https://www.daegufood.go.kr" + realIMG;

			foodImg.setFood_id(food_id);
			foodImg.setFood_img(realIMG);
			System.out.println("이미지 링크 ========== "+realIMG);
			
			int result = foodImgDao.foodImgInsert(foodImg);
			System.out.println(result + "건 입력되었습니다");

			al1.add(realIMG);

			System.out.println("이미지 경로" + realIMG);
		}

		return null;
	}

	// 이미지 전체 다 들고오기!
	@RequestMapping("/imgListCrawl.do")
	@ResponseBody
	public ArrayList<String> ImgListCrawl(Model model, @RequestParam("food_id") String food_id) throws IOException {

		ArrayList<String> al1 = new ArrayList<>();

		String address = "https://www.daegufood.go.kr/kor/food/food.asp?idx=" + food_id + "&gotoPage=1";
		Document rawData = Jsoup.connect(address).timeout(5000).get();

		Elements blogOption = rawData.select(".imgsize");

		String realIMG = "";

		for (Element option : blogOption) {

			realIMG = option.attr("src");
			realIMG = "https://www.daegufood.go.kr" + realIMG;

			al1.add(realIMG);
		}

		model.addAttribute("imgs", al1);

		return al1;
	}

}