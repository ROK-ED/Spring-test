package co.yo.prj.food.service;

import java.util.List;

import org.springframework.web.bind.annotation.RequestParam;

public interface FoodReviewMapper {
	int foodReviewInsert(FoodReviewVO foodReview);
	List<FoodReviewVO> foodReviewSelectList(String member_email);
	FoodReviewVO showRate(String review_food_id);
	int foodReviewDelete(int review_food_id);
	int foodReviewUpdate(FoodReviewVO foodReview);
}
