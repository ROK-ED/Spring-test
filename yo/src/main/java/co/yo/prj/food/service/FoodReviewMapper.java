package co.yo.prj.food.service;

import java.util.List;

public interface FoodReviewMapper {
	int foodReviewInsert(FoodReviewVO foodReview);
	List<FoodReviewVO> foodReviewSelectList(String member_email);
	FoodReviewVO showRate(String review_food_id);
	
}
