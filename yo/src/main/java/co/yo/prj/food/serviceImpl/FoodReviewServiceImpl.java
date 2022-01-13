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

}