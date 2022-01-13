package co.yo.prj.food.service;

import java.util.List;

public interface FoodReviewService {
	int foodReviewInsert(FoodReviewVO foodReview);
	List<FoodReviewVO> foodReviewSelectList(String member_email);
	
}
