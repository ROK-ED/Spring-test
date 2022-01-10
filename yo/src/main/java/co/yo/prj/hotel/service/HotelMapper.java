package co.yo.prj.hotel.service;

import java.util.List;

public interface HotelMapper {
	List<HotelVO> HotelSelectList();
	HotelVO HotelSelect(HotelVO hotel);
	int HotelInsert(HotelVO hotel);
	int HotelUpdate(HotelVO hotel);
	int HotelDelete(int hotel_id);
	
	int HotelIdUpdate(int hotel_id);
}
