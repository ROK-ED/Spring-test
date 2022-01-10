package co.yo.prj.food.web;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import co.yo.prj.food.service.FoodService;
import co.yo.prj.food.service.FoodVO;

@Controller
public class FoodController {
	@Autowired
	private FoodService foodDao;

	@RequestMapping("/food.do")
	public String food() {
		return "food/food";
	}

	@RequestMapping("/foodInsert.do")
	public String foodInsert(FoodVO food, Model model) {

		// int result=foodDao.foodInsert(food);
		// (result>1) {
		// model.addAttribute("message", "정상적으로 입력되었습니다");
		// }

		return "food/foodInsert";
	}

	@RequestMapping("/foodList.do")
	public String foodSelectList(Model model) {
		model.addAttribute("mapSelectList", foodDao.mapSelectList());
		model.addAttribute("foodSelectList", foodDao.foodSelectList());
		return "food/foodList";
	}

	// ajax로 돌리는거
	@PostMapping("/foodSelectOption.do")
	@ResponseBody
	public List<FoodVO> foodSelectOption(@RequestParam("key") String key, @RequestParam("data") String data) {
		return foodDao.foodSelectOption(key, data);

	}

	@PostMapping("makeMarker.do")
	@ResponseBody
	public List<FoodVO> makeMarker() {
		return foodDao.foodSelectList();

	}

	@RequestMapping("/foodSelect.do")
	public String foodSelect(FoodVO food, Model model) {

		model.addAttribute("foodSelect", foodDao.foodSelect(food));

		return "food/foodSelect";
	}
	
	@RequestMapping("/ajaxFoodList.do")
	public String ajaxFoodList() {
		
		return "food/ajaxFoodList";
		
	}

	@RequestMapping(value = "/ajaxFood.do", produces = "application/text;charset=utf8")
	@ResponseBody
	public String ajaxFood() {
	
		StringBuffer result = new StringBuffer();
		try {
			String apiURL = "https://www.daegufood.go.kr/kor/api/tasty.html?mode=json&addr=달서구";
			URL url = new URL(apiURL);
			HttpURLConnection urlconnection = (HttpURLConnection) url.openConnection();
			urlconnection.setRequestMethod("GET");

			BufferedReader br = new BufferedReader(new InputStreamReader(urlconnection.getInputStream(), "UTF-8"));

			String returnLine;

			while ((returnLine = br.readLine()) != null) {
				result.append(returnLine);
				// System.out.println("리턴라인"+returnLine);
			}
			urlconnection.disconnect();

		} catch (Exception e) {
			e.printStackTrace();
		}
		// System.out.println("=================================");
		// System.out.println("최종 뿌리기 "+result.toString());

		return result.toString();

	}

}
