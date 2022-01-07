package co.yo.prj.food.service;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
public class FoodVO {
	
	private int food_id;
	private String food_name;
	private String food_address;
	private String food_phone;
	private String food_seat;
	private String food_ot;
	private String food_holiday;
	private String food_parking;
	private String food_menu;
	private String food_class;
	
	private double food_x;
	private double food_y;
	private Date food_date;
	private String food_score;
	private String food_visitor;
	private String food_picture1;
	private String food_pfile1;
	private String food_picture2;
	private String food_pfile2;
	private String food_picture3;
	private String food_pfile3;
	private int food_hit; //조회수
	private String food_member_email;
	
	
}
