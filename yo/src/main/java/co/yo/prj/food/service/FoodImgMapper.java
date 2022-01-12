package co.yo.prj.food.service;

public interface FoodImgMapper {
	int foodImgInsert(FoodImgVO foodImg);
	FoodImgVO foodImgSelectOne(String food_id);
}
