package co.yo.prj.food.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.http.HttpRequest;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import co.yo.prj.food.service.FoodReviewService;
import co.yo.prj.food.service.FoodReviewVO;

@Controller
public class FoodReviewController {

	@Autowired
	private FoodReviewService foodReviewDao;

	@RequestMapping("/foodReviewInsert.do")
	public String foodReviewInsert(HttpServletResponse response, HttpServletRequest request, HttpSession session,
			FoodReviewVO foodReview) throws IOException {

		String review_member_email = request.getParameter("review_member_email");
		String food_locaton = request.getParameter("form_food_location");
		String food_id = request.getParameter("review_food_id");
		food_locaton = food_locaton.substring(6, 9);
		System.out.println("주소랑 번호 확인하기 ===" + food_locaton + " :" + food_id);

		if (!review_member_email.equals("")) {

			// System.out.println("이메일 확인" + review_member_email);

			foodReview.setReview_member_email(review_member_email);

			foodReview.setReview_hit(1);

			// foodReview.setReview_place_id(1);
			foodReview.setReview_option("F");
			foodReview.setReview_food_id(Integer.parseInt(request.getParameter("review_food_id")));

			foodReview.setReview_rate(Integer.parseInt(request.getParameter("rate")));
			foodReview.setReview_subject(request.getParameter("review_textarea"));
			foodReviewDao.foodReviewInsert(foodReview);

		} else {
			System.out.println("이메일 안됨...ㅠ");
		}
		// String returnStr =
		// "redirect:foodSelectOne.do?food_id="+food_id+"&food_location="+food_locaton;
		String referer = request.getHeader("Referer"); // 헤더에서 이전 페이지를 읽는다.
		return "redirect:" + referer; // 이전 페이지로 리다이렉트

	}

	// 별찍기
	@RequestMapping("/showRate.do")
	@ResponseBody
	public FoodReviewVO showRate(HttpServletRequest request, @RequestParam String review_food_id) {
//		review_food_id = request.getParameter("food_review_id");
		System.out.println(review_food_id);
		FoodReviewVO foodReview = foodReviewDao.showRate(review_food_id);
		System.out.println("입력자수 ===============" + foodReview.getReview_hit());
		System.out.println("별점 ===============" + foodReview.getReview_rate());
		return foodReview;
	}

	// 출력
	@RequestMapping("/showReview.do")
	@ResponseBody
	public List<FoodReviewVO> showReview(@RequestParam String review_food_id) {
		// System.out.println("review_food_id
		// =============================="+review_food_id);
		List<FoodReviewVO> foodReviewList = foodReviewDao.foodReviewSelectList(review_food_id);
//		for (FoodReviewVO review : foodReviewList) {
//			System.out.println(review.getReview_subject());
//		}
		return foodReviewList;
	}

//	리뷰 삭제하기
	@RequestMapping("/deleteReview.do")
	public String deleteReview(@RequestParam int review_id, HttpServletRequest request) {

		// System.out.println(review_id);
		int result = foodReviewDao.foodReviewDelete(review_id);
		System.out.println(result + "건 삭제");
		String referer = request.getHeader("Referer"); // 헤더에서 이전 페이지를 읽는다.
		return "redirect:" + referer; // 이전 페이지로 리다이렉트

	}

	@RequestMapping("/updateReview.do")
	public String updateReview(@RequestParam("review_id") int review_id,
			@RequestParam("review_subject") String review_subject, HttpServletRequest request) {

		// System.out.println(review_id);
		FoodReviewVO foodReview = new FoodReviewVO();
		foodReview.setReview_id(review_id);
		foodReview.setReview_subject(review_subject);

		int result = foodReviewDao.foodReviewUpdate(foodReview);
		System.out.println(result + "건 수정");
		String referer = request.getHeader("Referer"); // 헤더에서 이전 페이지를 읽는다.
		return "redirect:" + referer; // 이전 페이지로 리다이렉트

	}

}
