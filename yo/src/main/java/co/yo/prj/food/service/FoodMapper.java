package co.yo.prj.food.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface FoodMapper {
	List<FoodVO> foodSelectList();
	FoodVO foodSelect(FoodVO food);
	int foodInsert(FoodVO food);
	int foodDelete(FoodVO food);
	int foodUpdate(FoodVO food);
	List<FoodVO> foodSelectOption(@Param("key") String key, @Param("data") String data);
	
}
