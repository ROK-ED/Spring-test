package co.yo.prj.food.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;

import co.yo.prj.food.service.FoodImgMapper;
import co.yo.prj.food.service.FoodImgService;
import co.yo.prj.food.service.FoodImgVO;

public class FoodImgServiceImpl implements FoodImgService {

	@Autowired
	private FoodImgMapper map;
	
	@Override
	public int foodImgInsert(FoodImgVO foodImg) {
		return map.foodImgInsert(foodImg);
	}

	@Override
	public FoodImgVO foodImgSelectOne(FoodImgVO foodImg) {
		return map.foodImgSelectOne(foodImg);
	}

}
