package co.yo.prj.food.service;

public interface FoodImgService {
	int foodImgInsert(FoodImgVO foodImg);
	FoodImgVO foodImgSelectOne(String food_id);
}
