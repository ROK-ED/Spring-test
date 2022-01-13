package co.yo.prj.food.service;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class FoodReviewVO {
	
	private int review_id;
	private String review_member_email;
	private int review_food_id;
	private String review_option;
	private String review_subject;
	private int review_place_id;
	private int review_rate;
	private int review_hit;
	
}
