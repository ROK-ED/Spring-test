package co.yo.prj.food.web;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.core.jackson.Log4jJsonObjectMapper;
import org.json.JSONObject;
import org.json.JSONArray;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonParser;

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

//	@RequestMapping("/foodInsert.do")
//	public String foodInsert(FoodVO food, Model model) {
//
//		// int result=foodDao.foodInsert(food);
//		// (result>1) {
//		// model.addAttribute("message", "정상적으로 입력되었습니다");
//		// }
//
//		return "food/foodInsert";
//	}

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

//	@PostMapping("makeMarker.do")
//	@ResponseBody
//	public List<FoodVO> makeMarker() {
//		return foodDao.foodSelectList();
//
//	}

	@RequestMapping("/foodSelect.do")
	public String foodSelect(FoodVO food, Model model) {

		return "food/foodSelect";
	}

	@RequestMapping("/ajaxFoodList.do")
	public String ajaxFoodList() {

		return "food/ajaxFoodList";

	}

	@RequestMapping(value = "/ajaxFood.do", produces = "application/text;charset=utf8")
	@ResponseBody
	public String ajaxFood(HttpSession session) {

		StringBuffer result = new StringBuffer();
		String data = "";
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

			// 데이터 정리하기
			data = result.toString();
			data = data.replace("\", }", "\"}");
//			data = data.replace("\"능이버섯\"", "능이버섯");
//			data = data.replace("\"한우마을 석정가든\"", "한우마을 석정가든");

			String str = "/^(\"SMPL_DESC\":\")[^가-힣ㄱ-ㅎㅏ-ㅣa-zA-Z0-9]\"[^가-힣ㄱ-ㅎㅏ-ㅣa-zA-Z0-9]\"[^가-힣ㄱ-ㅎㅏ-ㅣa-zA-Z0-9](\"})$\"}/g";
			data = data.replace(str, " ");

			// String to json --> model
			JSONObject jObject = new JSONObject(data);

			JSONArray jArray = jObject.getJSONArray("data");

			session.setAttribute("jsonModel", jArray);

//			for (int i = 0; i < jArray.length(); i++) {
//				JSONObject obj = jArray.getJSONObject(i);
//				String title = obj.getString("BZ_NM");
//				 System.out.println("title(" + i + "): " + title);
//
//			}

			urlconnection.disconnect();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return data;

	}

	// 음식점 전체조회 (api에서 가져오기)
	@RequestMapping(value = "/ajaxFoodList.do", produces = "application/text;charset=utf8")
	public String ajaxFoodList(Model model) {

		StringBuffer result = new StringBuffer();
		String data = "";
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

			// 데이터 정리하기
			data = result.toString();
			data = data.replace("\", }", "\"}");

			String str = "/^(\"SMPL_DESC\":\")[^가-힣ㄱ-ㅎㅏ-ㅣa-zA-Z0-9]\"[^가-힣ㄱ-ㅎㅏ-ㅣa-zA-Z0-9]\"[^가-힣ㄱ-ㅎㅏ-ㅣa-zA-Z0-9](\"})$\"}/g";
			data = data.replace(str, " ");

			urlconnection.disconnect();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return data;

	}

	// 음식점 상세조회(api에서 가져오기)
	@RequestMapping("/foodSelectOne.do")
	public String foodSelectOne(@RequestParam("food_id") String food_id, Model model) {

		StringBuffer result = new StringBuffer();
		String data = "";
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

			// 데이터 정리하기
			data = result.toString();
			data = data.replace("\", }", "\"}");

			String str = "/^(\"SMPL_DESC\":\")[^가-힣ㄱ-ㅎㅏ-ㅣa-zA-Z0-9]\"[^가-힣ㄱ-ㅎㅏ-ㅣa-zA-Z0-9]\"[^가-힣ㄱ-ㅎㅏ-ㅣa-zA-Z0-9](\"})$\"}/g";
			data = data.replace(str, " ");

			// String to json --> model

			JSONObject jObject = new JSONObject();
			JSONArray jArray = new JSONArray();

			jObject = new JSONObject(data);

			jArray = jObject.getJSONArray("data");

			for (int i = 0; i < jArray.length(); i++) {
				JSONObject obj = jArray.getJSONObject(i);
				String title = obj.getString("BZ_NM");

				if (obj.getString("OPENDATA_ID").equals(food_id)) {

					String returnTitle = title;
					System.out.println("===============================title(" + i + "): " + title);
					System.out.println("returnTitle===============================title(" + i + "): " + returnTitle);
					model.addAttribute("jsonModel", obj);
					break;

				}

			}

			urlconnection.disconnect();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "food/foodSelectOne";
	}

//	//리뷰 저장하기
//	@RequestMapping("/foodReview.do")
//	public String foodReview() {
//		
//		
//		
//		return null;
//		
//	}

}
