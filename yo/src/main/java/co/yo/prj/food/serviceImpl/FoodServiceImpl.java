package co.yo.prj.food.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.yo.prj.food.service.FoodMapper;
import co.yo.prj.food.service.FoodService;
import co.yo.prj.food.service.FoodVO;

@Repository("foodDao")
public class FoodServiceImpl implements FoodService {

	@Autowired
	private FoodMapper map;
	
	@Override
	public List<FoodVO> foodSelectList() {
		return map.foodSelectList();
	}

	@Override
	public FoodVO foodSelect(FoodVO food) {
		return map.foodSelect(food);
	}

	@Override
	public int foodInsert(FoodVO food) {
		return map.foodInsert(food);
	}

	@Override
	public int foodDelete(FoodVO food) {
		return map.foodDelete(food);
	}

	@Override
	public int foodUpdate(FoodVO food) {
		return map.foodUpdate(food);
	}

	@Override
	public List<FoodVO> foodSelectOption(String key, String data) {
		return map.foodSelectOption(key, data);
	}

}
