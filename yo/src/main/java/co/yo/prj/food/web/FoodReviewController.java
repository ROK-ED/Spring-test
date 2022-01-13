package co.yo.prj.food.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import co.yo.prj.food.service.FoodReviewService;
import co.yo.prj.food.service.FoodReviewVO;

@Controller
public class FoodReviewController {

	@Autowired
	private FoodReviewService foodReviewDao;

	@RequestMapping("/foodReviewInsert.do")
	@ResponseBody
	public String foodReviewInsert(HttpServletRequest request, HttpSession session, FoodReviewVO foodReview) {
		int review_id = 0; // 나중에 바꿔야함!!!!!!!!!!!!===========
		String review_member_email = request.getParameter("review_member_email");

		if (review_member_email != null) {

			System.out.println("이메일 확인" + review_member_email);

			foodReview.setReview_id(review_id);// ===============이거는 시퀀스로 하기...
			foodReview.setReview_member_email(review_member_email);
			foodReview.setReview_hit(1);
			
			
			foodReview.setReview_place_id(0);
			foodReview.setReview_option("F");
			foodReview.setReview_food_id(Integer.parseInt(request.getParameter("review_food_id")));

			foodReview.setReview_rate(Integer.parseInt(request.getParameter("rate")));
			foodReview.setReview_subject(request.getParameter("review_textarea"));
			foodReviewDao.foodReviewInsert(foodReview);
			
		} else {
			System.out.println("이메일 안됨...ㅠ");
		}

		return "";/// =================나중에 여기에 redirect 넣어야함
	}

}
