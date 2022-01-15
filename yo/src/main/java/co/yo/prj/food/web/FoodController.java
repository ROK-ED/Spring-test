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
import com.fasterxml.jackson.databind.jsonFormatVisitors.JsonArrayFormatVisitor;

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

	// 확인 출력하는 함수
	public JSONArray findLocation(String food_location, JSONArray searchArray) {

		StringBuffer result = new StringBuffer();
		String data = "";
//		String[] daeguLocation = { "중구", "남구", "달서구", "북구", "달성군", "서구", "수성구" };
		// JSONArray jArray = new JSONArray();
		try {
			String apiURL = "https://www.daegufood.go.kr/kor/api/tasty.html?mode=json&addr=" + food_location;
			System.out.println("주소 확인하기 ===================================" + apiURL);

			if (food_location.equals("전체")) {

			}
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
			searchArray = jObject.getJSONArray("data");

			// 확인용
//			for (int i = 0; i < jArray.length(); i++) {
//				JSONObject obj = jArray.getJSONObject(i);
//				String title = obj.getString("FD_CS");
//				// if (title.equals("중식")) {
//				//System.out.println("title(" + i + "): " + title);
//				// }
//			}

			urlconnection.disconnect();

		} catch (Exception e) {
			e.printStackTrace();
		}
		// System.out.println(data);
		return searchArray;

	}

	@RequestMapping(value = "/ajaxFood.do", produces = "application/text;charset=utf8")
	@ResponseBody
	public String ajaxFood(HttpSession session, @RequestParam("food_location") String food_location,
			@RequestParam("food_class") String food_class, @RequestParam("food_name") String food_name) {

		StringBuffer result = new StringBuffer();
		String data = "";
		String[] daeguLocation = { "중구", "남구", "달서구", "북구", "달성군", "서구", "수성구" };
		JSONArray searchArray = new JSONArray();
		JSONArray jArray = new JSONArray();
		try {
//			String apiURL = "https://www.daegufood.go.kr/kor/api/tasty.html?mode=json&addr=" + food_location;
//			System.out.println("주소 확인하기 ===================================" + apiURL);
//			if (food_location.equals("전체")) {
//
//			}
//			URL url = new URL(apiURL);
//			HttpURLConnection urlconnection = (HttpURLConnection) url.openConnection();
//			urlconnection.setRequestMethod("GET");
//
//			BufferedReader br = new BufferedReader(new InputStreamReader(urlconnection.getInputStream(), "UTF-8"));
//
//			String returnLine;
//
//			while ((returnLine = br.readLine()) != null) {
//				result.append(returnLine);
//				// System.out.println("리턴라인"+returnLine);
//			}
//
//			// 데이터 정리하기
//			data = result.toString();
//			data = data.replace("\", }", "\"}");
////			data = data.replace("\"능이버섯\"", "능이버섯");
////			data = data.replace("\"한우마을 석정가든\"", "한우마을 석정가든");
//
//			String str = "/^(\"SMPL_DESC\":\")[^가-힣ㄱ-ㅎㅏ-ㅣa-zA-Z0-9]\"[^가-힣ㄱ-ㅎㅏ-ㅣa-zA-Z0-9]\"[^가-힣ㄱ-ㅎㅏ-ㅣa-zA-Z0-9](\"})$\"}/g";
//			data = data.replace(str, " ");
//
//			// String to json --> model
//			JSONObject jObject = new JSONObject(data);
//
//			JSONArray jArray = jObject.getJSONArray("data");
//
//			session.setAttribute("jsonModel", jArray);
//
//			// 확인용
////			for (int i = 0; i < jArray.length(); i++) {
////				JSONObject obj = jArray.getJSONObject(i);
////				String title = obj.getString("FD_CS");
////				// if (title.equals("중식")) {
////				//System.out.println("title(" + i + "): " + title);
////				// }
////			}

			if (food_location.equals("전체")) {
				for (int i = 0; i < daeguLocation.length; i++) {
					findLocation(daeguLocation[i], searchArray);
				}
			} else {
				findLocation(food_location, searchArray);
			}

			// 검색용
			boolean food_name_check = (!food_name.equals("")) ? true : false;
			boolean food_class_check = (!food_class.equals("")) ? true : false;

			//JSONArray searchArray = new JSONArray();

			if (food_name_check == true || food_class_check == true) {

				for (int i = 0; i < jArray.length(); i++) {
					JSONObject obj = jArray.getJSONObject(i);
					String jsonFoodClass = obj.getString("FD_CS");
					String jsonFoodName = obj.getString("BZ_NM");

					if ((food_name_check == true) ? (jsonFoodName.contains(food_name) ? true : false)
							: true && (food_class_check == true) ? jsonFoodClass.contains(food_class) : true) {
						searchArray.put(obj);

						System.out.println(
								"확인하기 !!!!!!!!!!!====================  " + jsonFoodClass + " : " + jsonFoodName);

					} else {
						System.out.println("안되는게 정상인 경우... 검색결과 X........");
					}
				}

				if (searchArray.length() > 0) {
					String first = "{\"status\":\"DONE\", \"total\":\"" + searchArray.length() + "\", \"data\":";

					String tmp = searchArray.toString();
					data = first + tmp + "}";
//				System.out.println(data);

				} else {
					data = "-1";
				}
			}

			//urlconnection.disconnect();

		} catch (Exception e) {
			e.printStackTrace();
		}
		// System.out.println(data);
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
	public String foodSelectOne(@RequestParam("food_id") String food_id,
			@RequestParam("food_location") String food_location, Model model) {

		StringBuffer result = new StringBuffer();
		String data = "";
		try {
			String apiURL = "https://www.daegufood.go.kr/kor/api/tasty.html?mode=json&addr=" + food_location;
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
				String title = obj.getString("FD_CS");

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
