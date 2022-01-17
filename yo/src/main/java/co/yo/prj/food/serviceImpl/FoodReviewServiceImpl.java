package co.yo.prj.food.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.yo.prj.food.service.FoodReviewMapper;
import co.yo.prj.food.service.FoodReviewService;
import co.yo.prj.food.service.FoodReviewVO;

@Repository("foodReviewDao")
public class FoodReviewServiceImpl implements FoodReviewService {

	@Autowired
	private FoodReviewMapper map;
	
	@Override
	public int foodReviewInsert(FoodReviewVO foodReview) {
		return map.foodReviewInsert(foodReview);
	}

	@Override
	public List<FoodReviewVO> foodReviewSelectList(String member_email) {
		return map.foodReviewSelectList(member_email);
	}

	@Override
	public FoodReviewVO showRate(String review_food_id) {
		return map.showRate(review_food_id);
	}

	@Override
	public int foodReviewDelete(int review_food_id) {
		
		return map.foodReviewDelete(review_food_id);
	}



	@Override
	public int foodReviewUpdate(FoodReviewVO foodReview) {
		// TODO Auto-generated method stub
		return map.foodReviewUpdate(foodReview);
	}


	
	

}
