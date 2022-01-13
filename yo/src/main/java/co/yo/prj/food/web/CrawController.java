package co.yo.prj.food.web;

import java.io.IOException;
import java.net.URLEncoder;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import co.yo.prj.food.service.FoodImgService;
import co.yo.prj.food.service.FoodImgVO;

@Controller
public class CrawController {

	@Autowired
	private FoodImgService foodImgDao;

	@RequestMapping(value = "/foodImgSelectOne.do", produces = "text/plain; charset=UTF-8")
	@ResponseBody
	public String foodImgSelectOne(@RequestParam("food_id") String food_id) {
		//System.out.println("이거 확인해야 함 음식점번호 ========" + food_id);
		try {
			FoodImgVO foodResult = foodImgDao.foodImgSelectOne(food_id);
			String foodImg;

			if (foodResult != null) {
				foodImg = foodResult.getFood_img();
				// System.out.println("사진 링크 =============" + foodImg);
				//foodImg = new String(foodImg.getBytes("8859_1"), "utf-8");

				//System.out.println("사진 링크 =============" + foodImg);
				// foodImg = URLEncoder.encode(foodImg, "euc-kr");

				return foodImg;
			}

		} catch (Exception e) {
			System.out.println("사진 안나옴...................ㅠ");
		}
		return null;

	}

	// 이미지 하나만 들고와서 저장하기! 한번만 돌리면 됨
	// 이미지 하나만 들고와서 저장하기! 한번만 돌리면 됨
	@RequestMapping("/oneImgCrawl.do")
	@ResponseBody
	public String oneImgCrawl(@RequestParam("food_id") String food_id, @RequestParam("food_name") String food_name)
			throws IOException {

		ArrayList<String> al1 = new ArrayList<>();

		String address = "https://www.daegufood.go.kr/kor/food/food.asp?sw=" + food_name;
		Document rawData = Jsoup.connect(address).timeout(5000).get();
//		System.out.println("음식점 이름 =======" + food_name);
//		System.out.println("음식점 번호 ======= " + food_id);
//
//		System.out.println("주소 =======================" + address);

		Elements blogOption = rawData.select(".food_list02");

		String realIMG = "";
		// String path = "C:\\Users\\temp\\food"; // 저장할 경로

//		for (Element option : blogOption) {
//			FoodImgVO foodImg = new FoodImgVO();
//
//			realIMG = option.select("img").attr("src");
//			realIMG = "https://www.daegufood.go.kr" + realIMG;
//
//			foodImg.setFood_id(food_id);
//			foodImg.setFood_img(realIMG);
//			System.out.println("이미지 링크 ========== "+realIMG);
//			
//			int result = foodImgDao.foodImgInsert(foodImg);
//			System.out.println(result + "건 입력되었습니다");
//
//			al1.add(realIMG);
//
//			System.out.println("이미지 경로" + realIMG);
//		}

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