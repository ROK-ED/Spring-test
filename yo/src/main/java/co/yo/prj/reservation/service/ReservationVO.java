package co.yo.prj.reservation.service;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
@Getter
@Setter
public class ReservationVO {
	private int reservation_id;
	private int reservation_hotel_id;
	private int reservation_food_id;
	private String reservation_member_email;
	private String reservation_time;
	private Date reservation_date;
	private String reservation_option;
	private int reservation_place_id;
	private String reservation_state;
	private String hotel_title;
	private String place_name;
	private String food_name;
	private String reservation_host;
}
