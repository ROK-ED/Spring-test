package co.yo.prj.food.service;

import java.util.List;

public interface FoodService {
	List<FoodVO> foodSelectList();
	FoodVO foodSelect(FoodVO food);
	int foodInsert(FoodVO food);
	int foodDelete(FoodVO food);
	int foodUpdate(FoodVO food);
}
