package co.yo.prj.hotel.service;

import java.util.List;

public interface HotelService {
	List<HotelVO> HotelSelectList();
	HotelVO HotelSelect(HotelVO hotel);
	int HotelInsert(HotelVO hotel);
	int HotelUpdate(HotelVO hotel);
	int HotelDelete(int hotel_id);
	
	int HotelIdUpdate(int hotel_id);
	
	List<String> HotelResSearch(String resName,String resDate);
	List<String> HotelBlock(String id);
}
